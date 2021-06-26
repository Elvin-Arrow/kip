import 'package:connectivity/connectivity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A simple convenience class to handle authentication logic
class KipAuth {
  final _auth = FirebaseAuth.instance;

  Future<void> loginUserWithEmailAndPassword(
      {required String email, required String password}) async {
    await checkInternConnection();

    print('Email: $email\nPassword: $password');
    // Use the email and password to sign-in the user
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print(e);
      throw 'Invalid username or password';
    }
  }

  Future<void> registerUser(
      {required String email, required String password}) async {
    await checkInternConnection();
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      print(e);
      throw 'User already exists';
    }
  }

  Future<void> storeLoginInfo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setBool('isAuthenticated', true);
  }

  Future<void> checkInternConnection() async {
    final ConnectivityResult connectivityStatus =
        await (Connectivity().checkConnectivity());

    if (connectivityStatus == ConnectivityResult.none)
      throw 'No internet connection';
  }

  Future<bool> isAuthenticated() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getBool('isAuthenticated') ?? false;
  }
}
