import 'package:shared_preferences/shared_preferences.dart';

class PrefService {
  Future<void> storeLoginInfo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setBool('isAuthenticated', true);
  }

  Future<bool> get isAuthenticated async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getBool('isAuthenticated') ?? false;
  }

  Future<void> firstTimeLaunchComplete() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('firstTimeLaunch', false);
  }

  Future<bool> get isFirstLaunch async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('firstTimeLaunch') ?? true;
  }
}
