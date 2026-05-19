import 'dart:io';

import 'package:berber_app/utils/routes.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../model/login_model.dart';

class AuthenticationViewModel with ChangeNotifier {

  static void goTo(String route) => Routes.pushNamed(route);
  bool loading = false;

  LoginModel loginController = LoginModel();


  Future<void> login() async {
    loading = true;
    notifyListeners();
    try {


    }finally {
      loading = false;
      notifyListeners();
    }
  }

}