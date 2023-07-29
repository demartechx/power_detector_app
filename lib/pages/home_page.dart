import 'package:battery/battery.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:power_detector/services/battery_service.dart';
import 'package:power_detector/widgets/app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //int level = BatteryService.level;
  //BatteryState batteryState = BatteryService.batteryState;

  // ignore: non_constant_identifier_names
  Widget BuildBattery(BatteryState state) {
    switch (state) {
      case BatteryState.full:
        return const SizedBox(
          width: 200,
          height: 200,
          child: Icon(
            Icons.battery_full,
            size: 200,
            color: Colors.green,
          ),
        );
      case BatteryState.charging:
        return const SizedBox(
          width: 200,
          height: 200,
          child: Icon(
            Icons.battery_charging_full,
            size: 200,
            color: Colors.blue,
          ),
        );
      case BatteryState.discharging:
      default:
        return const SizedBox(
          width: 200,
          height: 200,
          child: Icon(Icons.battery_alert, size: 200, color: Colors.grey),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        context.theme.backgroundColor,
        'Power Detector',
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Obx(() {
              return BuildBattery(BatteryService.batteryState.value);
            }),
            //BuildBattery(batteryState),
            Obx(() {
              int level = BatteryService.batteryLevel.value;
              return Text(
                '$level %',
                style: TextStyle(
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontSize: 25,
                ),
              );
            }),

            
          ],
        ),
      ),
    );
  }
}
