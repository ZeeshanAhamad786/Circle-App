import 'package:circleapp/custom_widget/customwidgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../api/auth_apis.dart';

class ResetPasswordController extends GetxController {
  late final BuildContext context;

  TextEditingController newPasswordTextController = TextEditingController();
  TextEditingController confirmPasswordTextController = TextEditingController();
  TextEditingController otpTextController = TextEditingController();
  RxBool isLoading = false.obs;

  ResetPasswordController(this.context);

  Future<void> resetPasswordApis(
      String phoneNumber, String otpCode, String password) async {
    isLoading.value = true;
    try {
      await AuthApis(context).resetPasswordApi(phoneNumber, otpCode, password);
    } catch (e) {
      print('Error during signup: $e');
      if (context.mounted) {
        customScaffoldMessenger(
            context, 'Reset password failed. Please try again.');
      }
    }
    isLoading.value = false;
  }
}
