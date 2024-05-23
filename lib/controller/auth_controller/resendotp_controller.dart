import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../api/auth_apis.dart';

class ResendController extends GetxController {
  late final BuildContext context;

  RxBool loginLoading = false.obs;

  ResendController(this.context);

  Future<void> resendOtpApis(String phoneNumber) async {
    loginLoading.value = true;
    try {
      await AuthApis(context).resendOtpApi(phoneNumber);
    } catch (e) {
      print('Error during signup: $e');
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Login failed. Please try again.'),
          ),
        );
      }
    }
    loginLoading.value = false;
  }
}
