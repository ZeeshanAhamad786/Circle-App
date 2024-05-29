import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/user_services.dart';

class ProfileImageUploadNewController extends GetxController {
  var loading = false.obs;

  Future<void> uploadProfilePic(File image, String token) async {
    try {
      loading.value = true;

      final response = await ApisServices().postApisDataWithToken({}, "/api/auth/update-profile-picture", token, image);

      if (response == null) {
        loading.value = false;
        Get.snackbar("Error", "Something went wrong! Please try again");
      } else {
        final jsonData = jsonDecode(response.body);
        loading.value = false;

        if (jsonData["message"] == "Profile picture updated successfully") {
          Get.snackbar("Success", "Profile picture updated successfully");
        } else {
          Get.snackbar("Error", "Something went wrong");
        }
      }
    } on TimeoutException catch (e) {
      loading.value = false;
      log("A timeout error occurred: $e");
    } catch (e) {
      loading.value = false;
      log("An error occurred: $e");
      Get.snackbar("Error", "Something went wrong! Please try again");
    }
  }
  String token='';
  Future<void> tokenStoreSharedPreference(String token)async{
    // Save token in shared preferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    log("this is token $token");

  }
  Future<void> getTokenFromSharedPreference()async{
    // Save token in shared preferences
    final prefs = await SharedPreferences.getInstance();
    token= prefs.getString('token')!;
    log("this is token $token");

  }
}
