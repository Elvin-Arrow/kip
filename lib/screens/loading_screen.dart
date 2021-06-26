import 'package:flutter/material.dart';
import 'package:kip/services/auth_service.dart';
import 'package:kip/services/prefs_service.dart';
import 'package:kip/utils/routes.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    _decideRoute();
  }

  _decideRoute() async {
    final isFirstLaunch = await PrefService().isFirstLaunch;

    if (isFirstLaunch) {
      Navigator.pushReplacementNamed(context, kOnBoardingScreenId);
    } else {
      final isAuthenticated = await PrefService().isAuthenticated;
      if (isAuthenticated) {
        Navigator.pushReplacementNamed(context, kLandingScreenId);
      } else {
        Navigator.pushReplacementNamed(context, kLoginScreenId);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
