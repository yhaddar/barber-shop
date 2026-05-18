import 'package:berber_app/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OnboardingViewModel extends GetxController {

  PageController pageController = PageController();
  RxInt index = 0.obs;

  static void nextPage(context, route){
    Routes.pushToNextPage(context, route);
  }

  void changeIndex(i){
    index.value = i;
  }

  void nextOnloading(context){
    if(index.value == 2){
      Routes.pushToNextPage(context, Routes.login);
    }
    print(index.value);
  }
  
}