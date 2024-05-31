import 'dart:io';

import 'package:circleapp/controller/getx_controllers/paymentController.dart';
import 'package:circleapp/controller/utils/customTextStyle.dart';
import 'package:circleapp/controller/utils/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controller/api/auth_apis.dart';
import '../../../controller/getx_controllers/auth_controller/profileimageupload_controller.dart';
import '../../../controller/utils/app_colors.dart';
import '../../../controller/utils/global_variables.dart';
import '../../../controller/utils/preference_keys.dart';
import '../../custom_widget/custom-button.dart';
import '../../custom_widget/customwidgets.dart';

class ChooseImage extends StatefulWidget {
  const ChooseImage({super.key});

  @override
  State<ChooseImage> createState() => _ChooseImageState();
}

class _ChooseImageState extends State<ChooseImage> {
  late ProfileUploadImageController profileUploadImageController;
  late AuthApis authApis;

  @override
  void initState() {
    super.initState();
    userToken = MySharedPreferences.getString(userTokenKey);
    profileUploadImageController = Get.put(ProfileUploadImageController(context));
    authApis = AuthApis(context);
  }

  @override
  Widget build(BuildContext context) {
    final PaymentController paymentController = Get.put(PaymentController());
    RxBool backButton = false.obs;
    RxBool nextButton = true.obs;
    return Scaffold(
      backgroundColor: AppColors.mainColorBackground,
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
                height: paymentController.pickedImage.value != null ? 4.h : 14.h,
              ),
              paymentController.pickedImage.value != null
                  ? Container(
                      height: 46.6.h,
                      decoration: BoxDecoration(
                        color: AppColors.textFieldColor,
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
                                  if (!profileUploadImageController.uploadImageLoading.value) {
                                    paymentController.pickedImage.value = null;
                                  }
                                },
                                backgroundColor: backButton.value == true ? AppColors.secondaryColor : AppColors.primaryColor,
                                borderColor: backButton.value == true ? AppColors.primaryColor : AppColors.secondaryColor,
                                title: 'Back',
                                titleColor: backButton.value == true ? Colors.black : Colors.white,
                                width: 16.2.h,
                                height: 4.5.h),
                          ),
                          getHorizentalSpace(1.h),
                          Expanded(
                            child: customLoadingButton(
                                onTap: () {
                                  if (!profileUploadImageController.uploadImageLoading.value) {
                                    customScaffoldMessenger(context, 'Uploading Image...');
                                    profileUploadImageController.uploadProfilePicture(File(paymentController.pickedImage.value!.path));
                                  }
                                },
                                backgroundColor: nextButton.value == true ? AppColors.secondaryColor : AppColors.primaryColor,
                                borderColor: nextButton.value == true ? AppColors.primaryColor : AppColors.secondaryColor,
                                title: 'Next',
                                titleColor: nextButton.value == true ? Colors.black : Colors.white,
                                width: 16.2.h,
                                height: 4.5.h,
                                loading: profileUploadImageController.uploadImageLoading),
                          ),
                          getHorizentalSpace(3.h),
                        ],
                      ))
                  : CustomButton(
                      buttonText: "Choose Image",
                      buttonColor: AppColors.mainColorYellow,
                      onPressed: () {
                        paymentController.pickImage();
                      }),
            ],
          ),
        ),
      ),
    );
  }
}
