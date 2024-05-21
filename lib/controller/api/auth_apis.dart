import 'dart:convert';
import 'package:circleapp/custom_widget/customwidgets.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const baseURL = "https://cricle-app.azurewebsites.net";

class AuthApis {
  final BuildContext context;
  AuthApis(this.context);

  Future<void> signupApi(String userName, String email, String password,
      String phoneNumber) async {
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
        // Handle successful login, if needed
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
        customScaffoldMessenger(
            context, 'An error occurred. Please try again.');
      }
    }
  }

  // Future<void> resendOtpApi(String phoneNumber) async {
  //   final url = Uri.parse("$baseURL/api/auth/login");
  //
  //   try {
  //     final response = await http.post(
  //       url,
  //       body: jsonEncode({
  //         'phoneNumber': phoneNumber,
  //       }),
  //     );
  //
  //     print('Resend API request details:, $phoneNumber');
  //
  //     if (response.statusCode == 200) {
  //       print("API Success: Resend");
  //       // Handle successful login, if needed
  //     } else {
  //       print("API Failed: Resend");
  //       print(response.body);
  //       if (context.mounted) {
  //         String errorMessage;
  //         try {
  //           errorMessage =
  //               jsonDecode(response.body)['error'] ?? 'Resend Otp failed';
  //         } catch (e) {
  //           errorMessage = 'Resend Otp failed';
  //         }
  //         customScaffoldMessenger(context, errorMessage);
  //       }
  //     }
  //   } catch (error) {
  //     print("Exception occurred: $error");
  //     if (context.mounted) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text('An error occurred. Please try again.')),
  //       );
  //     }
  //   }
  // }
  Future<void> resendOtp(String phoneNumber) async {
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
            errorMessage =
                jsonDecode(response.body)['error'] ?? 'Failed to resend OTP';
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
}
