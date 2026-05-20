import 'package:berber_app/utils/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';
import 'package:time_picker_spinner_pop_up/time_picker_spinner_pop_up.dart';

import '../../utils/colors.dart';
import '../../utils/texts.dart';
import '../../viewmodel/authentication_view_model.dart';
import '../../widgets/buttons.dart';
import '../../widgets/forms/form_widget.dart';

class FillProfileView extends StatefulWidget {
  const FillProfileView({super.key});

  @override
  State<FillProfileView> createState() => _FillProfileViewState();
}

class _FillProfileViewState extends State<FillProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          Texts.fillProfilePage,
          style: GoogleFonts.nunito(
            color: CColors.textColorPrimary,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Consumer<AuthenticationViewModel>(
          builder: (context, auth, _) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 15,
                children: [
                  SizedBox(height: 2,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage(auth.registerModel.genderController == "M" ? Images.boyProfile : Images.womenProfile), fit: BoxFit.cover),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 20,
                      children: [
                        Form(
                          key: auth.formStateFillProfile,
                          child: Column(
                            spacing: 8,
                            children: [
                              FormWidget(
                                textEditingController: auth
                                    .registerModel
                                    .firstNameController,
                                textInputType: TextInputType.text,
                                hint: Texts.firstNameHint,
                                method: (v) {
                                  if (v!.isEmpty) {
                                    return "Required Fields";
                                  }
                                },
                              ),
                              FormWidget(
                                textEditingController:
                                auth.registerModel.lastNameController,
                                textInputType: TextInputType.text,
                                hint: Texts.lastNameHint,
                                method: (v) {
                                  if (v!.isEmpty) {
                                    return "Required Fields";
                                  }
                                },
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: 60,
                                child: TimePickerSpinnerPopUp(
                                  mode: CupertinoDatePickerMode.date,
                                  initTime: auth.registerModel.dateBirthController,
                                  onChange: (v) =>
                                      setState(() => auth.registerModel.dateBirthController = v),
                                ),
                              ),
                              SizedBox(
                                child: IntlPhoneField(
                                  decoration: InputDecoration(
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
                                  ),
                                  initialCountryCode: 'MA',
                                  initialValue: auth.registerModel.phoneController,
                                  onChanged: (v) => setState(() => auth.registerModel.phoneController = v.completeNumber),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(vertical: 10),
                                child: DropdownButtonFormField<String>(
                                  value: auth.registerModel.genderController,
                                  isExpanded: true,
                                  decoration: InputDecoration(
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
                                  ),
                                  items: [
                                    DropdownMenuItem(
                                      value: "M",
                                      child: Text(
                                        "Male",
                                        style: GoogleFonts.openSans(
                                          color: CColors.textColorPrimary
                                              .withValues(alpha: 0.9),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    DropdownMenuItem(
                                      value: "F",
                                      child: Text(
                                        "Female",
                                        style: GoogleFonts.openSans(
                                          color: CColors.textColorPrimary
                                              .withValues(alpha: 0.9),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                  onChanged: (v) =>
                                      setState(() => auth.registerModel.genderController = v!),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                child: Buttons.btnPrimary(
                                  Texts.continueText,
                                  () => auth.register(context),
                                  loading: auth.loading,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
