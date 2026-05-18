import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../view/onboarding/onboarding.dart';

class Routes {

  static String onboarding = "/welcome";

  static final pages = [
    GetPage(name: onboarding, page: () => Onboarding())
  ];

  static void pushToNextPage(context, String route){
    Navigator.pushNamed(context, route);
  }

}