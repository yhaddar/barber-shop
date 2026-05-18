import 'package:berber_app/utils/colors.dart';
import 'package:berber_app/viewmodel/authentication_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/images.dart';
import '../../utils/routes.dart';
import '../../utils/texts.dart';
import '../../widgets/buttons.dart';

class AuthenticationView extends StatelessWidget {
  const AuthenticationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Images.loginImage),
                fit: BoxFit.cover,
              ),
            ),
            height: MediaQuery.of(context).size.height * 0.3,
          ),
          SizedBox(height: 10),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Let's you in",
              textAlign: TextAlign.center,
              style: GoogleFonts.nunito(
                color: CColors.textColorPrimary,
                fontWeight: FontWeight.bold,
                fontSize: 33,
              ),
            ),
          ),
          SizedBox(height: 50),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              spacing: 10,
              children: [
                Buttons.loginWithO2Auth(
                  title: "Continue with Facebook",
                  icon: Images.facebookIcon,
                  method: () => print("hello world"),
                ),
                Buttons.loginWithO2Auth(
                  title: "Continue with Google",
                  icon: Images.googleIcon,
                  method: () => print("hello world"),
                ),
                Buttons.loginWithO2Auth(
                  title: "Continue with Apple",
                  icon: Images.appleIcon,
                  method: () => print("hello world"),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Divider(color: Colors.grey.shade300),
              ),
              Text("or"),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Divider(color: Colors.grey.shade300),
              ),
            ],
          ),
          SizedBox(height: 10),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 48,
            child: Buttons.btnPrimary(
              Texts.signInWithPassword,
              () => AuthenticationViewModel.goTo(Routes.login),
            ),
          ),
          SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                Texts.dontHaveAnAccount,
                style: GoogleFonts.nunito(
                  color: CColors.textColorPrimary.withValues(alpha: 0.9),
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
              Buttons.textButton(() => AuthenticationViewModel.goTo(Routes.register), Texts.signUp)
            ],
          ),
        ],
      ),
    );
  }
}
