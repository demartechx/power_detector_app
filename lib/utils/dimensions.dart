import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static height(double value){
    return screenHeight * value * 0.00108;
  }

  static width(double value){
    return screenWidth  * value * 0.0015;
  }

}
