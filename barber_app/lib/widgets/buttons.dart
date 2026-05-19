import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/colors.dart';

class Buttons {
  static ElevatedButton btnPrimary(
    String title,
    method, {
    bool loading = false,
  }) {
    return ElevatedButton(
      onPressed: method,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) => CColors.colorBrand,
        ),
        foregroundColor: MaterialStateProperty.resolveWith(
          (states) => CColors.textColorSecondary,
        ),
        overlayColor: MaterialStateProperty.resolveWith(
          (states) => CColors.overlayColor,
        ),
        maximumSize: MaterialStateProperty.resolveWith(
          (states) => Size(double.infinity, 100),
        ),
      ),
      child: loading
          ? SizedBox(
              width: 22,
              height: 22,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(
                  CColors.textColorSecondary,
                ),
              ),
            )
          : Text(
              title,
              style: GoogleFonts.nunito(
                color: CColors.textColorSecondary,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
    );
  }

  static ElevatedButton loginWithO2Auth({
    required String icon,
    String title = "",
    method,
  }) {
    return ElevatedButton(
      onPressed: method,
      style: ButtonStyle(
        padding: MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 12)),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Colors.grey.shade300, width: 1),
          ),
        ),
        elevation: MaterialStatePropertyAll(0),
        backgroundColor: MaterialStatePropertyAll(Colors.transparent),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 10,
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(icon),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ?title != ""
              ? Text(
                  title,
                  style: GoogleFonts.nunito(
                    color: CColors.textColorPrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                )
              : null,
        ],
      ),
    );
  }

  static TextButton textButton(method, String title) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        foregroundColor: CColors.colorBrand,
        elevation: 0,
        textStyle: GoogleFonts.nunito(
          color: CColors.colorBrand,
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
        overlayColor: Colors.transparent,
      ),
      onPressed: method,
      child: Text(title),
    );
  }
}
