import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/custom_widget/customwidgets.dart';
import '../api/auth_apis.dart';

class ProfileUploadImageController extends GetxController {
  late final BuildContext context;
  RxBool uploadImageLoading = false.obs;

  ProfileUploadImageController(this.context);

  Future<void> uploadProfilePicture(File imageFile) async {
    uploadImageLoading.value = true;
    try {
      await AuthApis(context).updateProfilePicture(imageFile);
    } catch (e) {
      print('Error during signup: $e');
      if (context.mounted) {
        customScaffoldMessenger(context, 'Upload failed. Please try again.');
      }
    } finally {
      uploadImageLoading.value = false;
    }
  }
}
