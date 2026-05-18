import 'package:berber_app/utils/texts.dart';
import 'package:berber_app/viewmodel/onboarding_view_model.dart';
import 'package:berber_app/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/colors.dart';
import '../../utils/images.dart';
import '../../utils/routes.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Images.onboarding1),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(color: CColors.opacityOnboarding),

          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.bottomLeft,
            margin: EdgeInsets.only(left: 10, right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Texts.welcomeTo,
                  style: GoogleFonts.nunito(color: CColors.textColorSecondary, fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Text(
                  Texts.brandName,
                  style: GoogleFonts.caveat(
                    color: CColors.colorBrand,
                    fontSize: 50,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  Texts.brandDescription,
                  style: GoogleFonts.raleway(
                      color: CColors.textColorSecondary,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 20,),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: Buttons.btnPrimary(Texts.nextBtn, () => OnboardingViewModel.nextPage(context, Routes.onboarding)),
                ),
                SizedBox(height: 20,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
