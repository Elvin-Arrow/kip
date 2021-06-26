import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';
import 'package:kip/screens/on-boarding/first_screen.dart';
import 'package:kip/screens/on-boarding/second_screen.dart';
import 'package:kip/screens/on-boarding/third-screen.dart';
import 'package:kip/services/prefs_service.dart';
import 'package:kip/utils/routes.dart';
import 'package:kip/utils/style_util.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int activeStep = 0;
  int dotCount = 3;

  getContent() {
    switch (activeStep) {
      case 1:
        return SecondBoardingScreen();

      case 2:
        return ThirdBoardingScreen();

      default:
        return FirstBoardingScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 12.0,
            horizontal: 24.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: getContent(),
              ),
              Center(
                child: DotStepper(
                  activeStep: activeStep,
                  dotCount: 3,
                  dotRadius: 6.0,
                  spacing: 10,
                  indicatorDecoration: IndicatorDecoration(
                    color: MyStyle.primaryColor,
                    strokeColor: Colors.transparent,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      PrefService().firstTimeLaunchComplete();
                      Navigator.pushReplacementNamed(context, kLoginScreenId);
                    },
                    child: Text(
                      'SKIP',
                      style: TextStyle(color: Colors.redAccent),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (activeStep < 2)
                        activeStep++;
                      else {
                        PrefService().firstTimeLaunchComplete();
                        Navigator.pushReplacementNamed(context, kLoginScreenId);
                      }

                      setState(() {});
                    },
                    child: Text('NEXT'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        MyStyle.primaryColor,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
