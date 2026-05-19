import 'package:flutter/cupertino.dart';

class RegisterModel {
  final TextEditingController emailController = .new();
  final TextEditingController passwordController = .new();
  final TextEditingController confirmPasswordController = .new();
  final TextEditingController firstNameController = .new();
  final TextEditingController middleNameController = .new();
  final TextEditingController lastNameController = .new();
  late String phoneController = "";
  late DateTime dateBirthController = DateTime.now();
  late String genderController = "M";
}