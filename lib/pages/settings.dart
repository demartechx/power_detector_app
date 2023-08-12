import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconsax/iconsax.dart';
import 'package:power_detector/services/battery_service.dart';
import 'package:power_detector/services/theme_services.dart';
import 'package:power_detector/utils/app_constants.dart';
import 'package:power_detector/utils/dimensions.dart';
import 'package:power_detector/utils/theme.dart';
import 'package:power_detector/widgets/app_large_text.dart';
import 'package:power_detector/widgets/app_text.dart';
import 'package:power_detector/widgets/app_text_field.dart';
import 'package:power_detector/widgets/custom_loader.dart';
import 'package:power_detector/widgets/responsive_button.dart';
import 'package:power_detector/widgets/show_custom_snackbar.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  var isLoading = false;

  var urlController = TextEditingController();

  var storage = GetStorage();

  void _urlProcess() {
    String url = urlController.text.trim();
    bool isValidUrl = BatteryService.isValidUri(url);

    if (url.isEmpty) {
      showCustomSnackBar("The url is empty.", title: "Error");
    } else if (!isValidUrl) {
      showCustomSnackBar("The url is invalid, kindly input a valid URL.",
          title: "Error");
    } else {
      setState(() {
        isLoading = true;
      });

      storage.write(AppConstants.SITE_URL, url);

      Timer(const Duration(milliseconds: 200), () {
        setState(() {
          isLoading = false;
          urlController.clear();
        });
      }

          //Get.offNamed(RouteHelper.getHomePage()),
          );
    }
  }

  void _closeKeyboard() {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      GestureDetector(
        onTap: _closeKeyboard,
        child: Scaffold(
          appBar: _appBar(),
          backgroundColor: context.theme.backgroundColor,
          body: Container(
            margin: EdgeInsets.symmetric(horizontal: Dimensions.width(30)),
            child: Column(
              children: [
                Gap(Dimensions.height(20)),
                Container(
                  padding: const EdgeInsets.all(20),

                  ///color: Colors.green,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.0),
                    borderRadius: BorderRadius.circular(Dimensions.height(8)),
                    color: Themes.greenColor400,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                          text: "Website Callback:",
                          size: 13,
                          color: Get.isDarkMode ? Colors.white : Colors.white),
                      Divider(
                          height: Dimensions.height(40), color: Colors.grey),
                      AppLargeText(
                          text:
                              storage.read(AppConstants.SITE_URL) ?? 'Not set',
                          size: 15,
                          color: Get.isDarkMode ? Colors.white : Colors.white),
                    ],
                  ),
                ),
                Gap(Dimensions.height(40)),
                AppTextField(
                  textController: urlController,
                  hintText: "website url",
                  icon: Iconsax.wifi_square,
                  maxLength: 50,
                  type: 'text',
                ),
                Gap(Dimensions.height(15)),
                GestureDetector(
                  onTap: (() {
                    _closeKeyboard;
                    _urlProcess();
                  }),
                  child: ResponsiveButton(
                    color: Themes.blueColor100,
                    text: "Submit",
                    isResponsive: true,
                    height: 50,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      if (isLoading) const CustomLoader()
    ]);
  }

  _appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: context.theme.backgroundColor,
      automaticallyImplyLeading: false,
      title: Text(
        'Settings',
        style: TextStyle(
          fontSize: 17,
          color: Get.isDarkMode ? Colors.white : Colors.black,
        ),
      ),
      centerTitle: true,
      actions: [
        GestureDetector(
          onTap: () {
            ThemeService().switchTheme();
          },
          child: Icon(
            Get.isDarkMode
                ? Icons.light_mode_outlined
                : Icons.dark_mode_outlined,
            size: 25,
            color: Get.isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
