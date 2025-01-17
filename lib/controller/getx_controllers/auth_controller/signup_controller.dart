import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../view/custom_widget/customwidgets.dart';
import '../../../view/screens/athentications/verIfymobilescreen.dart';
import '../../api/auth_apis.dart';

class SignupController extends GetxController {
  final BuildContext context;
  TextEditingController userNameTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  RxBool isLoading = false.obs;

  SignupController(this.context);

  Future<void> signupApis(String userName, String email, String phoneNumber, String password) async {
    isLoading.value = true;
    try {
      await AuthApis(context).signupApi(userName, email, password, phoneNumber).then((value) {
        Get.to(() => VerifyMobileScreen(), arguments: {
          'phoneNumber': phoneNumberController.text,
        });
      });
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
