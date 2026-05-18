import 'package:berber_app/utils/routes.dart';
import 'package:get/get.dart';

class OnboardingViewModel {
  
  static void nextPage(context, route){
    Routes.pushToNextPage(context, route);
  }
  
}