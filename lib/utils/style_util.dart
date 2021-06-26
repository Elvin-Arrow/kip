import 'package:flutter/material.dart';

abstract class MyStyle {
  static const Color white = Color.fromRGBO(254, 254, 254, 1);
  static const Color grey = Color.fromRGBO(197, 201, 204, 1);
  static const Color textGrey = Color.fromRGBO(129, 138, 148, 1);

  static const Color primaryColor = Color.fromRGBO(57, 178, 197, 1);
  static const Color primiaryColorLight = Color.fromRGBO(0, 209, 160, 1);
  static const Color bgColor = Color.fromRGBO(236, 245, 245, 1);

  static const double paddingHorizontal = 20;

  static bool isSmallPhone(BuildContext context) {
    return MediaQuery.of(context).size.width <= 300;
  }

  static double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top;
  }

  static myText0({
    required String text,
    FontWeight weight = FontWeight.normal,
    Color color = Colors.black,
  }) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 12, fontFamily: "Hind", color: color, fontWeight: weight),
    );
  }

  static Text myText1({
    required String text,
    FontWeight weight = FontWeight.normal,
    Color color = Colors.black,
    TextAlign? textAlign,
  }) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 16, fontFamily: "Hind", color: color, fontWeight: weight),
      textAlign: textAlign,
    );
  }

  static Text myText2({
    required String text,
    FontWeight weight = FontWeight.normal,
    Color color = Colors.black,
    TextAlign? textAlign,
  }) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 24, fontFamily: "Hind", color: color, fontWeight: weight),
      textAlign: textAlign,
    );
  }

  static Text myText3({
    required String text,
    FontWeight weight = FontWeight.normal,
    Color color = Colors.black,
  }) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 32, fontFamily: "Hind", color: color, fontWeight: weight),
    );
  }

  static Text myText4({
    required String text,
    FontWeight weight = FontWeight.normal,
    Color color = Colors.black,
  }) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 40, fontFamily: "Hind", color: color, fontWeight: weight),
    );
  }

  static Text myText5({
    required String text,
    FontWeight weight = FontWeight.normal,
    Color color = Colors.black,
  }) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 48, fontFamily: "Hind", color: color, fontWeight: weight),
    );
  }
}
