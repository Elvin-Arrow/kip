import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';
import 'package:kip/utils/routes.dart';
import 'package:kip/utils/style_util.dart';

class FirstBoardingScreen extends StatelessWidget {
  const FirstBoardingScreen({Key? key}) : super(key: key);

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
        Text(
          'Welcome',
          style: TextStyle(
            color: MyStyle.primaryColor,
            fontSize: 32.0,
          ),
          textAlign: TextAlign.left,
        ),

        SizedBox(
          height: 12.0,
        ),
        Text(
          'At KIP, you are part of the quest we have ventured on to reshappe, redefine and rethink what is means to have knowledge and what ite means to learn',
          style: TextStyle(height: 1.6),
        ),

        Spacer(),
      ],
    );
  }
}
