import 'package:berber_app/utils/storage.dart';
import 'package:berber_app/viewmodel/authentication_view_model.dart';
import 'package:berber_app/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../utils/colors.dart';
import '../../utils/texts.dart';
import '../../widgets/forms/code_input_widget.dart';

class ActiveAccountView extends StatelessWidget {
  const ActiveAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          Texts.sendCodeTitle,
          style: GoogleFonts.nunito(
            color: CColors.textColorPrimary,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Consumer<AuthenticationViewModel>(
        builder: (context, auth, _) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 22,
                  children: [
                    FutureBuilder(
                      future: Storage.index("email"),
                      builder: (context, snap) {
                        return Text(
                          "${Texts.sendCodeDescription} ${snap.data}",
                          style: GoogleFonts.nunito(
                            color: CColors.textColorPrimary,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      },
                    ),
                    Form(
                      key: auth.formStateCodeActive,
                      child: CodeInputWidget(
                        textEditingController: auth.codeModel,
                        errors: auth.errors
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  child: Buttons.btnPrimary(Texts.continueText, () => auth.activeAccount(), loading: auth.loading),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
