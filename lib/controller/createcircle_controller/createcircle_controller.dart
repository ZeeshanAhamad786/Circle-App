import 'package:circleapp/controller/api/circle_apis.dart';
import 'package:flutter/material.dart';

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../custom_widget/customwidgets.dart';
import '../api/auth_apis.dart';

class CreateCircleController extends GetxController {
  late final BuildContext context;
  RxBool loginLoading = false.obs;

  TextEditingController circleNameTextController = TextEditingController();
  TextEditingController circleDescriptionTextController =
      TextEditingController();

  CreateCircleController(this.context);

  Future<void> createCircleApi(
    String circleName,
    String circleImage,
    String description,
    String type,
    String interest,
    List<String> memberIds,
    List<String> phoneNumbers,
  ) async {
    loginLoading.value = true;
    try {
      await CircleApis(context).createCircleApi(circleName, circleImage,
          description, type, interest, memberIds, phoneNumbers);
    } catch (e) {
      print('Error during signup: $e');
      if (context.mounted) {
        customScaffoldMessenger(context, 'Upload failed. Please try again.');
      }
    } finally {
      loginLoading.value = false;
    }
  }
}
