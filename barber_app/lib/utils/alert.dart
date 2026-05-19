import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class Alert {
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
  scaffoldMessenger(context, bool isSuccess, String message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.fixed,
        backgroundColor: isSuccess ? CColors.successColor :  CColors.dangerColor,
        content: Row(children: [Text(message, style: GoogleFonts.openSans(
          color: CColors.textColorSecondary,
          fontWeight: FontWeight.w600
        ),)]),
      ),
    );
  }
}
