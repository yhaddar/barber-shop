import 'package:berber_app/utils/images.dart';
import 'package:berber_app/utils/methods.dart';
import 'package:berber_app/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import '../../utils/colors.dart';
import '../../utils/routes.dart';
import '../../utils/texts.dart';
import '../../viewmodel/authentication_view_model.dart';
import '../../widgets/form.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (bool didPop, String? result){
        context.read<AuthenticationViewModel>().killLoginControllers();
      },
      child: Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: Consumer<AuthenticationViewModel>(
            builder: (context, auth, _) {
              return  Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 15,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Text(
                        Texts.titleLoginPage,
                        style: GoogleFonts.nunito(
                          color: CColors.textColorPrimary,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 20,
                        children: [
                          Form(
                            key: auth.formStateLogin,
                            child: Column(
                              spacing: 8,
                              children: [
                                FormWidget(
                                  textEditingController: auth.loginController.emailController,
                                  textInputType: TextInputType.emailAddress,
                                  hint: Texts.emailHint,
                                  prefixIcon: Icons.email_outlined,
                                  method: (v){
                                    if(v!.isEmpty){
                                      return "Required Fields";
                                    }else if(!v.contains("@")){
                                      return "Email Invalid";
                                    }
                                  },
                                ),
                                FormWidget(
                                  textEditingController: auth.loginController.passwordController,
                                  textInputType: TextInputType.text,
                                  hint: Texts.passwordHint,
                                  prefixIcon: Iconsax.key,
                                  suffixIcon: Iconsax.eye,
                                  isPassword: true,
                                  method: (v){
                                    if(v!.isEmpty){
                                      return "Required Fields";
                                    }else if(Methods.between(v, 8)){
                                      return "Password is too short";
                                    }
                                  },
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height: 50,
                                  child: Buttons.btnPrimary(Texts.signUp, () => auth.login(context), loading: auth.loading),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            spacing: 8,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                spacing: 10,
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.3,
                                    child: Divider(color: Colors.grey.shade300),
                                  ),
                                  Text(Texts.orContinueWith),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.3,
                                    child: Divider(color: Colors.grey.shade300),
                                  ),
                                ],
                              ),

                              Row(
                                spacing: 8,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Buttons.loginWithO2Auth(icon: Images.facebookIcon),
                                  Buttons.loginWithO2Auth(icon: Images.googleIcon),
                                  Buttons.loginWithO2Auth(icon: Images.appleIcon)
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Spacer(),
                    auth.formStateRegister.currentState == null ? Row(
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
                    ) : SizedBox.shrink(),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
