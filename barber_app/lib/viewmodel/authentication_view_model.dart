import 'dart:convert';

import 'package:berber_app/model/register_model.dart';
import 'package:berber_app/utils/alert.dart';
import 'package:berber_app/utils/routes.dart';
import 'package:berber_app/utils/texts.dart';
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
  final GlobalKey<FormState> formStateFillProfile = .new();

  LoginModel loginController = LoginModel();
  RegisterModel registerModel = RegisterModel();

  Future<void> login(context) async {
    loading = true;
    notifyListeners();
    try {
      if (formStateLogin.currentState!.validate()) {
        final url = Uri.parse("${dotenv.env['API_HOST']}/${API.loginAPI}");
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

        if (body['success'] == false) {
          Alert.scaffoldMessenger(context, false, body['message']);
        } else {
          print("welcome back");
        }
      }
    } finally {
      loading = false;
      notifyListeners();
    }
  }

  Future<void> goToFillProfile() async {
    loading = true;
    notifyListeners();
    try {
      if (formStateRegister.currentState!.validate()) {
        Routes.pushNamed(Routes.fillProfile);
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
      if (formStateFillProfile.currentState!.validate()) {
        if ((DateTime.now().year - registerModel.dateBirthController.year) <
            18) {
          Alert.scaffoldMessenger(context, false, Texts.msgErrorDateBirth);
        } else if (registerModel.phoneController.isEmpty) {
          Alert.scaffoldMessenger(context, false, Texts.msgErrorPhone);
        } else if (registerModel.genderController.isEmpty) {
          Alert.scaffoldMessenger(context, false, Texts.msgErrorGender);
        } else {
          final url = Uri.parse("${dotenv.env['API_HOST']}/${API.registerPI}");
          final response = await http.post(
            url,
            headers: {
              "Content-Type": "application/json",
              "Accept": "application/json",
            },
            body: jsonEncode({
              "first_name": registerModel.firstNameController.text,
              "last_name": registerModel.lastNameController.text,
              "email": registerModel.emailController.text,
              "password": registerModel.passwordController.text,
              "password_confirmation":
                  registerModel.confirmPasswordController.text,
              "gender": registerModel.genderController,
              "phone": registerModel.phoneController,
              "date_birth":
                  "${registerModel.dateBirthController.day}-${registerModel.dateBirthController.month}-${registerModel.dateBirthController.year}",
            }),
          );

          final body = jsonDecode(response.body);
          print(response.statusCode);
        }
      }
    } finally {
      loading = false;
      notifyListeners();
    }
  }

  Future<void> killLoginControllers() async {
    loginController.emailController.clear();
    loginController.passwordController.clear();
  }

  Future<void> killRegisterControllers() async {
    registerModel.emailController.clear();
    registerModel.passwordController.clear();
    registerModel.confirmPasswordController.clear();
  }
}
