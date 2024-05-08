
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';


class PaymentController extends GetxController{



  //Date picker
  DateTime currentDate=DateTime.now();
  Rx<DateTime> selectedDate = DateTime.now().obs;
  Rx<String>    formatedDate ='2024-5-07'.obs;
  Future<void>pickedDate(BuildContext context)async{
    final DateTime? picked=await showDatePicker(context: context,
        firstDate: DateTime(1990),
        lastDate:currentDate);
    if(picked !=null && picked !=selectedDate.value){
      selectedDate.value=picked;
       formatedDate.value = DateFormat("yyyy-MM-dd").format( selectedDate.value);

    }

  }
  //picked Time
  Rx<TimeOfDay> selectedTime = TimeOfDay.now().obs;
  Rx<String>    formatedTime ='12:30'.obs;
  Future<void>pickedTime(BuildContext context)async{
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime.value,
    );

    // If a time is picked, update selectedTime and formattedTime
    if (pickedTime != null) {
      selectedTime.value = pickedTime;
      formatedTime.value = pickedTime.format(context);
    }

  }
  //picked Image From Gallery
  final ImagePicker picker=ImagePicker();
  Rx<XFile?> pickedImage = Rx<XFile?>(null);
  Future<void>pickImage()async{
    final XFile? selectImage=await picker.pickImage(source: ImageSource.gallery);
    if(selectImage !=null){
        pickedImage.value=selectImage;


    }
  }


}