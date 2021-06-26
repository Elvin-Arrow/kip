import 'package:flutter/material.dart';
import 'package:kip/utils/style_util.dart';

class ThirdBoardingScreen extends StatelessWidget {
  const ThirdBoardingScreen({Key? key}) : super(key: key);

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
                style: TextStyle(color: Colors.redAccent),
              ),
            ],
          ),
        ),

        SizedBox(
          height: 12.0,
        ),
        Text(
          'The KIP Founding team is proud to have you onboard this unceasing and unrelenting vision of redefining the dynamics of learning. We have begin a long journey wit a yet bigger destination in mind and all of it is impossible without You: the ones who believe despite the grim sense that all hope is lost!',
          style: TextStyle(height: 1.6),
        ),

        Spacer(),
      ],
    );
  }
}
