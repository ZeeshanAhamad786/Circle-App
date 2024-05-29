import 'package:circleapp/controller/api/circle_apis.dart';
import 'package:circleapp/models/circle_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../models/contact_model.dart';
import '../../view/custom_widget/customwidgets.dart';

class CreateCircleController extends GetxController {
  late final BuildContext context;
  RxBool _contactsLoading = false.obs;
  RxBool _createCircleLoading = false.obs;
  Rxn<CircleModel>? circleModel = Rxn<CircleModel>();
  TextEditingController circleNameTextController = TextEditingController();
  TextEditingController circleDescriptionTextController = TextEditingController();

  CreateCircleController(this.context);

  RxBool get contactsLoading => _contactsLoading;

  set contactsLoading(RxBool value) {
    _contactsLoading = value;
  }

  RxBool get createCircleLoading => _createCircleLoading;

  set createCircleLoading(RxBool value) {
    _createCircleLoading = value;
  }

  Future<void> createCircle({
    required bool load,
    required String circleName,
    required String circleImage,
    required String description,
    required String type,
    required String interest,
    required List<ContactSelection> contactsSelection,
  }) async {
    if (load) {
      createCircleLoading.value = true;
    }
    circleModel?.value = await CircleApis(context).createCircleApi(
        circleName: circleName,
        circleImage: circleImage,
        description: description,
        type: type,
        interest: interest,
        memberIds: getContactsFromModel(true, contactsSelection),
        phoneNumbers: getContactsFromModel(false, contactsSelection));
    createCircleLoading.value = false;
  }

  Future<RxList<ContactSelection>?> getContacts() async {
    contactsLoading.value = true;
    debugPrint("Contacts loading set to true");

    final status = await Permission.contacts.request();
    debugPrint("Permission request called");

    if (status.isDenied) {
      customScaffoldMessenger(context, "Plz allow contacts permission to proceed");
      debugPrint("Permission denied");
      contactsLoading.value = false;
      debugPrint("Contacts loading set to false");
      return null;
    } else if (status.isGranted) {
      final contactsFromPhone = await FlutterContacts.getContacts(withPhoto: true, withProperties: true);
      debugPrint("Contacts fetched from phone");

      if (contactsFromPhone.isNotEmpty) {
        for (var contact in contactsFromPhone) {
          contact.phones.first.number = contact.phones.first.number.replaceAll(RegExp(r'[^\d+]'), '');
        }
        List<String> numbers = contactsFromPhone
            .where((contact) => contact.phones.isNotEmpty)
            .map((contact) => contact.phones.first.number.replaceAll(RegExp(r'[^\d+]'), ''))
            .toList();
        debugPrint("Phone numbers extracted from contacts");

        if (numbers.isNotEmpty) {
          final value = await CircleApis(context).getIsUser(numbers);
          debugPrint("Circle API called");

          if (value != null) {
            RxList<ContactSelection> myContacts = <ContactSelection>[].obs;
            debugPrint("Creating myContacts list");

            for (int i = 0; i < value.length; i++) {
              contactsFromPhone[i].phones.first.number = numbers[i];
              myContacts.add(ContactSelection(contact: contactsFromPhone[i], isUser: value[i].isUser));
            }
            debugPrint("myContacts list populated");

            contactsLoading.value = false;
            debugPrint("Contacts loading set to false");
            return myContacts;
          } else {
            contactsLoading.value = false;
            debugPrint("Value is null, contacts loading set to false");
            return null;
          }
        } else {
          contactsLoading.value = false;
          debugPrint("Phone numbers list is empty, contacts loading set to false");
          return null;
        }
      } else {
        contactsLoading.value = false;
        debugPrint("Contacts from phone is empty, contacts loading set to false");
        return null;
      }
    } else {
      contactsLoading.value = false;
      debugPrint("Permission not granted, contacts loading set to false");
      return null;
    }
  }

  List<String> getContactsFromModel(bool areUser, List<ContactSelection> contactsSelection) {
    List<String> contactNumbers = [];
    for (var contact in contactsSelection) {
      if (contact.isUser == areUser && contact.isSelected) {
        {
          contactNumbers.add(contact.contact.phones.first.number);
        }
      }
    }
    return contactNumbers;
  }
}
