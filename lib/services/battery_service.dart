import 'dart:async';
import 'dart:convert';
import 'package:battery/battery.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:power_detector/utils/app_constants.dart';
import 'package:timezone/timezone.dart' as tz;

class BatteryService with WidgetsBindingObserver {
  static var battery = Battery();
  //static int level = 100;
  //static BatteryState batteryState = BatteryState.full;
  
  static late Timer timer;
  static late StreamSubscription streamSubscription;

  static final RxInt batteryLevel = 100.obs;
  static final Rx<BatteryState> batteryState = BatteryState.full.obs;


  static void initBatteryListener() {
    getBatteryPercentage();
    getBatteryState();
    timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      getBatteryPercentage();
    });
  }

  static void getBatteryPercentage() async {
    final batteryLevelValue = await battery.batteryLevel;
    batteryLevel.value = batteryLevelValue;
  }


  // static void getBatteryPercentage() async {
  //   final batteryLevel = await battery.batteryLevel;
  //   //level = batteryLevel;

  //       batteryLevel.value = batteryLevel;
  //   // You can update the UI here or use a GetX controller to manage state.

  // }

  static void getBatteryState() {
    streamSubscription = battery.onBatteryStateChanged.listen((state) {
      batteryState.value = state;
        
      late String powerStatus;
      if (state == BatteryState.charging) {
        powerStatus = 'ON';
      } else if (state == BatteryState.discharging) {
        powerStatus = 'OFF';
      } else {
        powerStatus = 'NULL';
      }
      if (powerStatus != 'NULL') {
        // log locally
        logHistory(powerStatus);

        String? storedUrl = GetStorage().read(AppConstants.SITE_URL);
        String webUrl = '$storedUrl?status=$powerStatus';
        bool isValidUrl = isValidUri(webUrl);
        if (isValidUrl) {
          // log to server
          http.get(Uri.parse(webUrl));
        }
      }
    });
  }

  static void logHistory(var status) {
    final getStorage = GetStorage();
    DateTime currentDate = getCurrentTimeInLagos();

    final historyJson = getStorage.read(AppConstants.HISTORY);
    final List<dynamic> prev =
        (historyJson != null) ? json.decode(historyJson) : [];

    if (prev.isNotEmpty) {
      final prevData = prev[0];
      if (prevData['finalStatus'].isEmpty && status == 'OFF') {
        DateTime date1 = DateTime.parse(prevData['dateOn'].toString());
        DateTime date2 = currentDate;

        int differenceInSeconds = date2.difference(date1).inSeconds;

        prev[0]["finalStatus"] = "OFF";
        prev[0]["dateOf"] = currentDate.toString();
        prev[0]["duration"] = differenceInSeconds;

        getStorage.write(AppConstants.HISTORY, jsonEncode(prev));
      } else if (status == 'ON' && prevData['finalStatus'].isNotEmpty) {
        final List<Map<String, dynamic>> newJsonData = [
          {
            "initialStatus": "ON",
            "dateOn": currentDate.toString(),
            "finalStatus": "",
            "dateOf": "",
            "duration": "",
          }
        ];
        prev.insertAll(0, newJsonData);

        if (prev.length > 50) {
          prev.removeRange(50, prev.length);
        }

        getStorage.write(AppConstants.HISTORY, jsonEncode(prev));
      }
    } else {
      if (status == 'ON') {
        final List<Map<String, dynamic>> newJsonData = [
          {
            "initialStatus": "ON",
            "dateOn": currentDate.toString(),
            "finalStatus": "",
            "dateOf": "",
            "duration": "",
          }
        ];

        getStorage.write(AppConstants.HISTORY, jsonEncode(newJsonData));
      }
    }
  }

  static bool isValidUri(String url) {
    // Use Uri.tryParse to check if the URL is valid
    Uri? uri = Uri.tryParse(url);

    return uri != null && (uri.scheme == 'http' || uri.scheme == 'https');
  }

  static DateTime getCurrentTimeInLagos() {
    // Get the Lagos timezone
    String lagosTimezone = 'Africa/Lagos';
    final lagosLocation = tz.getLocation(lagosTimezone);

    // Get the current date and time in Lagos timezone
    final DateTime currentTime = tz.TZDateTime.now(lagosLocation);

    return currentTime;
  }
}
