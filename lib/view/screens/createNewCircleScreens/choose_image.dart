import 'dart:io';
import 'package:circleapp/controller/paymentController.dart';
import 'package:circleapp/controller/utils/style/customTextStyle.dart';
import 'package:circleapp/custom_widget/customwidgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../controller/utils/color/custom_color.dart';
import '../../../../custom_widget/custom-button.dart';
import '../../../controller/api/auth_apis.dart';
import '../../../controller/auth_controller/profile_image_upload_new_controller.dart';
import '../../../controller/auth_controller/profileimageupload_controller.dart';

class ChooseImage extends StatefulWidget {
  const ChooseImage({super.key});

  @override
  State<ChooseImage> createState() => _ChooseImageState();
}

class _ChooseImageState extends State<ChooseImage> {
  ProfileImageUploadNewController profileImageUploadNewController =
      Get.put(ProfileImageUploadNewController());
  late ProfileUploadImageController profileUploadImageController;
  late AuthApis authApis;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    profileUploadImageController =
        Get.put(ProfileUploadImageController(context));
    authApis = AuthApis(context);
    profileImageUploadNewController.getTokenFromSharedPreference();
  }

  @override
  Widget build(BuildContext context) {
    final PaymentController paymentController = Get.put(PaymentController());
    RxBool backButton = false.obs;
    RxBool nextButton = true.obs;
    return Scaffold(
      backgroundColor: CustomColor.mainColorBackground,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.h),
        child: Obx(
          () => Column(
            children: [
              SizedBox(
                height: 11.h,
              ),
              Center(
                  child: Text(
                "Select your picture",
                style: CustomTextStyle.mediumTextL,
              )),
              SizedBox(
                height:
                    paymentController.pickedImage.value != null ? 4.h : 14.h,
              ),
              paymentController.pickedImage.value != null
                  ? Container(
                      height: 46.6.h,
                      decoration: BoxDecoration(
                        color: CustomColor.textFieldColor,
                        borderRadius: BorderRadius.circular(
                          20.px,
                        ),
                      ),
                      child: paymentController.pickedImage.value == null
                          ? const Center(child: Text('No image selected'))
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(20.px),
                              child: Image.file(
                                File(paymentController.pickedImage.value!.path),
                                fit: BoxFit.cover,
                              ),
                            ),
                    )
                  : Image.asset("assets/png/chooseImage.png"),
              SizedBox(
                height: 6.h,
              ),
              paymentController.pickedImage.value != null
                  ? Obx(() => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          getHorizentalSpace(3.h),
                          Expanded(
                            child: customButton(
                                onTap: () {
                                  if (backButton.value == false) {
                                    backButton.value = true;
                                    nextButton.value = false;
                                  } else {
                                    backButton.value = false;
                                    nextButton.value = true;
                                  }
                                  Get.back();
                                },
                                backgroundColor: backButton.value == true
                                    ? CustomColor.secondaryColor
                                    : CustomColor.primaryColor,
                                borderColor: backButton.value == true
                                    ? CustomColor.primaryColor
                                    : CustomColor.secondaryColor,
                                title: 'Back',
                                titleColor: backButton.value == true
                                    ? Colors.black
                                    : Colors.white,
                                width: 16.2.h,
                                height: 4.5.h),
                          ),
                          getHorizentalSpace(1.h),
                          Expanded(
                            child: profileImageUploadNewController.loading.value
                                ? Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : Center(
                                    child: customButton(
                                        onTap: () async {
                                          if (nextButton.value == false) {
                                            nextButton.value = true;
                                            backButton.value = false;
                                          } else {
                                            nextButton.value = false;
                                            backButton.value = true;
                                          }
                                          if (paymentController
                                                  .pickedImage.value !=
                                              null) {
                                            File imageFile = File(
                                                paymentController
                                                    .pickedImage.value!.path);
                                            profileUploadImageController
                                                .uploadProfilePicture(
                                                    imageFile);

                                            // profileImageUploadNewController
                                            //     .uploadProfilePic(
                                            //         imageFile,
                                            //         profileImageUploadNewController
                                            //             .token);

                                            // AuthApis(context).getTokenFromSharedPreference().then((value) {
                                            //   profileImageUploadNewController.uploadProfilePic(imageFile,AuthApis(context). token);
                                            // });
                                          } else {
                                            customScaffoldMessenger(context,
                                                'No image selected. Please pick an image.');
                                          }
                                        },
                                        backgroundColor:
                                            nextButton.value == true
                                                ? CustomColor.secondaryColor
                                                : CustomColor.primaryColor,
                                        borderColor: nextButton.value == true
                                            ? CustomColor.primaryColor
                                            : CustomColor.secondaryColor,
                                        title: 'Next',
                                        titleColor: nextButton.value == true
                                            ? Colors.black
                                            : Colors.white,
                                        width: 16.2.h,
                                        height: 4.5.h),
                                  ),
                          ),
                          getHorizentalSpace(3.h),
                        ],
                      ))
                  : CustomMainButton(
                      buttonText: "Choose Image",
                      buttonColor: CustomColor.mainColorYellow,
                      onPressed: () async {
                        paymentController.pickImage();
                      }),
            ],
          ),
        ),
      ),
    );
  }
}
