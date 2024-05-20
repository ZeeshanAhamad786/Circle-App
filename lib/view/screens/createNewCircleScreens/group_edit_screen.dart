import 'package:circleapp/controller/utils/color/custom_color.dart';
import 'package:circleapp/custom_widget/customwidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
class GroupEditScreen extends StatefulWidget {
  const GroupEditScreen({Key? key}) : super(key: key);

  @override
  State<GroupEditScreen> createState() => _GroupEditScreenState();
}

class _GroupEditScreenState extends State<GroupEditScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.mainColorBackground,
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 3.h),
        child: Column(children: [getVerticalSpace(8.h),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.arrow_back_ios_new),
              CircleAvatar(backgroundImage: AssetImage("assets/png/groupImage.png"),radius: 50,),
              Icon(Icons.more_vert)
            ],
          ),
          Text("Hiking"),
          Text("Group: 5 members"),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/svg/call.svg"),
            getHorizentalSpace(3.w),
              SvgPicture.asset("assets/svg/video.svg"),
              getHorizentalSpace(3.w),
              SvgPicture.asset("assets/svg/convas.svg"),
            ],
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text("Circle name"),
            Text("Hiking"),
            Divider(color: Colors.white.withOpacity(0.2),),
              Text("description"),
              Text("Lorem ipsum dolor sit amet consectetur. Eget aliquam suspendisse ultrices a mattis vitae. Adipiscing id vestibulum ultrices lorem."),
              Divider(color: Colors.white.withOpacity(0.2),),
              Text("Circle type"),
              Text("Friends"),
              Divider(color: Colors.white.withOpacity(0.2),),
              Text("Interests"),
              Text("Traveling"),
              Divider(color: Colors.white.withOpacity(0.2),),
          ],)


        ],),
      ),
    );
  }
}
