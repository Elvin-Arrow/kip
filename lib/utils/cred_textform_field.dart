import 'package:flutter/material.dart';
import 'package:kip/utils/style_util.dart';

class CredTextFormField extends StatelessWidget {
  const CredTextFormField({
    Key? key,
    required this.icon,
    required this.onChanged,
    this.iconColour = MyStyle.primaryColor,
    this.cursorColour = MyStyle.primaryColor,
    this.focusColour = MyStyle.primaryColor,
    this.borderSideColour = MyStyle.textGrey,
    this.focusBorderColour = MyStyle.primaryColor,
    this.hintText = '',
    this.hintTextColour = Colors.white,
    this.obscureText = false,
    this.textColour = MyStyle.primaryColor,
  }) : super(key: key);

  final IconData icon;
  final Color iconColour;
  final Color cursorColour;
  final Color focusColour;
  final Color borderSideColour;
  final Color focusBorderColour;
  final ValueChanged<String> onChanged;
  final String hintText;
  final Color hintTextColour;
  final bool obscureText;
  final Color textColour;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: cursorColour,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: hintTextColour,
          fontSize: 12.0,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1.5,
            color: borderSideColour,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: this.focusBorderColour,
            width: 2,
          ),
        ),
        prefixIcon: Icon(
          this.icon,
          color: iconColour,
        ),
        focusColor: focusColour,
      ),
      onChanged: onChanged,
      obscureText: obscureText,
      style: TextStyle(
        color: textColour,
      ),
    );
  }
}
