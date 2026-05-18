import 'package:berber_app/utils/texts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/colors.dart';

class Buttons {
  static ElevatedButton btnPrimary(String title, method) {
    return ElevatedButton(
        onPressed: method,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) => CColors.colorBrand),
          foregroundColor: MaterialStateProperty.resolveWith((states) => CColors.textColorSecondary),
          overlayColor: MaterialStateProperty.resolveWith((states) => CColors.overlayColor),
          maximumSize: MaterialStateProperty.resolveWith((states) => Size(double.infinity, 100))
        ),
        child: Text(title, style: GoogleFonts.nunito(
          color: CColors.textColorSecondary,
          fontWeight: FontWeight.bold,
          fontSize: 16
        ))
    );
  }
}
