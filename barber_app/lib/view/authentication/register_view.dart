import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import '../../utils/colors.dart';
import '../../utils/images.dart';
import '../../utils/methods.dart';
import '../../utils/routes.dart';
import '../../utils/texts.dart';
import '../../viewmodel/authentication_view_model.dart';
import '../../widgets/buttons.dart';
import '../../widgets/form.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (bool didPop, String? result){
        context.read<AuthenticationViewModel>().killControllers();
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
                        Texts.titleRegisterPage,
                        style: GoogleFonts.nunito(
                          color: CColors.textColorPrimary,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 20,
                        children: [
                          Form(
                            key: auth.formStateRegister,
                            child: Column(
                              spacing: 8,
                              children: [
                                FormWidget(
                                  textEditingController: auth.registerModel.emailController,
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
                                  textEditingController: auth.registerModel.passwordController,
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
                                FormWidget(
                                  textEditingController: auth.registerModel.confirmPasswordController,
                                  textInputType: TextInputType.text,
                                  hint: Texts.passwordConfirmedHint,
                                  prefixIcon: Iconsax.key,
                                  suffixIcon: Iconsax.eye,
                                  isPassword: true,
                                  method: (v){
                                    if(v!.isEmpty){
                                      return "Required Fields";
                                    }else if(auth.registerModel.passwordController.text != auth.registerModel.confirmPasswordController.text){
                                      return "Password does not match.";
                                    }
                                  },
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height: 50,
                                  child: Buttons.btnPrimary(Texts.signIn, () => auth.register(context), loading: auth.loading),
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
                    auth.formStateLogin.currentState == null ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          Texts.haveAnAccount,
                          style: GoogleFonts.nunito(
                            color: CColors.textColorPrimary.withValues(alpha: 0.9),
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                        Buttons.textButton(() => AuthenticationViewModel.goTo(Routes.login), Texts.signIn)
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
