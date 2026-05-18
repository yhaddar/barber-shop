import 'package:berber_app/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OnboardingViewModel extends GetxController {

  PageController pageController = PageController();
  RxInt index = 0.obs;

  static void nextPage(String route){
    Routes.pushToNextPage(route);
  }

  void changeIndex(i){
    index.value = i;
  }

  void nextOnloading(){
    if(index.value == 2){
      Routes.pushNamed(Routes.auth);
    }
    print(index.value);
  }
  
}