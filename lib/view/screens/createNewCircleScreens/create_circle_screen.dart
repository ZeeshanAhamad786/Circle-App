import 'package:circleapp/controller/utils/color/custom_color.dart';
import 'package:circleapp/controller/utils/style/customTextStyle.dart';
import 'package:circleapp/models/main_chat_screen_model.dart';
import 'package:circleapp/view/screens/createNewCircleScreens/chatScreen.dart';
import 'package:circleapp/view/screens/createNewCircleScreens/loopTabBar.dart';
import 'package:circleapp/view/screens/profile_screen/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../custom_widget/customwidgets.dart';

class CreateCircleScreen extends StatefulWidget {
  int selectedIndex;
   CreateCircleScreen({super.key,required this.selectedIndex});

  @override
  State<CreateCircleScreen> createState() => _CreateCircleScreenState();
}

class _CreateCircleScreenState extends State<CreateCircleScreen> {
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
      backgroundColor: CustomColor.mainColorBackground,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.h),
        child: Column(
          children: [
            getVerticalSpace(7.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Welcome to Circle!",
                  style: CustomTextStyle.mediumTextExplore,
                ),
               GestureDetector(onTap: () {
Get.to(()=>const ProfileScreen());
               },
                   child: CircleAvatar(backgroundImage: AssetImage("assets/png/litaProfile.png"),radius: 20,))
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
                        Get.to(() => LoopTabBar());
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 1.5.h),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: CustomColor.textFieldColor,
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
                          trailing: Column(crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              getVerticalSpace(1.h),
                              Text(
                                items[index].time,
                                style: CustomTextStyle.mediumTextTimeOpacity,
                              ),
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
