import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:power_detector/services/battery_service.dart';
import 'package:power_detector/routes/route_helper.dart';
import 'package:power_detector/services/theme_services.dart';
import 'package:power_detector/utils/theme.dart';
import 'package:timezone/data/latest.dart' as tz;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  tz.initializeTimeZones();
  BatteryService.initBatteryListener();

  

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Power Status',
      themeMode: ThemeService().theme, //ThemeMode.dark,
      theme: Themes.light,
      darkTheme: Themes.dark,
      //home: Settings(),
      initialRoute: RouteHelper.getinitial(),
      getPages: RouteHelper.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
