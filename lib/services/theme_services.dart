import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeService {
  final _box = GetStorage();
  final _key = 'isDarkMode';

  bool _loadThemeFromBox() => _box.read(_key) ?? false;

  get them => _loadThemeFromBox();
  ThemeMode get theme => _loadThemeFromBox()
      ? ThemeMode.dark
      : MediaQueryData.fromView(WidgetsBinding.instance.window)
              .platformBrightness ==
          Brightness.dark
          ? ThemeMode.dark
          : ThemeMode.light;

  void switchTheme() {
    Get.changeThemeMode(_loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
    _saveThemeToBox(!_loadThemeFromBox());
  }

  _saveThemeToBox(bool isDarkMode) => _box.write(_key, isDarkMode);

  ThemeService() {
    // Check if no theme is selected and set based on system theme
    if (_box.read(_key) == null) {
      bool isSystemDarkMode =
          MediaQueryData.fromView(WidgetsBinding.instance.window)
              .platformBrightness ==
          Brightness.dark;
      _saveThemeToBox(isSystemDarkMode);
    }
  }
}


// class ThemeService {
//   final _box = GetStorage();
//   final _key = 'isDarkMode';

//   _saveThemeToBox(bool isDarkMode) => _box.write(_key, isDarkMode);

//   bool _loadThemeFromBox() => _box.read(_key) ?? false;

//   get them => _loadThemeFromBox();
//   ThemeMode get theme => _loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;

//   void switchTheme() {
//     Get.changeThemeMode(_loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
//     _saveThemeToBox(!_loadThemeFromBox());
//   }
// }


