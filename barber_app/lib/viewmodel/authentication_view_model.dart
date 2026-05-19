
import 'package:berber_app/utils/routes.dart';
import 'package:flutter/widgets.dart';

import '../model/login_model.dart';

class AuthenticationViewModel with ChangeNotifier {

  static void goTo(String route) => Routes.pushNamed(route);
  bool loading = false;
  final GlobalKey<FormState> formState = .new();

  LoginModel loginController = LoginModel();


  Future<void> login() async {
    loading = true;
    notifyListeners();
    try {

      if(formState.currentState!.validate()){
        print("form validated");
      }


    }finally {
      loading = false;
      notifyListeners();
    }
  }

}