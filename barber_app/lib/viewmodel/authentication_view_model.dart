import 'dart:convert';

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
  final GlobalKey<FormState> formState = .new();

  LoginModel loginController = LoginModel();

  Future<void> login(context) async {
    loading = true;
    notifyListeners();
    try {
      if (formState.currentState!.validate()) {
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

        Alert.scaffoldMessenger(context, false, "");
      }
    } finally {
      loading = false;
      notifyListeners();
    }
  }
}
