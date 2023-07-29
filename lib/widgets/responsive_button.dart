import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:power_detector/utils/dimensions.dart';
import 'package:power_detector/widgets/app_text.dart';


// ignore: must_be_immutable
class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  double? height;
  bool inverse;
  String text;
  Color color;
  ResponsiveButton(
      {Key? key,
      this.width = 120,
      this.height = 60,
      this.inverse = false,
      required this.color,
      this.isResponsive = false,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isResponsive == true ? double.maxFinite : width,
      height: height,
      decoration: BoxDecoration(
        border: inverse ? Border.all(color: color) : null,
        borderRadius: BorderRadius.circular(Dimensions.height(5)),
        color: inverse ? Colors.white.withOpacity(0.9) : color,
        boxShadow: Get.isDarkMode
            ? null
            : [
                BoxShadow(
                  color: context.theme.shadowColor,
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppText(
            text: text,
            size: Dimensions.width(25),
            color: inverse ? color : Colors.white,
          )
        ],
      ),
    );
  }
}
