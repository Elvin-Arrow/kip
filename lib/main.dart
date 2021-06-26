import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kip/screens/loading_screen.dart';
import 'package:kip/screens/on-boarding/first_screen.dart';
import 'package:kip/screens/on-boarding/on_boarding_screen.dart';
import 'package:kip/screens/on-boarding/second_screen.dart';
import 'package:kip/screens/on-boarding/third-screen.dart';
import 'package:kip/services/auth_service.dart';
import 'package:kip/utils/routes.dart';
import 'package:kip/screens/landing_screen.dart';
import 'package:kip/screens/login_screen.dart';
import 'package:kip/screens/signup_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: kLoadingScreenId,
      routes: {
        kOnBoardingScreenId: (_) => OnBoardingScreen(),
        kLoadingScreenId: (_) => LoadingScreen(),
        kLoginScreenId: (_) => LoginScreen(),
        kSignUpScreenId: (_) => SignUpScreen(),
        kLandingScreenId: (_) => LandingScreen(),
      },
    );
  }
}
