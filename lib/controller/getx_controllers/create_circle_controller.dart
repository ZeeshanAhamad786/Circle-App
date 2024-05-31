// import 'dart:convert';
//
// import 'package:get/get.dart';
//
// import 'api/user_services.dart';
// class CreateCircleController extends GetxController{
//   RxBool isLoading=false.obs;
//   Future<void> createCircle(String circleName,circleImage,description,type,interest,token,List memberIds,phoneNumbers)async{
//     Map body={
//       "circleName":circleName.toString(),
//       "circleImage":circleImage.toString(),
//       "description":description.toString(),
//       "type":type.toString(),
//       "interest":interest.toString(),
//       "memberIds":memberIds,
//       "phoneNumbers":phoneNumbers,
//     };
//     isLoading.value=true;
//     await ApisServices().postApiDataWithToken(body,"/api/circle/create",token).then((value) {
//       var jsonData=jsonDecode(value.body);
//       if(value ==null){
//         isLoading.value=false;
//         Get.snackbar("Sorry", "Something went wrong plz try again");
//       }else if(jsonData[""]);
//     });
//   }
// }
