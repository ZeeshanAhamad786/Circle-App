import 'package:circleapp/view/screens/athentications/login_screen.dart';
import 'package:circleapp/view/screens/bottom_navigation_screen/bottom_navigation_screen.dart';
import 'package:circleapp/view/screens/createNewCircleScreens/choose_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'controller/utils/preference_keys.dart';
import 'controller/utils/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MySharedPreferences.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (BuildContext, orientation, ScreenType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(useMaterial3: true),
          home: MySharedPreferences.getBool(isLoggedIn)
              ? const BottomNavigationScreen()
              : MySharedPreferences.getBool(isSignedUp)
                  ? const ChooseImage()
                  : LoginScreen(),
        );
      },
    );
  }
}
