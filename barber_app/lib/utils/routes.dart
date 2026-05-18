import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../view/authentication/login_view.dart';
import '../view/onboarding/onboarding_view.dart';

class Routes {

  static String onboarding = "/welcome";
  static String login = "/login";

  static final pages = [
    GetPage(name: onboarding, page: () => OnboardingView()),
    GetPage(name: login, page: () => LoginView())
  ];

  static void pushToNextPage(context, String route){
    Navigator.pushNamed(context, route);
  }

}