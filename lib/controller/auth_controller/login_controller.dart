import 'package:circleapp/custom_widget/customwidgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../api/auth_apis.dart';

class LoginController extends GetxController {
  late final BuildContext context;
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  RxBool loginLoading = false.obs;

  LoginController(this.context);

  Future<void> loginApis(String email, String password) async {
    loginLoading.value = true;
    try {
      await AuthApis(context).loginApi(email, password);
    } catch (e) {
      print('Error during signup: $e');
      if (context.mounted) {
        customScaffoldMessenger(context, 'Login failed. Please try again.');
      }
    } finally {
      loginLoading.value = false;
    }
  }
}
