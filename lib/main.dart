import 'package:circleapp/view/screens/athentications/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
void  main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
     builder: (BuildContext,orientation,ScreenType){
       return GetMaterialApp(
         debugShowCheckedModeBanner: false,
theme: ThemeData(useMaterial3: true),
home:LoginScreen() ,

       );
     },

    );
  }
}