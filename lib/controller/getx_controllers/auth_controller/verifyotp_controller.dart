import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../view/custom_widget/customwidgets.dart';
import '../../api/auth_apis.dart';

class VerifyOTPController extends GetxController {
  final BuildContext context;
  TextEditingController phoneNumberTextController = TextEditingController();
  TextEditingController otpCodeTextController = TextEditingController();
  RxBool isLoading = false.obs;

  VerifyOTPController(this.context);

  Future<void> verifyOtpApi(String phoneNumber, String code) async {
    isLoading.value = true;
    try {
      await AuthApis(context).verifyOtpApi(phoneNumber, code);
    } catch (e) {
      print('Error during signup: $e');
      if (context.mounted) {
        customScaffoldMessenger(context, 'Signup failed. Please try again.');
      }
    } finally {
      isLoading.value = false;
    }
  }
}
