import 'package:berber_app/model/code_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/colors.dart';

class CodeInputWidget extends StatelessWidget {
  final CodeModel textEditingController;
  final Function(String?)? method;
  final Map<String, dynamic>? errors;

  const CodeInputWidget({
    super.key,
    required this.textEditingController,
    this.method,
    this.errors,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 2,
        children: [
          Row(
            spacing: 4,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.23,
                child: TextFormField(
                  enabled: true,
                  controller: textEditingController.code1,
                  keyboardType: TextInputType.number,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  textAlignVertical: TextAlignVertical.center,
                  maxLength: 1,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  style: GoogleFonts.nunito(
                    color: CColors.textColorPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.withValues(alpha: 0.1),
                    counterText: "",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade300,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: CColors.overlayColor,
                        width: 2,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: CColors.dangerColor,
                        width: 2,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: CColors.overlayColor,
                        width: 2,
                      ),
                    ),
                    errorMaxLines: 2,
                    errorStyle: TextStyle(height: 0, fontSize: 0),
                  ),
                  onChanged: (v) {
                    if (v.isEmpty) {
                      FocusScope.of(context).previousFocus();
                    }

                    if (v.length == 1) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "";
                    } else if (!v.isNum) {
                      return "";
                    }
                  },
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.23,
                child: TextFormField(
                  enabled: true,
                  controller: textEditingController.code2,
                  keyboardType: TextInputType.number,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  textAlignVertical: TextAlignVertical.center,
                  maxLength: 1,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  style: GoogleFonts.nunito(
                    color: CColors.textColorPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.withValues(alpha: 0.1),
                    counterText: "",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade300,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: CColors.overlayColor,
                        width: 2,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: CColors.dangerColor,
                        width: 2,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: CColors.overlayColor,
                        width: 2,
                      ),
                    ),
                    errorMaxLines: 2,
                    errorStyle: TextStyle(height: 0, fontSize: 0),
                  ),
                  onChanged: (v) {
                    if (v.isEmpty) {
                      FocusScope.of(context).previousFocus();
                    }

                    if (v.length == 1) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "";
                    } else if (!v.isNum) {
                      return "";
                    }
                  },
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.23,
                child: TextFormField(
                  enabled: true,
                  controller: textEditingController.code3,
                  keyboardType: TextInputType.number,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  textAlignVertical: TextAlignVertical.center,
                  maxLength: 1,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  style: GoogleFonts.nunito(
                    color: CColors.textColorPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.withValues(alpha: 0.1),
                    counterText: "",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade300,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: CColors.overlayColor,
                        width: 2,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: CColors.dangerColor,
                        width: 2,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: CColors.overlayColor,
                        width: 2,
                      ),
                    ),
                    errorMaxLines: 2,
                    errorStyle: TextStyle(height: 0, fontSize: 0),
                  ),
                  onChanged: (v) {
                    if (v.isEmpty) {
                      FocusScope.of(context).previousFocus();
                    }

                    if (v.length == 1) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                  validator: (v) {
                    if (v!.isEmpty) {
                      return " ";
                    } else if (!v.isNum) {
                      return " ";
                    }
                  },
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.23,
                child: TextFormField(
                  enabled: true,
                  controller: textEditingController.code4,
                  keyboardType: TextInputType.number,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  textAlignVertical: TextAlignVertical.center,
                  maxLength: 1,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  style: GoogleFonts.nunito(
                    color: CColors.textColorPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.withValues(alpha: 0.1),
                    counterText: "",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade300,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: CColors.overlayColor,
                        width: 2,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: CColors.dangerColor,
                        width: 2,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: CColors.overlayColor,
                        width: 2,
                      ),
                    ),
                    errorMaxLines: 2,
                    errorStyle: TextStyle(height: 0, fontSize: 0),
                  ),
                  onChanged: (v) {
                    if (v.isEmpty) {
                      FocusScope.of(context).previousFocus();
                    }

                    if (v.length == 1) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "";
                    } else if (!v.isNum) {
                      return "";
                    }
                  },
                ),
              ),
            ],
          ),
         if(errors!.isNotEmpty && errors?['success'] != true)
           Text(
             errors!['message'].toLowerCase(),
             style: GoogleFonts.nunito(
               color: CColors.dangerColor,
               fontSize: 14,
               fontWeight: FontWeight.w600,
             ),
           )
        ],
      ),
    );
  }
}
