import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../view/authentication/active_account_view.dart';
import '../view/authentication/authentication_view.dart';
import '../view/authentication/fill_profile_view.dart';
import '../view/authentication/login_view.dart';
import '../view/authentication/register_view.dart';
import '../view/home/home_view.dart';
import '../view/onboarding/onboarding_view.dart';

class Routes {

  static String onboarding = "/welcome";
  static String auth = "/authentication";
  static String login = "/login";
  static String register = "/register";
  static String fillProfile = "/fill-profile";
  static String activeAccount = "/active-account";
  static String home = "/home";

  static final pages = [
    GetPage(name: onboarding, page: () => OnboardingView()),
    GetPage(name: auth, page: () => AuthenticationView()),
    GetPage(name: login, page: () => LoginView()),
    GetPage(name: register, page: () => RegisterView()),
    GetPage(name: fillProfile, page: () => FillProfileView()),
    GetPage(name: activeAccount, page: () => ActiveAccountView()),
    GetPage(name: home, page: () => HomeView()),
  ];

  static void pushToNextPage(String route){
    Get.offNamed(route);
  }

  static void pushNamed(String route){
    Get.toNamed(route);
  }

}