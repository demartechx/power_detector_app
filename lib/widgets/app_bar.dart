import 'package:flutter/material.dart';
import 'package:get/get.dart';

appBar(Color color, String text, {leading = false}) {
    return AppBar(
      elevation: 0,
      
      automaticallyImplyLeading: leading,
      backgroundColor: color,
      iconTheme: IconThemeData(
        color: Get.isDarkMode ? Colors.white : Colors.black, // <-- SEE HERE
      ),
      title: Text(
        text,
        style: TextStyle(
          fontSize: 17,
          color: Get.isDarkMode ? Colors.white : Colors.black,
        ),
      ),
      centerTitle: true,
    );
  }