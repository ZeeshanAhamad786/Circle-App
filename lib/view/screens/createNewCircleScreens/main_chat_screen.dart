import 'package:circleapp/controller/utils/style/customTextStyle.dart';
import 'package:circleapp/models/main_chat_screen_model.dart';
import 'package:circleapp/view/screens/createNewCircleScreens/chatScreen.dart';
import 'package:circleapp/view/screens/createNewCircleScreens/choose_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controller/utils/app_colors.dart';
import '../../custom_widget/customwidgets.dart';

class MainChatScreen extends StatefulWidget {
  const MainChatScreen({Key? key}) : super(key: key);

  @override
  State<MainChatScreen> createState() => _MainChatScreenState();
}

class _MainChatScreenState extends State<MainChatScreen> {
  final RxList<MainChatScreenModel> items = [
    MainChatScreenModel(
      title: "Music Lovers",
      subtitle: "How is it going?",
      imageUrl: "assets/png/Avatar1.jpg",
      time: '15m ago',
    ),
    MainChatScreenModel(
      title: "Night Out",
      subtitle: "Good morning, did you sleep well?",
      imageUrl: "assets/png/Avatar2.jpg",
      time: '3m ago',
    ),
    MainChatScreenModel(
      title: "Countryside Travel",
      subtitle: "Aight, noted",
      imageUrl: "assets/png/Avatar3.jpg",
      time: '1h ago',
    ),
    MainChatScreenModel(
      title: "Music Lovers",
      subtitle: "How is it going?",
      imageUrl: "assets/png/Avatar1.jpg",
      time: '15m ago',
    ),
    MainChatScreenModel(
      title: "Countryside Travel",
      subtitle: "Aight, noted",
      imageUrl: "assets/png/Avatar3.jpg",
      time: '1h ago',
    ),
    MainChatScreenModel(
      title: "Music Lovers",
      subtitle: "How is it going?",
      imageUrl: "assets/png/Avatar1.jpg",
      time: '15m ago',
    ),
    MainChatScreenModel(
      title: "Countryside Travel",
      subtitle: "Aight, noted",
      imageUrl: "assets/png/Avatar3.jpg",
      time: '1h ago',
    ),
    MainChatScreenModel(
      title: "Music Lovers",
      subtitle: "How is it going?",
      imageUrl: "assets/png/Avatar1.jpg",
      time: '15m ago',
    ),
  ].obs;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          backgroundColor: AppColors.mainColorBackground,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.h),
            child: Column(
              children: [
                getVerticalSpace(7.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Circles",
                      style: CustomTextStyle.mediumTextExplore,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => ChooseImage());
                      },
                      child: Container(
                        height: 30,
                        padding: EdgeInsets.symmetric(horizontal: 2.h),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), border: Border.all(color: AppColors.mainColorYellow)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.person_add_sharp,
                              color: AppColors.mainColorYellow,
                            ),
                            getHorizentalSpace(0.5.w),
                            Text(
                              "New Group",
                              style: CustomTextStyle.mediumTextYellow,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                getVerticalSpace(2.h),
                Expanded(
                  child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: items.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.to(() => ChatScreen());
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 1.5.h),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.textFieldColor,
                            ),
                            child: ListTile(
                              title: Text(
                                items[index].title,
                                style: CustomTextStyle.mediumTextTitle,
                              ),
                              subtitle: Text(
                                items[index].subtitle,
                                style: CustomTextStyle.mediumTextSubtitle,
                              ),
                              leading: CircleAvatar(
                                maxRadius: 30,
                                backgroundImage: AssetImage(items[index].imageUrl),
                              ),
                              trailing: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    items[index].time,
                                    style: CustomTextStyle.mediumTextTime,
                                  ),
                                  getVerticalSpace(1.w),
                                  Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                          color: AppColors.mainColorYellow,
                                          borderRadius: BorderRadius.circular(30),
                                          border: Border.all(color: AppColors.mainColorYellow)),
                                      child: Center(
                                          child: Text(
                                        "12",
                                        style: CustomTextStyle.mediumTextNumber,
                                      ))),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
        ));
  }
}
