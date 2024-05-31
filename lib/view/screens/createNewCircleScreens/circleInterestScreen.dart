import 'package:circleapp/controller/getx_controllers/createcircle_controller.dart';
import 'package:circleapp/controller/utils/app_colors.dart';
import 'package:circleapp/controller/utils/customTextStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../models/contact_model.dart';
import '../../custom_widget/customwidgets.dart';
import 'addMembersScreen.dart';

class CircleInterest extends StatefulWidget {
  const CircleInterest({super.key});

  @override
  State<CircleInterest> createState() => _CircleInterestState();
}

class _CircleInterestState extends State<CircleInterest> {
  RxList<ContactSelection> myContacts = <ContactSelection>[].obs;
  late CreateCircleController createCircleController;
  late RxInt selectedIndex = (-1).obs;

  @override
  void initState() {
    createCircleController = Get.put(CreateCircleController(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    RxList<String> interests =
        <String>['Photography', 'Shopping', 'Music', 'Movies', 'Fitness', 'Travelling', 'Sports', 'Video Games', 'Night Out', 'Art'].obs;
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Obx(() {
        return Column(
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
                    'Circle interests',
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
                    '''share what your group is intreasted in and activites you participate in to recive exclusive offers for your circle!''',
                    style: CustomTextStyle.hintText.copyWith(color: const Color(0xffF8F8F8)),
                  ),
                  getVerticalSpace(3.h),
                  GridView.builder(
                    itemCount: interests.length,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, crossAxisSpacing: 2.h, mainAxisSpacing: 1.4.h, childAspectRatio: 4),
                    itemBuilder: (context, index) {
                      return Obx(
                        () => GestureDetector(
                          onTap: () {
                            selectedIndex.value = index;
                          },
                          child: customRadioButton(
                            title: interests[index],
                            borderColor: selectedIndex.value == index ? AppColors.textFieldColor : AppColors.secondaryColor,
                            assetsImage: selectedIndex.value == index
                                ? SvgPicture.asset('assets/svg/selected.svg')
                                : SvgPicture.asset('assets/svg/unselected.svg'),
                          ),
                        ),
                      );
                    },
                  ),
                  getVerticalSpace(4.7.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.2.h),
                    child: customButton(
                        onTap: () async {
                          if (selectedIndex.value > -1) {
                            Get.to(
                              () => const AddMembers(
                                title: '',
                              ),
                              arguments: {
                                'text': Get.arguments['text'],
                                'description': Get.arguments['description'],
                                'type': Get.arguments['type'],
                                'imageUrl': Get.arguments['imageUrl'],
                                'interest': interests[selectedIndex.value],
                              },
                            );
                          } else {
                            customScaffoldMessenger(context, "Plz select at least one interest");
                          }
                        },
                        backgroundColor: AppColors.secondaryColor,
                        borderColor: AppColors.primaryColor,
                        // title: '${circleName[selectedIndex.value]}',
                        title: 'Continue',
                        titleColor: Colors.black,
                        height: 4.5.h),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
