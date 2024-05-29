import 'dart:convert';

import 'package:circleapp/controller/utils/shared_preferences.dart';
import 'package:circleapp/models/circle_model.dart';
import 'package:circleapp/models/is_user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart' hide Response;
import 'package:http/http.dart';

import '../../view/custom_widget/customwidgets.dart';
import '../../view/screens/bottom_navigation_screen/bottom_navigation_screen.dart';
import '../utils/constants/api_constants.dart';
import '../utils/constants/global_variables.dart';
import '../utils/constants/storage_keys.dart';

class CircleApis {
  final BuildContext context;
  CircleApis(this.context);

  Future<CircleModel?> createCircleApi({
    required String circleName,
    required String circleImage,
    required String description,
    required String type,
    required String interest,
    required List<String> memberIds,
    required List<String> phoneNumbers,
  }) async {
    String apiName = "Create Circle";

    final url = Uri.parse("$baseURL/api/circle/create");
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $userToken',
    };
    final body = {
      'circleName': circleName,
      'circleImage': circleImage,
      'description': description,
      'type': type,
      'interest': interest,
      'memberIds': memberIds,
      'phoneNumbers': phoneNumbers,
    };

    print(jsonEncode(body));
    Response response = await post(url, headers: headers, body: jsonEncode(body));
    Map<String, dynamic> responseBody = json.decode(response.body);
    print(response.body);
    customScaffoldMessenger(context, responseBody["message"]);

    if (responseBody["success"] == true) {
      print("API Success: $apiName\n${response.body}");
      Get.offAll(const BottomNavigationScreen());
      MySharedPreferences.setBool(isLoggedIn, true);
      return CircleModel.fromJson(responseBody["circle"]);
    }
    print("API Failed: $apiName\n ${response.body}");
    return null;
  }

  Future<List<IsUserModel>?> getIsUser(List<String> numbers) async {
    String apiName = "Get is User";
    final url = Uri.parse("$baseURL/api/auth/check-users");
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $userToken',
    };
    final body = {"phoneNumbers": numbers};

    Response response = await post(url, headers: headers, body: jsonEncode(body));

    if (response.statusCode == 200) {
      print("API Success: $apiName\n${response.body}");
      return isUserModelFromJson(response.body);
    }
    print("API Failed: $apiName\n ${response.body}");
    return null;
  }
}
