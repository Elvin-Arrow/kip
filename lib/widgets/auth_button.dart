import 'package:flutter/material.dart';
import 'package:kip/utils/style_util.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    Key? key,
    required this.buttonText,
    required this.onTap,
    this.iconBackgroundColour,
    this.textColour = MyStyle.white,
    this.textFontWeight = FontWeight.w300,
  }) : super(key: key);

  final String buttonText;
  final VoidCallback onTap;
  final Color? iconBackgroundColour;
  final Color textColour;
  final FontWeight textFontWeight;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
        ),
        child: Stack(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: MyStyle.myText1(
                text: buttonText,
                color: textColour,
                weight: textFontWeight,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                decoration: BoxDecoration(
                  color: iconBackgroundColour,
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Icon(
                  Icons.chevron_right,
                  color: MyStyle.white,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
