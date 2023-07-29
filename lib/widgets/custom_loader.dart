import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:power_detector/utils/dimensions.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
          alignment: Alignment.center,
          color: Get.isDarkMode ? Colors.black.withOpacity(0.7) : Colors.white70,
          child: Image.asset(
            'assets/images/loader.gif',
            height: Dimensions.width(180),
            width: Dimensions.width(180),
          ),
    );
  }
}
