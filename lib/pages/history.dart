import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:power_detector/utils/dimensions.dart';
import 'package:power_detector/utils/theme.dart';
import 'package:power_detector/widgets/app_text.dart';
import '../utils/app_constants.dart';
import '../widgets/app_bar.dart';
import '../widgets/app_large_text.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  final RxList<dynamic> list = <dynamic>[].obs;

  @override
  void initState() {
    super.initState();
    _updateList(GetStorage().read(AppConstants.HISTORY));
    GetStorage().listenKey(AppConstants.HISTORY, _updateList);
  }

  void _updateList(dynamic value) {
    list.assignAll((value != null) ? json.decode(value) : []);
  }

  

  @override
  Widget build(BuildContext context) {
   
    // final getStorage = GetStorage();

    // final historyJson = getStorage.read(AppConstants.HISTORY);
    // final List<dynamic> list =
    //     (historyJson != null) ? json.decode(historyJson) : [];

    return Scaffold(
      appBar: appBar(context.theme.backgroundColor, 'History'),
      body: Obx(() => (list.isNotEmpty)
            ? ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: Dimensions.width(20)),
                      margin: EdgeInsets.only(bottom: Dimensions.width(20)),
                      child: Container(
                        padding: const EdgeInsets.only(top: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Get.isDarkMode
                              ? Colors.white.withOpacity(0.09)
                              : Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Get.isDarkMode
                                  ? Colors.transparent
                                  : Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(
                                  3, 1), // changes position of shadow
                            ),
                          ],
                        ),
                        width: double.maxFinite,
                        height: Dimensions.height(80),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: Dimensions.width(35)),
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(7),
                                        bottomLeft: Radius.circular(7),
                                      )),
                                      height: Dimensions.height(40),
                                      width: Dimensions.height(40),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Themes.greenColor300,
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        child: Center(
                                            child: AppLargeText(
                                          text: '${list[index]['initialStatus']}',
                                          size: 15,
                                          color: Colors.white,
                                        )),
                                      ),
                                    ),
                                  ],
                                ),
                                (list[index]['duration'] != '')
                                    ? Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          AppText(
                                            text: "Duration",
                                            size: Dimensions.width(15),
                                            color: Get.isDarkMode
                                                ? Colors.white.withOpacity(0.8)
                                                : Colors.black.withOpacity(0.8),
                                          ),
                                          Gap(Dimensions.height(3)),
                                          Container(
                                            decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(7),
                                              bottomLeft: Radius.circular(7),
                                            )),
                                            height: Dimensions.height(28),
                                            width: Dimensions.height(80),
                                            child: Container(
                                              //margin: EdgeInsets.all(11),
                                              decoration: BoxDecoration(
                                                  color: Themes.blueColor100,
                                                  borderRadius:
                                                      BorderRadius.circular(10)),
                                              child: Center(
                                                  child: AppText(
                                                text: secondsToHms(
                                                    list[index]['duration']),
                                                size: 13,
                                                color: Colors.white,
                                              )),
                                            ),
                                          ),
                                        ],
                                      )
                                    : Container(),
                                (list[index]['finalStatus'].isNotEmpty)
                                    ? Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                right: Dimensions.width(35)),
                                            decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(7),
                                              bottomLeft: Radius.circular(7),
                                            )),
                                            height: Dimensions.height(40),
                                            width: Dimensions.height(40),
                                            child: Container(
                                              //padding: EdgeInsets.only(right: 10),
                                              decoration: BoxDecoration(
                                                  color: Colors.red,
                                                  borderRadius:
                                                      BorderRadius.circular(55)),
                                              child: Center(
                                                  child: AppLargeText(
                                                text:
                                                    '${list[index]['finalStatus']}',
                                                size: 15,
                                                color: Colors.white,
                                              )),
                                            ),
                                          ),
                                        ],
                                      )
                                    : Container(),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(top: Dimensions.height(6)),
                              padding: EdgeInsets.symmetric(
                                  horizontal: Dimensions.width(15)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  AppText(
                                    text:
                                        formatReadableDate(list[index]['dateOn']),
                                    size: Dimensions.width(18),
                                    color: Get.isDarkMode
                                        ? Colors.white.withOpacity(0.8)
                                        : Colors.black.withOpacity(0.8),
                                  ),
                                  (list[index]['finalStatus'].isNotEmpty)
                                      ? AppText(
                                          text: formatReadableDate(
                                              list[index]['dateOf']),
                                          size: Dimensions.width(18),
                                          color: Get.isDarkMode
                                              ? Colors.white.withOpacity(0.8)
                                              : Colors.black.withOpacity(0.8),
                                        )
                                      : Container(),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                )
              
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/record.png', // Replace with your image path
                      width: Dimensions.height(
                          250), // Set the desired width of the image
                      height: Dimensions.height(
                          250), // Set the desired height of the image
                    ),
                    AppText(
                      text: "No record found!",
                      size: 20,
                      color: Get.isDarkMode ? Colors.white70 : Colors.black87,
                    )
                  ],
                ),
              ),
      ),
    );
  }

  String formatReadableDate(String date) {
    DateTime tempDate = DateFormat("yyyy-MM-dd HH:mm:ss").parse(date);

    String formattedDate = DateFormat('MMMM d, y - HH:mm').format(tempDate);
    return formattedDate;
  }

  String secondsToHms(int seconds) {
    int hours = (seconds ~/ 3600);
    int minutes = (seconds % 3600) ~/ 60;
    int remainingSeconds = (seconds % 60);

    String formattedTime =
        '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';

    return formattedTime;
  }
}
