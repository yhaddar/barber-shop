import 'dart:convert';

import 'package:berber_app/model/register_model.dart';
import 'package:berber_app/utils/alert.dart';
import 'package:berber_app/utils/routes.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../model/login_model.dart';
import '../utils/api.dart';

class AuthenticationViewModel with ChangeNotifier {
  static void goTo(String route) => Routes.pushNamed(route);
  bool loading = false;
  final GlobalKey<FormState> formStateLogin = .new();
  final GlobalKey<FormState> formStateRegister = .new();

  LoginModel loginController = LoginModel();
  RegisterModel registerModel = RegisterModel();

  Future<void> login(context) async {
    loading = true;
    notifyListeners();
    try {
      if (formStateLogin.currentState!.validate()) {
        final url = Uri.parse(
          "${dotenv.env['API_HOST']}/${API.loginAPI}",
        );
        final response = await http.post(
          url,
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
          },
          body: jsonEncode({
            "email": loginController.emailController.text,
            "password": loginController.passwordController.text,
          }),
        );

        final body = jsonDecode(response.body);

        if(body['success'] == false){
          Alert.scaffoldMessenger(context, false, body['message']);
        }else {
          print("welcome back");
        }

      }
    } finally {
      loading = false;
      notifyListeners();
    }
  }

  Future<void> register(context) async {
    loading = true;
    notifyListeners();
    try {

      if(formStateRegister.currentState!.validate()){
        print("");
      }

    }finally {
      loading = false;
      notifyListeners();
    }
  }

  Future<void> killControllers() async {
    loginController.emailController.clear();
    loginController.passwordController.clear();
  }

}
