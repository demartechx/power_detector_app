import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:power_detector/utils/theme.dart';
import 'package:power_detector/widgets/app_large_text.dart';


void showCustomSnackBar(String message,
    {bool isError = true, String title = "Error"}) {
  Get.snackbar(
    title,
    message,
    titleText: AppLargeText(text: title, size: 20, color: Colors.white,),
    messageText: Text(message, style: const TextStyle(color: Colors.white),),
    colorText: Colors.white,
    snackPosition: SnackPosition.TOP,
    backgroundColor: isError ? Themes.errorColor100 : Themes.greenColor100,
    borderRadius: 5,
    icon: Icon(
      isError ? Icons.error : Icons.alarm_outlined,
      color: Colors.white,
      size: 30,
    )
  );
}
