import 'package:flutter/material.dart';
import 'package:kip/services/auth_service.dart';
import 'package:kip/utils/cred_textform_field.dart';
import 'package:kip/utils/routes.dart';
import 'package:kip/utils/style_util.dart';
import 'package:kip/widgets/auth_button.dart';
import 'package:kip/widgets/top_of_appbar.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen();

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool? isRemember = false;
  String username = '';
  String password = '';

  bool _isInAsyncCall = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MyStyle.getWidth(context);
    double height = MyStyle.getHeight(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: MyStyle.bgColor,
      body: ModalProgressHUD(
        inAsyncCall: _isInAsyncCall,
        child: SingleChildScrollView(
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
                      SizedBox(
                        height: 20,
                      ),
                      Hero(
                        tag: 'logo',
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                              color: MyStyle.primaryColor.withOpacity(0.2),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  'https://images.unsplash.com/photo-1611162617474-5b21e879e113?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1267&q=80',
                                ),
                              ),
                              shape: BoxShape.circle),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      MyStyle.myText4(text: "Kip", color: MyStyle.primaryColor),
                      CredTextFormField(
                        icon: Icons.person,
                        onChanged: (value) {
                          this.username = value;
                          setState(() {});
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CredTextFormField(
                        icon: Icons.lock,
                        obscureText: true,
                        onChanged: (value) {
                          this.password = value;
                          setState(() {});
                        },
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: isRemember,
                            onChanged: (value) {
                              isRemember = value;
                              setState(() {});
                            },
                            activeColor: MyStyle.primaryColor,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          MyStyle.myText0(
                              text: "Remember Me", weight: FontWeight.w100)
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: width,
                        height: 45,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              MyStyle.primiaryColorLight,
                              MyStyle.primaryColor
                            ]),
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                        child: AuthButton(
                          buttonText: "LOGIN",
                          onTap: () async {
                            print('Email: $username\nPassword: $password');
                            try {
                              setState(() {
                                _isInAsyncCall = true;
                              });
                              await KipAuth().loginUserWithEmailAndPassword(
                                email: this.username,
                                password: this.password,
                              );

                              if (isRemember ?? false) {
                                await KipAuth().storeLoginInfo();
                              }

                              Navigator.pushReplacementNamed(
                                  context, kLandingScreenId);
                            } catch (e) {
                              // Login failure
                            }

                            setState(() {
                              _isInAsyncCall = false;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(),
                          ),
                          MyStyle.myText0(
                              text: "Forgot password?", weight: FontWeight.w200)
                        ],
                      ),
                      Expanded(
                        child: SizedBox(),
                      ),
                      MyStyle.myText0(
                          text: "Don't have an account? Sign Up",
                          weight: FontWeight.w200),
                      SizedBox(
                        height: 20,
                      ),
                      SignUpCardButton(
                        onTap: () {
                          Navigator.pushNamed(context, kSignUpScreenId);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignUpCardButton extends StatelessWidget {
  const SignUpCardButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        elevation: 2.0,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFECF5F5),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0),
              topRight: Radius.circular(25.0),
            ),
          ),
          width: MyStyle.getWidth(context) * 0.8,
          child: Column(
            children: [
              Icon(
                Icons.keyboard_arrow_up,
                size: 50,
                color: MyStyle.primaryColor,
              ),
              MyStyle.myText3(
                text: "SIGN UP",
                color: MyStyle.primaryColor,
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
