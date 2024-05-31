import 'package:circleapp/controller/api/circle_apis.dart';
import 'package:circleapp/models/circle_model.dart';
import 'package:circleapp/models/messages_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../models/contact_model.dart';
import '../../view/custom_widget/customwidgets.dart';

class CircleController extends GetxController {
  late final BuildContext context;
  CircleController(this.context);

  //Variables
  RxBool _contactsLoading = false.obs;
  RxBool _createCircleLoading = false.obs;
  RxBool _messagesLoading = false.obs;
  Rxn<CircleModel>? circleModel = Rxn<CircleModel>();
  Rxn<MessagesModel>? messagesModel = Rxn<MessagesModel>();
  TextEditingController circleNameTextController = TextEditingController();
  TextEditingController circleDescriptionTextController = TextEditingController();

  //Getters and Setters
  RxBool get contactsLoading => _contactsLoading;

  set contactsLoading(RxBool value) {
    _contactsLoading = value;
  }

  RxBool get createCircleLoading => _createCircleLoading;

  set createCircleLoading(RxBool value) {
    _createCircleLoading = value;
  }

  RxBool get messagesLoading => _messagesLoading;

  set messagesLoading(RxBool value) {
    _messagesLoading = value;
  }

  //API Methods
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

  Future<void> getMessages({required bool load, required String circleId}) async {
    if (load) {
      createCircleLoading.value = true;
    }

    messagesModel?.value = await CircleApis(context).getMessages(circleId: circleId);
    createCircleLoading.value = false;
  }

  //Supporting Methods
  Future<RxList<ContactSelection>?> getContacts() async {
    contactsLoading.value = true;

    final status = await Permission.contacts.request();

    if (status.isDenied) {
      customScaffoldMessenger(context, "Plz allow contacts permission to proceed");
      contactsLoading.value = false;
      return null;
    } else if (status.isGranted) {
      final contactsFromPhone = await FlutterContacts.getContacts(withPhoto: true, withProperties: true);

      if (contactsFromPhone.isNotEmpty) {
        for (var contact in contactsFromPhone) {
          contact.phones.first.number = contact.phones.first.number.replaceAll(RegExp(r'[^\d+]'), '');
        }
        List<String> numbers = contactsFromPhone
            .where((contact) => contact.phones.isNotEmpty)
            .map((contact) => contact.phones.first.number.replaceAll(RegExp(r'[^\d+]'), ''))
            .toList();

        if (numbers.isNotEmpty) {
          final value = await CircleApis(context).getIsUser(numbers: numbers);

          if (value != null) {
            RxList<ContactSelection> myContacts = <ContactSelection>[].obs;

            for (int i = 0; i < value.length; i++) {
              contactsFromPhone[i].phones.first.number = numbers[i];
              myContacts.add(ContactSelection(contact: contactsFromPhone[i], isUser: value[i].isUser));
            }

            contactsLoading.value = false;
            return myContacts;
          } else {
            contactsLoading.value = false;
            return null;
          }
        } else {
          contactsLoading.value = false;
          return null;
        }
      } else {
        contactsLoading.value = false;
        return null;
      }
    } else {
      contactsLoading.value = false;
      return null;
    }
  }

  List<String> getContactsFromModel(bool areUser, List<ContactSelection> contactsSelection) {
    List<String> contactNumbers = [];
    for (var contact in contactsSelection) {
      if (contact.isUser == areUser && contact.isSelected) {
        {
          if (areUser) {
            contactNumbers.add(contact.contact.id);
          } else {
            contactNumbers.add(contact.contact.phones.first.number);
          }
        }
      }
    }
    return contactNumbers;
  }
}
