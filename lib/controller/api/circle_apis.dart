import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../../custom_widget/customwidgets.dart';
import '../utils/const.dart';

class CircleApis {
  final BuildContext context;
  CircleApis(this.context);

  Future<void> createCircleApi(
    String circleName,
    String circleImage,
    String description,
    String type,
    String interest,
    List<String> memberIds,
    List<String> phoneNumbers,
  ) async {
    final url = Uri.parse("$baseURL/api/circle/create");

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'circleName': circleName,
        'circleImage': circleImage,
        'description': description,
        'type': type,
        'interest': interest,
        'memberIds': memberIds,
        'phoneNumbers': phoneNumbers,
      }),
    );

    print(
        'Create Circle Api details: $circleName, $circleImage, $description, $type, $interest, $memberIds, $phoneNumbers');
    if (response.statusCode == 200) {
      print("API Success: Signup");
    } else {
      print("API Failed: signup");
      print(response.body);
      if (context.mounted) {
        String errorMessage;
        try {
          errorMessage = jsonDecode(response.body)['error'] ?? 'Signup failed';
        } catch (e) {
          errorMessage = 'Signup failed';
        }
        customScaffoldMessenger(context, errorMessage);
      }
    }
  }
}
