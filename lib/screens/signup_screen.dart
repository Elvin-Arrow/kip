import 'package:flutter/material.dart';
import 'package:kip/services/auth_service.dart';
import 'package:kip/utils/cred_textform_field.dart';
import 'package:kip/utils/routes.dart';
import 'package:kip/utils/style_util.dart';
import 'package:kip/widgets/auth_button.dart';
import 'package:kip/widgets/sign_up_card.dart';
import 'package:kip/widgets/top_of_appbar.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isInAsyncCall = false;
  String fullName = '';
  String email = '';
  String password = '';
  String confirmPassword = '';

  @override
  Widget build(BuildContext context) {
    double width = MyStyle.getWidth(context);
    double height = MyStyle.getHeight(context);
    return Scaffold(
      body: SafeArea(
        child: ModalProgressHUD(
          inAsyncCall: _isInAsyncCall,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.chevron_left,
                      color: MyStyle.primaryColor,
                      size: 36.0,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: MyStyle.paddingHorizontal * 2),
                    child: Column(
                      children: [
                        TopOfAppBar(
                          width: width,
                        ),
                        Container(
                          width: width,
                          height: height,
                          child: Column(
                            children: [
                              Spacer(),
                              Hero(
                                tag: 'logo',
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                      color:
                                          MyStyle.primaryColor.withOpacity(0.2),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                          'https://images.unsplash.com/photo-1611162617474-5b21e879e113?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1267&q=80',
                                        ),
                                      ),
                                      shape: BoxShape.circle),
                                ),
                              ),
                              Spacer(),
                              MyStyle.myText4(
                                  text: "Kip", color: MyStyle.primaryColor),
                              Spacer(),
                              _signUpCard(width),
                              Spacer(),
                              Text(
                                'By creating an account you agree to our\n\nTerms of Service and Privacy Policy',
                                style: TextStyle(
                                  fontSize: 8.0,
                                  color: MyStyle.primaryColor,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// A convenience method to get sign up card widget.
  Widget _signUpCard(double width) => SignUpCard(
        child: Column(
          children: [
            MyStyle.myText1(
              text: 'Create an Account\n&\nGET STARTED',
              color: Colors.white,
              textAlign: TextAlign.center,
            ),
            CredTextFormField(
              textColour: MyStyle.white,
              icon: Icons.person,
              iconColour: Colors.white,
              borderSideColour: Colors.white,
              cursorColour: Colors.white,
              hintText: 'Full Name',
              focusColour: Colors.white,
              onChanged: (value) {
                this.fullName = value;
                setState(() {});
              },
            ),
            SizedBox(
              height: 10,
            ),
            CredTextFormField(
              textColour: MyStyle.white,
              icon: Icons.mail,
              iconColour: Colors.white,
              borderSideColour: Colors.white,
              cursorColour: Colors.white,
              hintText: 'Email',
              onChanged: (value) {
                this.email = value;
                setState(() {});
              },
            ),
            SizedBox(
              height: 10,
            ),
            CredTextFormField(
              textColour: MyStyle.white,
              icon: Icons.lock,
              iconColour: Colors.white,
              borderSideColour: Colors.white,
              cursorColour: Colors.white,
              hintText: 'Password',
              obscureText: true,
              onChanged: (value) {
                this.password = value;
                setState(() {});
              },
            ),
            SizedBox(
              height: 10,
            ),
            CredTextFormField(
              textColour: MyStyle.white,
              icon: Icons.lock,
              iconColour: Colors.white,
              borderSideColour: Colors.white,
              cursorColour: Colors.white,
              hintText: 'Confirm Password',
              obscureText: true,
              onChanged: (value) {
                this.confirmPassword = value;
                setState(() {});
              },
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: width,
              height: 45,
              decoration: BoxDecoration(
                  color: MyStyle.white,
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              child: AuthButton(
                buttonText: "SIGN UP",
                textColour: MyStyle.primaryColor,
                iconBackgroundColour: Color(0xFFFD7579),
                onTap: () async {
                  try {
                    setState(() {
                      _isInAsyncCall = true;
                    });
                    await KipAuth().registerUser(
                      email: this.email,
                      password: this.password,
                    );

                    Navigator.pushReplacementNamed(context, kLandingScreenId);
                  } catch (e) {
                    // Registration failure
                  }

                  setState(() {
                    _isInAsyncCall = false;
                  });
                },
              ),
            ),
          ],
        ),
      );
}
