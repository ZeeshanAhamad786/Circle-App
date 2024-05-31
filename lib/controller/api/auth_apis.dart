import 'dart:convert';
import 'dart:io';

import 'package:circleapp/controller/utils/shared_preferences.dart';
import 'package:circleapp/view/screens/bottom_navigation_screen/bottom_navigation_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../view/custom_widget/customwidgets.dart';
import '../../view/screens/athentications/resetpassword_screen.dart';
import '../../view/screens/createNewCircleScreens/choose_image.dart';
import '../../view/screens/createNewCircleScreens/createCircleScreen.dart';
import '../utils/api_constants.dart';
import '../utils/global_variables.dart';
import '../utils/preference_keys.dart';

class AuthApis {
  final BuildContext context;
  AuthApis(this.context);

  Future<void> signupApi(String userName, String email, String password, String phoneNumber) async {
    final url = Uri.parse("$baseURL/api/auth/signup");

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'name': userName,
        'email': email,
        'phoneNumber': phoneNumber,
        'password': password,
      }),
    );

    print('API request details: $userName, $email, $phoneNumber, $password');

    if (response.statusCode == 200) {
      print("API Success: Signup");
      MySharedPreferences.setBool(isSignedUp, true);
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

  Future<void> loginApi(String email, String password) async {
    final url = Uri.parse("$baseURL/api/auth/login");

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      print('API request details: $email, $password');

      if (response.statusCode == 200) {
        print("API Success: Login");
        final responseBody = jsonDecode(response.body);
        final token = responseBody['token'];

        // Handle successful login
        customScaffoldMessenger(context, responseBody['message']);
        Get.offAll(() => const BottomNavigationScreen());
        MySharedPreferences.setBool(isLoggedIn, true);
        MySharedPreferences.setString(userTokenKey, token);
      } else {
        print("API Failed: Login");
        print(response.body);
        if (context.mounted) {
          String errorMessage;
          try {
            errorMessage = jsonDecode(response.body)['error'] ?? 'Login failed';
          } catch (e) {
            errorMessage = 'Login failed';
          }
          customScaffoldMessenger(context, errorMessage);
        }
      }
    } catch (error) {
      print("Exception occurred: $error");
      if (context.mounted) {
        customScaffoldMessenger(context, 'An error occurred. Please try again.');
      }
    }
  }

  Future<void> resendOtpApi(String phoneNumber) async {
    final url = Uri.parse("$baseURL/api/auth/resend-code");

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'phoneNumber': phoneNumber,
        }),
      );

      print('API request details: $phoneNumber');

      if (response.statusCode == 200) {
        print("API Success: Resend OTP");
        customScaffoldMessenger(context, 'Verification code sent successfully');
      } else {
        print("API Failed: Resend OTP");
        print(response.body);
        if (context.mounted) {
          String errorMessage;
          try {
            errorMessage = jsonDecode(response.body)['error'] ?? 'Failed to resend OTP';
          } catch (e) {
            errorMessage = 'Failed to resend OTP';
          }
          customScaffoldMessenger(context, errorMessage);
        }
      }
    } catch (error) {
      print("Exception occurred: $error");
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('An error occurred. Please try again.')),
        );
      }
    }
  }

  Future<void> verifyOtpApi(String phoneNumber, String code) async {
    final url = Uri.parse("$baseURL/api/auth/verify");

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'phoneNumber': phoneNumber,
          'code': code,
        }),
      );

      print('API request details: $phoneNumber, $code');

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        if (responseBody['success']) {
          print("API Success: OTP Verified");
          MySharedPreferences.setBool(isSignedUp, true);
          MySharedPreferences.setString(userTokenKey, responseBody['token']);
          Get.offAll(() => const ChooseImage());
          customScaffoldMessenger(context, responseBody['message']);
        } else {
          print("API Failed: OTP Verification");
          customScaffoldMessenger(context, responseBody['message']);
        }
      } else {
        print("API Failed: OTP Verification");
        print(response.body);
        if (context.mounted) {
          String errorMessage;
          try {
            errorMessage = jsonDecode(response.body)['message'] ?? 'OTP verification failed';
          } catch (e) {
            errorMessage = 'OTP verification failed';
          }
          customScaffoldMessenger(context, errorMessage);
        }
      }
    } catch (error) {
      print("Exception occurred: $error");
      if (context.mounted) {
        customScaffoldMessenger(context, 'An error occurred. Please try again.');
      }
    }
  }

  Future<void> forgotPasswordApi(String phoneNumber) async {
    final url = Uri.parse("$baseURL/api/auth/forgot-password");

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'phoneNumber': phoneNumber,
        }),
      );

      print('API request details: $phoneNumber');

      if (response.statusCode == 200) {
        print("API Success: Resend OTP");
        customScaffoldMessenger(context, 'Verification code sent successfully');
        Get.off(() => const ResetPasswordScreen(), arguments: {'phoneNumber': phoneNumber});
      } else {
        print("API Failed: Resend OTP");
        print(response.body);
        if (context.mounted) {
          String errorMessage;
          try {
            errorMessage = jsonDecode(response.body)['error'] ?? 'Failed to resend OTP';
          } catch (e) {
            errorMessage = 'Failed to resend OTP';
          }
          customScaffoldMessenger(context, errorMessage);
        }
      }
    } catch (error) {
      print("Exception occurred: $error");
      if (context.mounted) {
        customScaffoldMessenger(context, 'An error occurred. Please try again.');
      }
    }
  }

  Future<void> resetPasswordApi(String phoneNumber, String otpCode, String password) async {
    final url = Uri.parse("$baseURL/api/auth/forgot-password");

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email': phoneNumber,
          'code': otpCode,
          'password': password,
        }),
      );

      print('API request details: $phoneNumber');

      if (response.statusCode == 200) {
        print("API Success: Resend OTP");
        customScaffoldMessenger(context, 'Verification code sent successfully');
        Get.off(() => const ResetPasswordScreen(), arguments: {
          'phoneNumber': phoneNumber,
        });
      } else {
        print("API Failed: Resend OTP");
        print(response.body);
        if (context.mounted) {
          String errorMessage;
          try {
            errorMessage = jsonDecode(response.body)['error'] ?? 'Failed to resend OTP';
          } catch (e) {
            errorMessage = 'Failed to resend OTP';
          }
          customScaffoldMessenger(context, errorMessage);
        }
      }
    } catch (error) {
      print("Exception occurred: $error");
      if (context.mounted) {
        customScaffoldMessenger(context, 'An error occurred. Please try again.');
      }
    }
  }

  Future<void> updateProfilePicture(File imageFile) async {
    final url = Uri.parse("$baseURL/api/auth/update-profile-picture");

    try {
      final request = http.MultipartRequest('POST', url)
        ..headers.addAll({
          'Content-Type': 'multipart/form-data',
          'Authorization': 'Bearer $userToken',
        })
        ..files.add(await http.MultipartFile.fromPath('profilePicture', imageFile.path));

      print('token: $userToken');
      final response = await request.send();
      final responseBody = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        final decodedResponse = jsonDecode(responseBody);
        if (decodedResponse['success']) {
          print("API Success: Profile picture updated");
          customScaffoldMessenger(context, decodedResponse['message']);
          String profileImageUrl = decodedResponse['data']['url'];
          Get.to(const CreateCircle(), arguments: {'imageUrl': profileImageUrl});
          print('Image URL: $profileImageUrl');
        } else {
          print("API Failed: Update profile picture");
          customScaffoldMessenger(context, decodedResponse['message']);
        }
      } else {
        print("API Failed: Update profile picture");
        print(responseBody);
        if (context.mounted) {
          String errorMessage;
          try {
            errorMessage = jsonDecode(responseBody)['error'] ?? 'Update failed';
          } catch (e) {
            errorMessage = 'Update failed';
          }
          customScaffoldMessenger(context, errorMessage);
        }
      }
    } catch (error) {
      print("Exception occurred: $error");
      if (context.mounted) {
        customScaffoldMessenger(context, 'An error occurred. Please try again.');
      }
    }
  }
}
