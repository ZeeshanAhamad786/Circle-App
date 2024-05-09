import 'package:circleapp/controller/utils/color/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  BottomNavigationScreenState createState() => BottomNavigationScreenState();
}

class BottomNavigationScreenState extends State<BottomNavigationScreen> {
  RxInt currentIndex = 0.obs;
  RxInt colorIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    // final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Obx(() =>  Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: 3.h),
        child: ClipRRect(borderRadius:BorderRadius.circular(60),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex.value,
            backgroundColor: CustomColor.mainColorBackground,
            selectedItemColor: CustomColor.mainColorYellow,
            unselectedItemColor: Colors.white,
            selectedLabelStyle: textTheme.bodySmall?.copyWith(fontSize: 13.sp),
            unselectedLabelStyle: textTheme.bodySmall?.copyWith(fontSize: 13.sp),
            onTap: (value) {
              // Respond to item press.
              currentIndex.value = value;
              colorIndex.value = value;
            },
            items: [
              BottomNavigationBarItem(
                  label: "Loop",backgroundColor: Colors.white,
                  icon: SvgPicture.asset("assets/svg/loop.svg",colorFilter:ColorFilter.mode( colorIndex.value==0? CustomColor.mainColorYellow:Colors.white, BlendMode.srcIn,),
                    height: 16.5,width: 16,)
              ),
              BottomNavigationBarItem(
                  label: "Messages",backgroundColor: Colors.white,
                  icon:SvgPicture.asset("assets/svg/message.svg",colorFilter:ColorFilter.mode( colorIndex.value==1? CustomColor.mainColorYellow:Colors.white, BlendMode.srcIn,),)
              ),
              BottomNavigationBarItem(
                  label: "Plans",backgroundColor: Colors.white,
                  icon:SvgPicture.asset("assets/svg/calender.svg",colorFilter:ColorFilter.mode( colorIndex.value==2? CustomColor.mainColorYellow:Colors.white, BlendMode.srcIn,),
                    // color: colorIndex.value == 2 ? CustomColor.mainColorYellow : Colors.white,
                  )
              ),
              BottomNavigationBarItem(
                  label: "Explore",backgroundColor: Colors.white,
                  icon: SvgPicture.asset("assets/svg/Explore.svg",colorFilter:ColorFilter.mode( colorIndex.value==3? CustomColor.mainColorYellow:Colors.white, BlendMode.srcIn,),)
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
