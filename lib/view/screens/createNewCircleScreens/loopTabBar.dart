import 'package:circleapp/controller/utils/app_colors.dart';
import 'package:circleapp/controller/utils/customTextStyle.dart';
import 'package:circleapp/view/addNewPlanScreen.dart';
import 'package:circleapp/view/screens/createNew_To_DosScreen/create_New_To_Dos_Screen.dart';
import 'package:circleapp/view/screens/dinnerPlanScreens/dinnerPlan_Details.dart';
import 'package:circleapp/view/screens/tripPlanScreens/winterTripPlanDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../models/explore-model.dart';
import '../../custom_widget/customwidgets.dart';
import '../story_screen.dart';
import 'chatScreen.dart';

class LoopTabBar extends StatelessWidget {
  LoopTabBar({super.key, });


  @override
  Widget build(BuildContext context) {
    final List<ExploreModel> data = [
      ExploreModel(
          birdOffer: "Early Bird Offer",
          totalPrice: "\$2500",
          date: "1/2/2024",
          concertName: "Imagine Dragon’s Concert",
          discription:
          "Lorem ipsum dolor sit amet consectetur. Eget aliquam suspendisse ultrices a mattis vitae. Adipiscing id vestibulum ultrices lorem. Nibh dignissim bibendum aAdipi.",
          offerFor: "5 people",
          interest: "Music",
          images: ["assets/png/png4.png", "assets/png/png3.png", "assets/png/png2.png", "assets/png/png1.png"], location: '', ),
      ExploreModel(
          birdOffer: "Early Bird Offer",
          totalPrice: "\$2500",
          date: "1/2/2024",
          concertName: "Imagine Dragon’s Concert",
          discription:
          "Lorem ipsum dolor sit amet consectetur. Eget aliquam suspendisse ultrices a mattis vitae. Adipiscing id vestibulum ultrices lorem. Nibh dignissim bibendum aAdipi.",
          offerFor: "5 people",
          interest: "Music",
          images: ["assets/png/png4.png", "assets/png/png3.png", "assets/png/png2.png", "assets/png/png1.png"], location: ''),
      ExploreModel(
          birdOffer: "Early Bird Offer",
          totalPrice: "\$2500",
          date: "1/2/2024",
          concertName: "Imagine Dragon’s Concert",
          discription:
          "Lorem ipsum dolor sit amet consectetur. Eget aliquam suspendisse ultrices a mattis vitae. Adipiscing id vestibulum ultrices lorem. Nibh dignissim bibendum aAdipi.",
          offerFor: "5 people",
          interest: "Music",
          images: ["assets/png/png4.png", "assets/png/png3.png", "assets/png/png2.png", "assets/png/png1.png"], location: '')
    ];

    final List<String> imageUrls = ["assets/png/png4.png", "assets/png/png3.png", "assets/png/png2.png", "assets/png/png1.png"];
    RxList<String> name = <String>['     Canvas    ', '     To-Dos    ', 'Experiences'].obs;
    RxInt selectedIndex = 0.obs;
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body:
      Obx(
        () => SingleChildScrollView(
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
                      'Hiking',
                      style: CustomTextStyle.headingStyle,
                    ),
                    const Expanded(child: SizedBox()),
                    GestureDetector(
                        onTap: () {
                          if (selectedIndex.value == 0) {
                            Get.to(() => const ChatScreen(
                                  title: 'loop',
                                ));
                          } else if (selectedIndex.value == 1) {
                            Get.to(() => const CreateNewToDo());
                          } else {
                            Get.to(() => const AddNewPlan(title: 'loop'));
                          }
                        },
                        child: customTextButton1())
                  ],
                ),
              ),
              getVerticalSpace(1.5.h),
              Container(
                alignment: Alignment.center,
                height: 4.h,
                width: MediaQuery.of(context).size.width - 1.5.h,
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: name.length,
                  itemBuilder: (context, index) {
                    return Obx(
                      () => GestureDetector(
                        onTap: () {
                          selectedIndex.value = index;
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 1.5.h),
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(horizontal: 1.5.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: index == 1
                                      ? Radius.circular(0.px)
                                      : index == 2
                                          ? Radius.circular(0.px)
                                          : Radius.circular(20.px),
                                  bottomLeft: index == 1
                                      ? Radius.circular(0.px)
                                      : index == 2
                                          ? Radius.circular(0.px)
                                          : Radius.circular(20.px),
                                  topRight: index == 2 ? Radius.circular(20.px) : Radius.circular(0.px),
                                  bottomRight: index == 2 ? Radius.circular(20.px) : Radius.circular(0.px)),
                              color: selectedIndex.value == index ? AppColors.secondaryColor : AppColors.textFieldColor),
                          child: Text(
                            name[index],
                            style: CustomTextStyle.smallText
                                .copyWith(fontSize: 12.px, color: selectedIndex.value == index ? Colors.black : Colors.white),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              getVerticalSpace(1.3.h),
              selectedIndex.value == 0
                  ? Column(
                      children: [
                        SizedBox(
                          height: 7.h,
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 8,
                            itemExtent: 9.h,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(horizontal: .8.h),
                                child: GestureDetector(
                                  onTap: () {
                                    Get.to(() => StoryScreen());
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(border: Border.all(color: AppColors.secondaryColor), shape: BoxShape.circle),
                                    child: CircleAvatar(
                                      radius: 5.6.h,
                                      backgroundColor: AppColors.mainColor,
                                      backgroundImage: const AssetImage(
                                        'assets/png/story.png',
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.3.h),
                          child: Column(
                            children: [
                              getVerticalSpace(3.8.h),
                              Container(
                                alignment: Alignment.center,
                                height: 3.2.h,
                                width: 6.3.h,
                                decoration: BoxDecoration(color: AppColors.textFieldColor, borderRadius: BorderRadius.circular(5.px)),
                                child: Text(
                                  'Today',
                                  style: CustomTextStyle.smallText.copyWith(fontSize: 9.px),
                                ),
                              ),
                              getVerticalSpace(2.h),
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: 3,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 1.h),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 2.5.h,
                                              backgroundImage: const AssetImage('assets/png/members.png'),
                                            ),
                                            getHorizentalSpace(1.5.h),
                                            Expanded(
                                              child: Container(
                                                margin: EdgeInsets.symmetric(vertical: 1.h),
                                                alignment: Alignment.center,
                                                padding: EdgeInsets.all(1.h),
                                                decoration: BoxDecoration(
                                                    color: AppColors.mainColor,
                                                    borderRadius: BorderRadius.only(
                                                      bottomLeft: Radius.circular(10.px),
                                                      bottomRight: Radius.circular(10.px),
                                                      topRight: Radius.circular(10.px),
                                                    )),
                                                child: Text(
                                                  "Hello ! Nazrul How are you? what's new?@davidbackem",
                                                  style: CustomTextStyle.buttonText,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          'Lita mention you',
                                          style: CustomTextStyle.hintText.copyWith(color: Color(0xff797C7B)),
                                        )
                                      ],
                                    ),
                                  );
                                },
                              ),
                              getVerticalSpace(1.6.h),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 1.h),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      children: [
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            CircleAvatar(
                                              radius: 2.5.h,
                                              backgroundImage: const AssetImage('assets/png/members.png'),
                                            ),
                                            getVerticalSpace(4.h)
                                          ],
                                        ),
                                        getHorizentalSpace(1.5.h),
                                        Expanded(
                                          child: Container(
                                              margin: EdgeInsets.symmetric(vertical: 1.h),
                                              alignment: Alignment.center,
                                              padding: EdgeInsets.all(1.h),
                                              decoration: BoxDecoration(
                                                  color: AppColors.mainColor,
                                                  borderRadius: BorderRadius.only(
                                                    bottomLeft: Radius.circular(10.px),
                                                    bottomRight: Radius.circular(10.px),
                                                    topRight: Radius.circular(10.px),
                                                  )),
                                              child: Container(
                                                alignment: Alignment.centerLeft,
                                                height: 7.h,
                                                child: ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  itemCount: 5,
                                                  shrinkWrap: true,
                                                  scrollDirection: Axis.horizontal,
                                                  itemBuilder: (context, index) {
                                                    return Container(
                                                        margin: EdgeInsets.symmetric(horizontal: 1.h, vertical: .2.h),
                                                        height: 7.h,
                                                        width: 7.h,
                                                        decoration: BoxDecoration(
                                                            color: AppColors.mainColorBackground,
                                                            borderRadius: BorderRadius.circular(5.px),
                                                            image: const DecorationImage(
                                                                image: AssetImage('assets/png/postimage.jpeg'), fit: BoxFit.cover)));
                                                  },
                                                ),
                                              )),
                                        )
                                      ],
                                    ),
                                    Text(
                                      'Lita mention you',
                                      style: CustomTextStyle.hintText.copyWith(color: Color(0xff797C7B)),
                                    ),
                                    getVerticalSpace(1.4.h),
                                    ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: 2,
                                      physics: const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return Row(
                                          children: [
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                CircleAvatar(
                                                  radius: 2.5.h,
                                                  backgroundImage: const AssetImage('assets/png/members.png'),
                                                ),
                                                SizedBox(
                                                  height: 10.h,
                                                )
                                              ],
                                            ),
                                            getHorizentalSpace(1.5.h),
                                            Expanded(
                                              child: Container(
                                                margin: EdgeInsets.symmetric(vertical: 1.h),
                                                alignment: Alignment.center,
                                                padding: EdgeInsets.all(1.h),
                                                decoration: BoxDecoration(
                                                  color: AppColors.mainColor,
                                                  borderRadius: BorderRadius.circular(20.px),
                                                ),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Winter trip Plan',
                                                      style: CustomTextStyle.headingStyle,
                                                    ),
                                                    Text(
                                                      '''Lorem ipsum dolor sit amet consectetur. Eget aliquam suspendisse ultrices a mattis vitae. Adipiscing id vestibulum ultrices lorem.''',
                                                      style: CustomTextStyle.hintText,
                                                    ),
                                                    getVerticalSpace(.4.h),
                                                    Row(
                                                      children: [
                                                        SizedBox(
                                                          height: 3.1.h,
                                                          child: ListView.builder(
                                                            padding: EdgeInsets.zero,
                                                            shrinkWrap: true,
                                                            scrollDirection: Axis.horizontal,
                                                            itemCount: 4,
                                                            itemExtent: 4.h,
                                                            itemBuilder: (context, index) {
                                                              return Padding(
                                                                padding: EdgeInsets.symmetric(horizontal: .3.h),
                                                                child: Container(
                                                                  decoration: BoxDecoration(
                                                                      border: Border.all(color: AppColors.secondaryColor), shape: BoxShape.circle),
                                                                  child: CircleAvatar(
                                                                    radius: 5.6.h,
                                                                    backgroundColor: AppColors.mainColor,
                                                                    backgroundImage: const AssetImage('assets/png/story.png'),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                        const Expanded(child: SizedBox()),
                                                        GestureDetector(
                                                            onTap: () {
                                                              Get.to(() => WinterTripPlanDetails());
                                                            },
                                                            child: customTextButton2())
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )

                  : selectedIndex.value == 1
                      ? ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              if (index == 0 || index == 1) {
                                Get.to(() => const DinnerPlanDetails());
                              } else {
                                Get.to(() => const WinterTripPlanDetails());
                              }
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.3.h),
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(horizontal: 1.9.h, vertical: 1.4.h),
                              decoration: BoxDecoration(
                                color: AppColors.mainColor,
                                borderRadius: BorderRadius.circular(20.px),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Hiking',
                                        style: CustomTextStyle.headingStyle,
                                      ),
                                      const Expanded(child: SizedBox()),
                                      RichText(
                                          text: TextSpan(children: [
                                        TextSpan(
                                            text: 'Total Bill: ',
                                            style: CustomTextStyle.smallText.copyWith(color: const Color(0xffFFFFFF).withOpacity(0.48))),
                                        TextSpan(text: '\$2500', style: CustomTextStyle.smallText),
                                      ])),
                                    ],
                                  ),
                                  getVerticalSpace(.6.h),
                                  RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                        text: 'Status: ',
                                        style: CustomTextStyle.smallText.copyWith(color: const Color(0xffFFFFFF).withOpacity(0.48))),
                                    TextSpan(text: 'Pending', style: CustomTextStyle.smallText.copyWith(color: AppColors.secondaryColor)),
                                  ])),
                                  getVerticalSpace(.6.h),
                                  Text(
                                    'Splitting Bill',
                                    style: CustomTextStyle.buttonText,
                                  ),
                                  getVerticalSpace(.6.h),
                                  Row(
                                    children: [
                                      SizedBox(
                                        height: 3.1.h,
                                        child: ListView.builder(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemCount: 4,
                                          itemExtent: 4.h,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding: EdgeInsets.symmetric(horizontal: .3.h),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    border: Border.all(color: AppColors.secondaryColor), shape: BoxShape.circle),
                                                child: CircleAvatar(
                                                  radius: 5.6.h,
                                                  backgroundColor: AppColors.mainColor,
                                                  backgroundImage: const AssetImage('assets/png/story.png'),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      const Expanded(child: SizedBox()),
                                      customTextButton2()
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      )
                      :
              // Padding(
              //             padding: EdgeInsets.symmetric(horizontal: 2.3.h),
              //             child: Column(
              //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 getVerticalSpace(2.h),
              //                 Text(
              //                   'Upcoming Plans',
              //                   style: CustomTextStyle.buttonText.copyWith(color: Colors.white),
              //                 ),
              //                 GestureDetector(
              //                   onTap: () {
              //                     Get.to(() => WinterTripPlanDetails());
              //                   },
              //                   child: ListView.builder(
              //                     padding: EdgeInsets.zero,
              //                     shrinkWrap: true,
              //                     itemCount: 2,
              //                     physics: const NeverScrollableScrollPhysics(),
              //                     itemBuilder: (context, index) {
              //                       return Dismissible(
              //                         background: Container(
              //                           padding: EdgeInsets.only(right: 4.h),
              //                           alignment: Alignment.centerRight,
              //                           decoration: BoxDecoration(
              //                             color: AppColors.secondaryColor,
              //                             borderRadius: BorderRadius.circular(10.px),
              //                           ),
              //                           child: SvgPicture.asset('assets/svg/deleteicon.svg'),
              //                         ),
              //                         key: Key(index.toString()),
              //                         child: GestureDetector(
              //                           onTap: () {
              //                             Get.to(() => WinterTripPlanDetails());
              //                           },
              //                           child: Container(
              //                             margin: EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.9.h),
              //                             alignment: Alignment.center,
              //                             padding: EdgeInsets.all(1.h),
              //                             decoration: BoxDecoration(
              //                               color: AppColors.mainColor,
              //                               borderRadius: BorderRadius.circular(10.px),
              //                             ),
              //                             child: Column(
              //                               crossAxisAlignment: CrossAxisAlignment.start,
              //                               mainAxisAlignment: MainAxisAlignment.start,
              //                               children: [
              //                                 Row(
              //                                   crossAxisAlignment: CrossAxisAlignment.center,
              //                                   children: [
              //                                     CircleAvatar(
              //                                       radius: .5.h,
              //                                       backgroundColor: Colors.green,
              //                                     ),
              //                                     getHorizentalSpace(.8.h),
              //                                     Text(
              //                                       'Winter trip Plan',
              //                                       style: CustomTextStyle.headingStyle,
              //                                     ),
              //                                     const Expanded(child: SizedBox()),
              //                                     Text(
              //                                       '10:00-13:00',
              //                                       style: CustomTextStyle.hintText,
              //                                     ),
              //                                     getVerticalSpace(1.h),
              //                                   ],
              //                                 ),
              //                                 Row(
              //                                   children: [
              //                                     getHorizentalSpace(2.h),
              //                                     Expanded(
              //                                         child: Text(
              //                                       ''' will be a sunny day''',
              //                                       style: CustomTextStyle.hintText,
              //                                     )),
              //                                     GestureDetector(
              //                                       onTap: () {
              //                                         Get.to(() => WinterTripPlanDetails());
              //                                       },
              //                                       child: customTextButton2(
              //                                           title: 'Booked', bgColor: AppColors.secondaryColor, btnTextColor: Colors.black),
              //                                     )
              //                                   ],
              //                                 ),
              //                               ],
              //                             ),
              //                           ),
              //                         ),
              //                       );
              //                     },
              //                   ),
              //                 ),
              //                 getVerticalSpace(1.5.h),
              //                 Text(
              //                   'Saved',
              //                   style: CustomTextStyle.buttonText.copyWith(color: Colors.white),
              //                 ),
              //                 GestureDetector(
              //                   onTap: () {
              //                     Get.to(() => WinterTripPlanDetails());
              //                   },
              //                   child: ListView.builder(
              //                     padding: EdgeInsets.zero,
              //                     shrinkWrap: true,
              //                     itemCount: 2,
              //                     physics: const NeverScrollableScrollPhysics(),
              //                     itemBuilder: (context, index) {
              //                       return Dismissible(
              //                         background: Container(
              //                           padding: EdgeInsets.only(right: 4.h),
              //                           alignment: Alignment.centerRight,
              //                           decoration: BoxDecoration(
              //                             color: AppColors.secondaryColor,
              //                             borderRadius: BorderRadius.circular(10.px),
              //                           ),
              //                           child: SvgPicture.asset('assets/svg/saveicon.svg'),
              //                         ),
              //                         key: Key(index.toString()),
              //                         child: Container(
              //                           margin: EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.9.h),
              //                           alignment: Alignment.center,
              //                           padding: EdgeInsets.all(1.h),
              //                           decoration: BoxDecoration(
              //                             color: AppColors.mainColor,
              //                             borderRadius: BorderRadius.circular(10.px),
              //                           ),
              //                           child: Column(
              //                             crossAxisAlignment: CrossAxisAlignment.start,
              //                             mainAxisAlignment: MainAxisAlignment.start,
              //                             children: [
              //                               Row(
              //                                 crossAxisAlignment: CrossAxisAlignment.center,
              //                                 children: [
              //                                   CircleAvatar(
              //                                     radius: .5.h,
              //                                     backgroundColor: Colors.green,
              //                                   ),
              //                                   getHorizentalSpace(.8.h),
              //                                   Text(
              //                                     'Winter trip Plan',
              //                                     style: CustomTextStyle.headingStyle,
              //                                   ),
              //                                   const Expanded(child: SizedBox()),
              //                                   Text(
              //                                     '10:00-13:00',
              //                                     style: CustomTextStyle.hintText,
              //                                   ),
              //                                   getVerticalSpace(1.h),
              //                                 ],
              //                               ),
              //                               Row(
              //                                 children: [
              //                                   getHorizentalSpace(2.h),
              //                                   Expanded(
              //                                       child: Text(
              //                                     ''' will be a sunny day''',
              //                                     style: CustomTextStyle.hintText,
              //                                   )),
              //                                 ],
              //                               ),
              //                             ],
              //                           ),
              //                         ),
              //                       );
              //                     },
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ),
              getVerticalSpace(3.h),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 3.h),
                child: Align(alignment: Alignment.centerLeft,
                  child: Text('Upcoming Plans',
                                      style: CustomTextStyle.buttonText.copyWith(color: Colors.white),
                                    ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Get.to(() => EarlyBirdOffer());
                },
                child: SizedBox(height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.zero,
                      itemCount: data.length,
                      itemBuilder: (BuildContext, index) {
                        return Dismissible(
                          background: Container(decoration:  BoxDecoration(color: AppColors.mainColorYellow,
                              borderRadius: BorderRadius.circular(20)),
                            child: Icon(Icons.delete),
                          ),
                          key: Key("$index"),
                          onDismissed: (DismissDirection) {
                            data.removeAt(index);
                          },
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            padding: EdgeInsets.symmetric(horizontal: 2.2.h, vertical: 2.h),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: AppColors.textFieldColor),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      data[index].birdOffer,
                                      style: CustomTextStyle.mediumTextM14,
                                    ),
                                    Expanded(child: SizedBox()),
                                    Text(
                                      "Total Price:",
                                      style: TextStyle(
                                          color: Colors.white.withOpacity(0.5), fontSize: 11.px, fontWeight: FontWeight.w400, fontFamily: "medium"),
                                    ),
                                    Text(
                                      data[index].totalPrice,
                                      style: CustomTextStyle.mediumTextM,
                                    ),
                                  ],
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    data[index].date,
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.5), fontSize: 11.px, fontWeight: FontWeight.w400, fontFamily: "medium"),
                                  ),
                                ),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      data[index].concertName,
                                      style: CustomTextStyle.mediumMixLightWhite,
                                    )),
                                getVerticalSpace(.3.h),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    data[index].discription,
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.7), fontSize: 10.px, fontWeight: FontWeight.w400, fontFamily: "medium"),
                                  ),
                                ),
                                getVerticalSpace(1.h),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Offer for:",
                                      style: TextStyle(
                                          color: Colors.white.withOpacity(0.5), fontSize: 11.px, fontWeight: FontWeight.w400, fontFamily: "medium"),
                                    ),
                                    getHorizentalSpace(1.w),
                                    Text(
                                      data[index].offerFor,
                                      style: CustomTextStyle.mediumTextM,
                                    ),
                                  ],
                                ),
                                getVerticalSpace(1.h),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Interests:",
                                      style: TextStyle(
                                          color: Colors.white.withOpacity(0.5), fontSize: 11.px, fontWeight: FontWeight.w400, fontFamily: "medium"),
                                    ),
                                    getHorizentalSpace(1.w),
                                    Text(
                                      data[index].interest,
                                      style: CustomTextStyle.mediumTextM,
                                    ),
                                  ],
                                ),
                                getVerticalSpace(1.2.h),
                                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "images",
                                      style: TextStyle(
                                          color: Colors.white.withOpacity(0.7), fontSize: 11.px, fontWeight: FontWeight.w400, fontFamily: "medium"),
                                    ),
                                    Container(
                                        height: 3.h,
                                        width: 18.w,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(30),color: AppColors.mainColorYellow),
                                        child: Center(
                                            child: Text(
                                              "Booked",
                                              style: TextStyle(fontSize: 10.px, fontWeight: FontWeight.w400, fontFamily: 'medium', color: AppColors.mainColorLogin)
                                            )))
                                  ],
                                ),
                                getVerticalSpace(1.h),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: SizedBox(
                                          height: 40,
                                          child: ListView.builder(
                                              shrinkWrap: true,
                                              scrollDirection: Axis.horizontal,
                                              itemCount: imageUrls.length,
                                              itemBuilder: (BuildContext, index) {
                                                return Padding(
                                                  padding: const EdgeInsets.all(2),
                                                  child: Image.asset(
                                                    imageUrls[index],
                                                    width: 27,
                                                    height: 27,
                                                  ),
                                                );
                                              }),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        getHorizentalSpace(1.w),
                                        SvgPicture.asset("assets/svg/shareButton.svg"),
                                        getHorizentalSpace(1.w),
                                        Container(
                                            height: 3.h,
                                            width: 22.w,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(30), border: Border.all(color: AppColors.mainColorYellow)),
                                            child: Center(
                                                child: Text(
                                                  "View Details",
                                                  style: CustomTextStyle.mediumTextYellow,
                                                )))
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
