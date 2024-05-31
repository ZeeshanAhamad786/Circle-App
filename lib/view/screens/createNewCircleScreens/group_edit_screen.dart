import 'package:circleapp/controller/utils/app_colors.dart';
import 'package:circleapp/controller/utils/customTextStyle.dart';
import 'package:circleapp/models/group_member_model.dart';
import 'package:circleapp/view/screens/createNewCircleScreens/change_circle_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../custom_widget/customwidgets.dart';

class GroupEditScreen extends StatefulWidget {
  const GroupEditScreen({Key? key}) : super(key: key);

  @override
  State<GroupEditScreen> createState() => _GroupEditScreenState();
}

class _GroupEditScreenState extends State<GroupEditScreen> {
  List<GroupMemberModel> group = [
    GroupMemberModel(name: 'Lita han', imagePath: 'assets/png/litaProfile.png'),
    GroupMemberModel(name: 'Lita han', imagePath: 'assets/png/litaProfile.png'),
    GroupMemberModel(name: 'Lita han', imagePath: 'assets/png/litaProfile.png'),
    GroupMemberModel(name: 'Lita han', imagePath: 'assets/png/litaProfile.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColorBackground,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.h),
          child: Column(
            children: [
              getVerticalSpace(8.h),
              Stack(
                children: [
                  Center(
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/png/groupImage.png"),
                      radius: 50,
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 6,
                    child: GestureDetector(
                      onTap: () => Get.back(),
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: PopupMenuButton<String>(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      icon: Icon(
                        Icons.more_vert,
                        color: Colors.white,
                      ),
                      itemBuilder: (BuildContext context) {
                        return [
                          PopupMenuItem<String>(
                            value: '',
                            child: Text(
                              'Add members',
                              style: CustomTextStyle.mediumTextM14,
                            ),
                          ),
                          PopupMenuItem<String>(
                            value: '',
                            child: GestureDetector(
                                onTap: () {
                                  Get.to(() => ChangeCircleName());
                                },
                                child: Text(
                                  'Change circle name',
                                  style: CustomTextStyle.mediumTextM14,
                                )),
                          ),
                          // Add more items if needed
                        ];
                      },
                      color: AppColors.textFieldColor,
                    ),
                  ),
                ],
              ),
              getVerticalSpace(1.h),
              Text(
                "Hiking",
                style: CustomTextStyle.mediumTextTitle,
              ),
              getVerticalSpace(0.5.h),
              Text(
                "Group: 5 members",
                style: CustomTextStyle.mediumTextGroup,
              ),
              getVerticalSpace(2.2.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/svg/call.svg"),
                  getHorizentalSpace(3.w),
                  SvgPicture.asset("assets/svg/video.svg"),
                  getHorizentalSpace(3.w),
                  SvgPicture.asset("assets/svg/convas.svg"),
                ],
              ),
              getVerticalSpace(8.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Circle name",
                    style: CustomTextStyle.mediumTextSubtitle,
                  ),
                  Text(
                    "Hiking",
                    style: CustomTextStyle.mediumTextM14,
                  ),
                  Divider(
                    color: Colors.white.withOpacity(0.2),
                  ),
                  Text(
                    "description",
                    style: CustomTextStyle.mediumTextSubtitle,
                  ),
                  Text(
                    "Lorem ipsum dolor sit amet consectetur. Eget aliquam suspendisse ultrices a mattis vitae. Adipiscing id vestibulum ultrices lorem.",
                    style: TextStyle(fontSize: 10.px, fontWeight: FontWeight.w400, fontFamily: "medium", color: Colors.white.withOpacity(0.6)),
                  ),
                  Divider(
                    color: Colors.white.withOpacity(0.2),
                  ),
                  Text(
                    "Circle type",
                    style: CustomTextStyle.mediumTextSubtitle,
                  ),
                  Text(
                    "Friends",
                    style: CustomTextStyle.mediumTextM14,
                  ),
                  Divider(
                    color: Colors.white.withOpacity(0.2),
                  ),
                  Text(
                    "Interests",
                    style: CustomTextStyle.mediumTextSubtitle,
                  ),
                  Text(
                    "Traveling",
                    style: CustomTextStyle.mediumTextM14,
                  ),
                  Divider(
                    color: Colors.white.withOpacity(0.2),
                  ),
                  Text(
                    "Group members",
                    style: CustomTextStyle.mediumTextSubtitle,
                  ),
                  ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: group.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(top: 1.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage(group[index].imagePath),
                              ),
                              getHorizentalSpace(2.w),
                              Text(
                                group[index].name,
                                style: CustomTextStyle.mediumTextTime,
                              )
                            ],
                          ),
                        );
                      })
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
