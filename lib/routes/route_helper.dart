import 'package:get/get.dart';
import 'package:power_detector/pages/home_page.dart';
import 'package:power_detector/pages/menu_page.dart';
import 'package:power_detector/pages/splash_screen.dart';


class RouteHelper {
  
  //HOME
  static const String initial = "/";
  static const String homePage = "/home-page";
  static const String menuPage = "/menu-page";
 


  static String getinitial() => initial;
  static String getHomePage() => homePage;
  static String getMenuPage() => menuPage;





  static List<GetPage> routes = [
    //HOME
    GetPage(
      name: initial,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: homePage,
      page: () => const HomePage(),
    ),
    GetPage(
      name: menuPage,
      page: () => const MenuPage(),
    ),

    // GetPage(
    //   name: displayPage,
    //   page: () => const DisplayScreen(),
    // ),
    // GetPage(
    //   name: signInPage,
    //   page: () => const SignInPage(),
    // ),
    // GetPage(
    //   name: signUpPage,
    //   page: () => const SignUpPage(),
    // ),
 


  ];
}
