import 'package:circleapp/controller/utils/style/customTextStyle.dart';
import 'package:circleapp/view/screens/athentications/choose_image.dart';
import 'package:circleapp/view/screens/athentications/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../controller/utils/color/custom_color.dart';
import '../../../custom_widget/custom-button.dart';
class OnBoadingScreen1 extends StatefulWidget {

  const OnBoadingScreen1({Key? key}) : super(key: key);

  @override
  State<OnBoadingScreen1> createState() => _OnBoadingScreen1State();
}

class _OnBoadingScreen1State extends State<OnBoadingScreen1> {
  int pageIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: CustomColor.mainColorBackground,
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (int page) {
              setState(() {
                pageIndex = page;
              });
            },
            children: [
              OnboardingPage(
                image: "assets/png/splash1.png",
                title: 'Create a circle for all your group\n chats and invite your friends',
                controller: _controller,
              ),
              OnboardingPage(
                image: "assets/png/splash2.png",
                title: 'Pick interests that your Circles are\n all about',
                controller: _controller,
              ),
              OnboardingPage(
                image: "assets/png/splash3.png",
                title: 'Plan and Experience events with\n your circle',
                controller: _controller,
              ),
              OnboardingPage(
                image: "assets/png/splash4.png",
                title: 'Get exclusive deals that your circle\n cares about',
                controller: _controller,
              ),
              // Add more pages as needed
            ],
          ),
          if (pageIndex == 0)
            Positioned(
              top: 9.1.h,
              right: 3.h,
              child: GestureDetector(
                onTap: () {
                  Get.to(()=>ChooseImage());
                },
                child: Text(
                  "SKIP",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.px,
                    fontFamily: "medium",
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final PageController controller;
  const OnboardingPage({
    required this.image,
    required this.title,
    required this.controller,

  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: 11.h,),
              Image.asset(image,height: 340.px,width: 340.px,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [SizedBox(height: 18.h,),
                    Center(child: Text(title,style: CustomTextStyle.mediumTextM14,textAlign: TextAlign.center,)),
                    SizedBox(height: 4.h,),
                    Center(
                      child: SmoothPageIndicator(
                        controller: controller,
                        count: 4,
                        effect: CustomizableEffect(
                          activeDotDecoration: DotDecoration(
                            height: 0.8.h,
                            width: 2.2.h,
                            color: CustomColor.mainColorYellow,
                            borderRadius: BorderRadius.circular(32.px),
                          ),
                          dotDecoration: DotDecoration(
                              height: 0.8.h,
                              width: 0.8.h,
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(32.px)),
                          spacing: 1.2.h,
                        ),
                      ),
                    ),

                    SizedBox(height: 3.h),
                    Align(
                      alignment: Alignment.centerRight,
                      child:   CustomMainButton(buttonText: "Get Started",buttonColor: CustomColor.mainColorYellow,
                          onPressed: (){
                            if(controller.page==3){
                              Get.to(() => LoginScreen());
                            }else
                              controller.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                          }),
                    ),
                    SizedBox(height: 1.h,width: 1.h,),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
