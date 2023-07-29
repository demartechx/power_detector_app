import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:power_detector/pages/history.dart';
import 'package:power_detector/pages/home_page.dart';
import 'package:power_detector/pages/settings.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int _selectedIndex = 1;

  List pages = [
     History(),
    const HomePage(),
    const Settings(),
  ];

  void onTapNav(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        // For Android.
        // Use [light] for white status bar and [dark] for black status bar.
        statusBarIconBrightness: Brightness.light,
        // For iOS.
        // Use [dark] for white status bar and [light] for black status bar.
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor:
              context.theme.bottomNavigationBarTheme.backgroundColor,

          onTap: onTapNav,
          selectedItemColor:
              context.theme.bottomNavigationBarTheme.selectedItemColor,
          unselectedItemColor:
              context.theme.bottomNavigationBarTheme.unselectedItemColor,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          // selectedFontSize: 20,
          // unselectedFontSize: 10,
          currentIndex: _selectedIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Iconsax.transaction_minus),
              label: "History",
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.battery_charging),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.setting),
              label: "Settings",
            ),
          ],
        ),
      ),
    );
  }
}