import 'package:circleapp/controller/utils/color/custom_color.dart';
import 'package:circleapp/controller/utils/style/customTextStyle.dart';
import 'package:circleapp/custom_widget/customwidgets.dart';
import 'package:circleapp/view/addNewPlanScreen.dart';
import 'package:circleapp/view/screens/bottom_navigation_screen/bottom_navigation_screen.dart';
import 'package:circleapp/view/screens/createNew_To_DosScreen/create_New_To_Dos_Screen.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controller/add_members_controller.dart';

class AddMembers extends StatefulWidget {
  const AddMembers({super.key, required this.title});
  final String title;

  @override
  State<AddMembers> createState() => _AddMembersState();
}

class _AddMembersState extends State<AddMembers> {
  RxList<Contact> contacts = <Contact>[].obs;
  RxBool isLoading = true.obs;

  @override
  void initState() {
    super.initState();
    getContactPermission();
  }

  void getContactPermission() async {
    if (await Permission.contacts.isGranted) {
      fetchContacts();
    } else {
      PermissionStatus status = await Permission.contacts.request();
      if (status.isGranted) {
        fetchContacts();
      }
    }
  }

  void fetchContacts() async {
    try {
      List<Contact> fetchedContacts = await ContactsService.getContacts();
      contacts.assignAll(fetchedContacts);
      isLoading.value = false;
    } catch (e) {
      print("Failed to get contacts: $e");
      isLoading.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    AddMemberController addMemberController=Get.put(AddMemberController());
    RxList<int> selectionMembersList = <int>[].obs;

    return Obx(() => Scaffold(
      backgroundColor: CustomColor.primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            getVerticalSpace(6.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 1.5.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                      size: 2.h,
                    ),
                  ),
                  getHorizentalSpace(1.5.h),
                  Text(
                    'Add Members',
                    style: CustomTextStyle.headingStyle,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.3.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getVerticalSpace(1.h),
                  Text(
                    '''Select circle members from your account''',
                    style: CustomTextStyle.hintText
                        .copyWith(color: const Color(0xffF8F8F8)),
                  ),
                  getVerticalSpace(2.5.h),
                  isLoading.value
                      ? Center(
                    child: CircularProgressIndicator(),
                  )
                      : ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: contacts.length,
                    itemBuilder: (context, index) {
                      return
                       Obx(() =>  Padding(
                         padding:
                         EdgeInsets.symmetric(vertical: 1.h),
                         child: GestureDetector(
                             onTap: () {
                               if (selectionMembersList
                                   .contains(index)) {
                                 selectionMembersList.remove(index);
                               } else {
                                 selectionMembersList.add(index);
                               }
                             },
                             child: Container(
                                 padding: EdgeInsets.symmetric(
                                     horizontal: 1.5.h,
                                     vertical: .5.h),
                                 alignment: Alignment.center,
                                 decoration: BoxDecoration(
                                     borderRadius:
                                     BorderRadius.circular(30.px),
                                     color: const Color(0xff313131)),
                                 child: Row(
                                   children: [
                                     CircleAvatar(
                                       radius: 2.5.h,
                                       backgroundColor: CustomColor
                                           .textFieldColor,
                                       backgroundImage: AssetImage(
                                           'assets/png/members.png'),
                                     ),
                                     getHorizentalSpace(1.h),
                                     Column(
                                       crossAxisAlignment:
                                       CrossAxisAlignment.start,
                                       mainAxisAlignment:
                                       MainAxisAlignment.center,
                                       children: [
                                         Text(
                                           contacts[index]
                                               .givenName ??
                                               '',
                                           style: CustomTextStyle
                                               .headingStyle
                                               .copyWith(
                                               fontSize: 12.px),
                                         ),
                                         Text(
                                           contacts[index].phones!
                                               .first.value!,
                                           style: CustomTextStyle
                                               .hintText
                                               .copyWith(
                                               color: Colors.white
                                                   .withOpacity(
                                                   0.49)),
                                         )
                                       ],
                                     ),
                                     const Expanded(child: SizedBox()),
                                     Container(
                                       height: 2.h,
                                       width: 2.h,
                                       decoration: BoxDecoration(
                                         shape: BoxShape.circle,
                                         border: Border.all(
                                             color: selectionMembersList
                                                 .contains(index)
                                                 ? CustomColor
                                                 .textFieldColor
                                                 : CustomColor
                                                 .secondaryColor),
                                       ),
                                       child: selectionMembersList
                                           .contains(index)
                                           ? SvgPicture.asset(
                                           'assets/svg/selected.svg',
                                           fit: BoxFit.cover)
                                           : SvgPicture.asset(
                                           'assets/svg/unselected.svg',
                                           fit: BoxFit.cover),
                                     ),
                                   ],
                                 ))),
                       ));
                    },
                  ),
                  getVerticalSpace(2.5.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.5.h),
                    child: customButton(
                        onTap: () {
                          if (widget.title == "addnewplan") {
                            Get.to(() =>
                            const AddNewPlan(title: "addmember"));
                          } else if (widget.title == "newtodo") {
                            Get.to(() => const CreateNewToDo());
                          } else {
                            Get.to(
                                    () => const BottomNavigationScreen());
                          }
                        },
                        backgroundColor: CustomColor.secondaryColor,
                        borderColor: CustomColor.primaryColor,
                        title: 'Done',
                        titleColor: Colors.black,
                        height: 4.5.h),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
