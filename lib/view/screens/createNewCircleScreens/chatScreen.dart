import 'package:circleapp/controller/getx_controllers/circle_controller.dart';
import 'package:circleapp/view/screens/createNewCircleScreens/circle_edit_screen.dart';
import 'package:circleapp/view/screens/createNewCircleScreens/loopTabBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controller/utils/app_colors.dart';
import '../../../controller/utils/style/customTextStyle.dart';
import '../../custom_widget/customwidgets.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, this.title});
  final String? title;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late CircleController circleController;
  @override
  void initState() {
    circleController = Get.put(CircleController(context));
    // circleController.getMessages(load: true, circleId: circleId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    RxList<String> chatList = <String>[].obs;
    RxList<int> pinList = <int>[].obs;
    RxInt selectedIndex = 0.obs;

    RxString messageLength = ''.obs;
    final TextEditingController chatController = TextEditingController();
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Obx(
        () => Column(
          children: [
            getVerticalSpace(6.h),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.5.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.white,
                            size: 2.5.h,
                          ),
                        ),
                        getHorizentalSpace(2.h),
                        pinList.isNotEmpty
                            ? Text(
                                "${pinList.length}",
                                style: CustomTextStyle.buttonText.copyWith(color: Colors.white),
                              )
                            : GestureDetector(
                                onTap: () {
                                  Get.to(() => const CircleEditScreen());
                                },
                                child: CircleAvatar(
                                  radius: 2.4.h,
                                  backgroundColor: AppColors.textFieldColor,
                                  backgroundImage: const AssetImage('assets/png/members.png'),
                                ),
                              ),
                        getHorizentalSpace(1.5.h),
                        pinList.isNotEmpty
                            ? const SizedBox.shrink()
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(() => const CircleEditScreen());
                                    },
                                    child: Text(
                                      'Hiking',
                                      style: CustomTextStyle.headingStyle.copyWith(fontSize: 12.px),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(() => const CircleEditScreen());
                                    },
                                    child: Text('Adil Adnan, Jhon, Liya',
                                        style: CustomTextStyle.smallText.copyWith(color: const Color(0xff797C7B), fontSize: 10.px)),
                                  )
                                ],
                              ),
                      ],
                    ),
                    Row(
                      children: [
                        pinList.isNotEmpty ? SvgPicture.asset('assets/svg/pin.svg') : SvgPicture.asset('assets/svg/audiocallicon.svg'),
                        getHorizentalSpace(1.h),
                        pinList.isNotEmpty
                            ? Row(
                                children: [
                                  Text(
                                    'Pin',
                                    style: CustomTextStyle.headingStyle,
                                  ),
                                  getHorizentalSpace(2.h),
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(() => LoopTabBar());
                                    },
                                    child: Text(
                                      'Add to convos',
                                      style: CustomTextStyle.mediumTextTab,
                                    ),
                                  ),
                                ],
                              )
                            : SvgPicture.asset('assets/svg/videocallicon.svg'),
                        getHorizentalSpace(1.h),
                        pinList.isNotEmpty
                            ? const SizedBox.shrink()
                            : widget.title == 'loop'
                                ? const SizedBox.shrink()
                                : GestureDetector(onTap: () {}, child: SvgPicture.asset('assets/svg/loopicon.svg')),
                      ],
                    )
                  ],
                )),
            Expanded(
              child: Padding(
                padding: pinList.isNotEmpty ? EdgeInsets.zero : EdgeInsets.symmetric(horizontal: 2.3.h),
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
                    Obx(
                      () => ListView.builder(
                        itemCount: chatList.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              pinList.remove(selectedIndex.value);
                            },
                            onLongPress: () {
                              selectedIndex.value = index;
                              pinList.add(selectedIndex.value);
                            },
                            child: Stack(
                              children: [
                                pinList.contains(index)
                                    ? Container(
                                        padding: EdgeInsets.only(right: 4.h),
                                        margin: EdgeInsets.only(bottom: 1.h),
                                        alignment: Alignment.centerRight,
                                        height: 7.7.h,
                                        width: MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(color: AppColors.secondaryColor.withOpacity(0.1)),
                                        child: SvgPicture.asset('assets/svg/selected.svg'),
                                      )
                                    : const SizedBox.shrink(),
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 2.5.h,
                                      backgroundImage: const AssetImage('assets/png/members.png'),
                                    ),
                                    getHorizentalSpace(1.5.h),
                                    Container(
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
                                        chatList[index],
                                        style: CustomTextStyle.buttonText,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    getVerticalSpace(3.8.h),
                    const Spacer(),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: .8.h),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.px), color: AppColors.mainColor),
                            child: Row(
                              children: [
                                SvgPicture.asset('assets/svg/icons.svg'),
                                getHorizentalSpace(.8.h),
                                Expanded(
                                  child: TextFormField(
                                    controller: chatController,
                                    onChanged: (value) {
                                      messageLength.value = value;
                                    },
                                    autocorrect: false,
                                    enableSuggestions: false,
                                    cursorHeight: 2.h,
                                    style: CustomTextStyle.hintText,
                                    cursorColor: Colors.white,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10.px),
                                        borderSide: const BorderSide(
                                          color: AppColors.textFieldColor,
                                        ),
                                      ),
                                      focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: AppColors.textFieldColor)),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10.px), borderSide: const BorderSide(color: AppColors.textFieldColor)),
                                      isCollapsed: true,
                                      contentPadding: EdgeInsets.symmetric(vertical: 1.6.h),
                                      fillColor: AppColors.textFieldColor,
                                      hintText: 'Write your message',
                                      hintStyle: CustomTextStyle.hintText,
                                    ),
                                  ),
                                ),
                                getHorizentalSpace(.8.h),
                                SvgPicture.asset('assets/svg/camera.svg'),
                              ],
                            ),
                          ),
                        ),
                        getHorizentalSpace(1.h),
                        Obx(() => messageLength.value.isEmpty
                            ? SvgPicture.asset('assets/svg/voicerecorder.svg')
                            : GestureDetector(
                                onTap: () {
                                  chatList.add(chatController.text);
                                  chatController.clear();
                                },
                                child: Container(
                                  height: 4.5.h,
                                  width: 4.h,
                                  decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.secondaryColor),
                                  child: Icon(
                                    Icons.send,
                                    size: 2.h,
                                  ),
                                ),
                              ))
                      ],
                    ),
                    getVerticalSpace(2.2.h)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
