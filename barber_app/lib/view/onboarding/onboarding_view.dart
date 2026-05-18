import 'package:berber_app/utils/colors.dart';
import 'package:berber_app/viewmodel/onboarding_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../utils/images.dart';
import '../../utils/texts.dart';
import '../../widgets/buttons.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final OnboardingViewModel onboardingViewModel = OnboardingViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 5,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.87,
              child: PageView(
                controller: onboardingViewModel.pageController,
                onPageChanged: (i) => onboardingViewModel.changeIndex(i),
                children: List.generate(Images.onboarding.length, (i) {
                  return Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.6,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(Images.onboarding[i]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 8,),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        height: MediaQuery.of(context).size.height * 0.26,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Texts.onboardingText[i],
                              textAlign: TextAlign.center,
                              style: GoogleFonts.nunito(
                                color: CColors.textColorPrimary,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]
                  );
                }),
              ),
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: SmoothPageIndicator(
                      controller: onboardingViewModel.pageController,
                      count: Texts.onboardingText.length,
                      effect: ExpandingDotsEffect(
                        dotHeight: 10,
                        dotWidth: 10,
                        activeDotColor: CColors.colorBrand,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                 Obx(() {
                   if(onboardingViewModel.index.value >= 2) {
                     return SizedBox(
                       width: MediaQuery.of(context).size.width,
                       height: 50,
                       child: Buttons.btnPrimary(
                         Texts.getStarted,
                             () => onboardingViewModel.nextOnloading(context),
                       ),
                     );
                   }else {
                     return SizedBox.shrink();
                   }
                 }),
                  SizedBox(height: 25),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
