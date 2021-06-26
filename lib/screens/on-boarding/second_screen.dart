import 'package:flutter/material.dart';
import 'package:kip/utils/style_util.dart';

class SecondBoardingScreen extends StatelessWidget {
  const SecondBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Image
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.cyan,
          ),
        ),
        SizedBox(
          height: 12.0,
        ),
        RichText(
          text: TextSpan(
            text: 'About ',
            style: TextStyle(
              fontSize: 32.0,
              color: Colors.black,
            ),
            children: <InlineSpan>[
              TextSpan(
                text: 'KIP',
                style: TextStyle(color: MyStyle.primaryColor),
              ),
            ],
          ),
        ),

        SizedBox(
          height: 12.0,
        ),
        Text(
          'We believe a changed world demands a changed education system; a way of learning taht utilizes the digital tools of today to emulate the values of the ancient while equipping you with the skills of tomorrow!',
          style: TextStyle(height: 1.6),
        ),

        Spacer(),
      ],
    );
  }
}
