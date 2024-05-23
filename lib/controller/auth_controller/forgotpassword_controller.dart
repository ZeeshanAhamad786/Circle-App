import 'package:circleapp/custom_widget/customwidgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../api/auth_apis.dart';

class ForgotPasswordController extends GetxController {
  late final BuildContext context;

  final TextEditingController forgotPasswordTextController =
      TextEditingController();
  RxBool isLoading = false.obs;

  ForgotPasswordController(this.context);

  Future<void> forgotPasswordApi(String email) async {
    isLoading.value = true;
    try {
      await AuthApis(context).forgotPasswordApi(email);
    } catch (e) {
      print('Error during signup: $e');
      if (context.mounted) {
        customScaffoldMessenger(context, 'Login failed. Please try again.');
      }
    }
    isLoading.value = false;
  }
}
