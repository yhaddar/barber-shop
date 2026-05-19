import 'package:berber_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class FormWidget extends StatefulWidget {
  final TextEditingController textEditingController;
  final TextInputType? textInputType;
  final bool isPassword;
  final String hint;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Function(String?)? method;

  const FormWidget({
    super.key,
    required this.textEditingController,
    this.textInputType = TextInputType.text,
    this.isPassword = false,
    required this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.method,
  });

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  bool _isVisible = false;

  void _togglePassword() => setState(() => _isVisible = !_isVisible);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: true,
      controller: widget.textEditingController,
      keyboardType: widget.textInputType,
      maxLines: 1,
      obscureText: widget.isPassword ? !_isVisible : false,
      decoration: InputDecoration(
        filled: false,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: CColors.overlayColor, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: CColors.dangerColor, width: 2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: CColors.overlayColor, width: 2),
        ),
        hint: Text(
          widget.hint,
          style: GoogleFonts.openSans(
            color: CColors.textColorPrimary.withValues(alpha: 0.9),
            fontWeight: FontWeight.w500,
          ),
        ),
        prefixIcon: widget.prefixIcon != null ? Icon(widget.prefixIcon) : null,
        suffixIcon: widget.suffixIcon != null
            ? (widget.isPassword
                  ? IconButton(
                      onPressed: () => _togglePassword(),
                      icon: Icon(_isVisible ? Iconsax.eye_slash : Iconsax.eye),
                    )
                  : Icon(widget.suffixIcon))
            : null,
      ),
      validator: (v) {
        if (widget.method != null) {
          return widget.method!(v);
        }
        return null;
      },
    );
  }
}
