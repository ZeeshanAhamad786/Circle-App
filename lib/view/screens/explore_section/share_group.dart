import 'dart:developer';
import 'package:circleapp/controller/utils/color/custom_color.dart';
import 'package:circleapp/controller/utils/style/customTextStyle.dart';
import 'package:circleapp/custom_widget/customwidgets.dart';
import 'package:circleapp/models/share_groups_item_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
class ShareGroupScreen extends StatefulWidget {
  const ShareGroupScreen({Key? key}) : super(key: key);

  @override
  State<ShareGroupScreen> createState() => _ShareGroupScreenState();
}

class _ShareGroupScreenState extends State<ShareGroupScreen> {

  final RxList<ShareGroupItemModel> items = [
    ShareGroupItemModel(
      GroupName: "Music Lovers",
      SubTitle: "How is it going?",
      ImagePath: "assets/png/Avatar1.jpg",
      selected: false,
    ),
    ShareGroupItemModel(
      GroupName: "Night Out",
      SubTitle: "Good morning, did you sleep well?",
      ImagePath: "assets/png/Avatar2.jpg",
      selected: false,
    ),
    ShareGroupItemModel(
      GroupName: "Countryside Travel",
      SubTitle: "Aight, noted",
      ImagePath: "assets/png/Avatar3.jpg",
      selected: false,
    ),
    ShareGroupItemModel(
      GroupName: "Music Lovers",
      SubTitle: "How is it going?",
      ImagePath: "assets/png/Avatar1.jpg",
      selected: false,
    ),
    ShareGroupItemModel(
      GroupName: "Music Lovers",
      SubTitle: "How is it going?",
      ImagePath: "assets/png/Avatar1.jpg",
      selected: false,
    ),
    ShareGroupItemModel(
      GroupName: "Music Lovers",
      SubTitle: "How is it going?",
      ImagePath: "assets/png/Avatar1.jpg",
      selected: false,
    ),
    ShareGroupItemModel(
      GroupName: "Music Lovers",
      SubTitle: "How is it going?",
      ImagePath: "assets/png/Avatar1.jpg",
      selected: false,
    ),
    ShareGroupItemModel(
      GroupName: "Music Lovers",
      SubTitle: "How is it going?",
      ImagePath: "assets/png/Avatar1.jpg",
      selected: false,
    ),
  ].obs;

  @override
  Widget build(BuildContext context) {
    return
      Obx(() =>   Scaffold(
        backgroundColor: CustomColor.mainColorBackground,
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 3.h),
          child:

          Column(
            children: [
              getVerticalSpace(7.h),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Share",style: CustomTextStyle.mediumTextExplore,),
                  Text("Done",style: CustomTextStyle.mediumTextDone,),
                ],
              ),
              Align(alignment: Alignment.centerLeft,
                child: Text("Select groups you want to share in",style:
                TextStyle(color: CustomColor.mainColorOffWhite.withOpacity(0.5),
                    fontWeight: FontWeight.w400,fontSize: 12.px,fontFamily: "medium"),),
              ),
              getVerticalSpace(3.h),
              Expanded(
                child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: items.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext ,index){

                      return GestureDetector(onTap: () {
                        items[index].selected = !items[index].selected;
                        items.refresh();
                        log("the value is");
                        log(items.toString());
                      },
                        child: Container(
                          margin: EdgeInsets.only(top: 1.5.h),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: CustomColor.textFieldColor,),
                          child: ListTile(
                            title: Text(items[index].GroupName,style: CustomTextStyle.mediumTextTitle,),
                            subtitle: Text(items[index].SubTitle,style: CustomTextStyle.mediumTextSubtitle,),
                            leading: CircleAvatar(maxRadius: 30,
                              backgroundImage: AssetImage(items[index].ImagePath),),
                            trailing: Container(
                              height: 20,width: 20,
                              decoration:  BoxDecoration(
                                  color: items[index].selected?  CustomColor.mainColorYellow:null,
                                  borderRadius: BorderRadius.circular(30),border: Border.all(
                                  color:  CustomColor.mainColorYellow)),
                              child:items[index].selected? Icon(Icons.check,size: 11,):null,
                            ),
                          ),
                        ),
                      );
                    }),
              )
            ],),

        ),
      ));

  }
}
