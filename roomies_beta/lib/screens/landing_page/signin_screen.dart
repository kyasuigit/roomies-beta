import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../transitions/sliding_page_route.dart';
import './create_account_screen.dart';
import './forgot_password_page.dart';
import '../../providers/app_user.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});
  static const routeName = '/login_screen';

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final formKey = GlobalKey<FormState>();

  bool inputError = false;

  String _email = '';
  String _password = '';

  Future signIn(BuildContext context) async {
    try {
      formKey.currentState!.save();

      showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: Lottie.network(
              'https://assets8.lottiefiles.com/packages/lf20_cl6skp0o.json',
            ),
          );
        },
      );

      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _email.trim(),
        password: _password.trim(),
      );

      if (!mounted) return;

      updateUserData();

      Navigator.of(context).pop();
      Navigator.of(context).pop();
    } on FirebaseAuthException catch (error) {
      Navigator.of(context).pop();
      var errorMsg = '';
      switch (error.code) {
        case ('wrong-password'):
          errorMsg = 'That\'s not the right password!';
          break;
        case ('invalid-email'):
          errorMsg = 'Something is not right \nwith that email!';
          break;
        case ('user-disabled'):
          errorMsg = 'That user is disabled!';
          break;
        case ('user-not-found'):
          errorMsg = 'That user was not found!';
          break;
      }
      showErrorBox(context, errorMsg);
    }
  }

  void updateUserData() async {
    final user = Provider.of<AppUser>(context, listen: false);
    var docSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    Map<String, dynamic> userData = docSnapshot.data() as Map<String, dynamic>;

    user.setDisplayName(userData['displayName']);
    user.setEmail(userData['email']);
    user.setIsFirstTimeUser(userData['isFirstTimeUser']);
    user.setUserId(FirebaseAuth.instance.currentUser!.uid);
  }

  void showErrorBox(BuildContext ctx, String errorMsg) {
    showDialog(
      context: (ctx),
      builder: (ctx) {
        return AlertDialog(
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.of(ctx).pop();
              },
              child: const Padding(
                padding: EdgeInsets.only(bottom: 8.0, right: 8.0),
                child: Text(
                  "Try again!",
                  style: TextStyle(
                    color: Color.fromRGBO(222, 110, 75, 0.7),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.network(
                'https://assets9.lottiefiles.com/packages/lf20_gu5zubdo.json',
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  errorMsg,
                  style: const TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final passwordFocus = FocusNode();
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(249, 160, 63, 1),
                  Color.fromRGBO(247, 212, 136, 1),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: SafeArea(
              child: SizedBox(
                height: deviceSize.height * 0.17,
                width: deviceSize.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: deviceSize.width * 0.055,
                          bottom: deviceSize.height * 0.04),
                      child: const Text(
                        "Sign in",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: deviceSize.width * 0.03),
                      child: Lottie.network(
                        'https://assets4.lottiefiles.com/packages/lf20_AdPoAxJwgA.json',
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: deviceSize.height * 0.72,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 8,
                    blurRadius: 20,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SafeArea(
              child: SizedBox(
                height: deviceSize.height * 0.72,
                width: deviceSize.width * 0.9,
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    autovalidateMode: inputError
                        ? AutovalidateMode.onUserInteraction
                        : AutovalidateMode.disabled,
                    child: Column(
                      children: [
                        SizedBox(height: deviceSize.height * 0.03),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                "Login to continue!",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Colors.grey.shade400,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: deviceSize.height * 0.04),

                        // EMAIL FIELD
                        TextFormField(
                          onSaved: (value) => _email = value as String,
                          validator: (value) {
                            RegExp emailCheck =
                                RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                            if (emailCheck.hasMatch(value as String)) {
                              return null;
                            } else {
                              return 'Enter a valid email';
                            }
                          },
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 16.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide.none,
                            ),
                            labelText: 'Email',
                            labelStyle: const TextStyle(
                              fontSize: 15,
                              color: Color.fromRGBO(206, 209, 216, 1),
                            ),
                            filled: true,
                            fillColor: const Color.fromRGBO(237, 240, 247, 0.7),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: const BorderSide(
                                color: Color.fromRGBO(249, 160, 63, 1),
                                width: 1.5,
                              ),
                            ),
                            floatingLabelStyle: const TextStyle(
                              color: Color.fromRGBO(249, 160, 63, 1),
                              fontSize: 20,
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(
                                color: Colors.red.shade900,
                                width: 2,
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(
                                color: Colors.red.shade900,
                                width: 2,
                              ),
                            ),
                          ),
                          style: const TextStyle(fontSize: 15),
                          textAlignVertical: TextAlignVertical.center,
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (_) {
                            FocusScope.of(context).requestFocus(passwordFocus);
                          },
                        ),
                        SizedBox(height: deviceSize.height * 0.02),
                        //PASSWORD FIELD
                        TextFormField(
                          onSaved: (value) => _password = value as String,
                          validator: (value) {
                            if (value!.length < 4) {
                              return 'Enter a valid password';
                            } else {
                              return null;
                            }
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 16.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide.none,
                            ),
                            labelText: 'Password',
                            labelStyle: const TextStyle(
                              fontSize: 15,
                              color: Color.fromRGBO(206, 209, 216, 1),
                            ),
                            filled: true,
                            fillColor: const Color.fromRGBO(237, 240, 247, 0.7),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: const BorderSide(
                                color: Color.fromRGBO(249, 160, 63, 1),
                                width: 1.5,
                              ),
                            ),
                            floatingLabelStyle: const TextStyle(
                              color: Color.fromRGBO(249, 160, 63, 1),
                              fontSize: 20,
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(
                                color: Colors.red.shade900,
                                width: 2,
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(
                                color: Colors.red.shade900,
                                width: 2,
                              ),
                            ),
                          ),
                          style: const TextStyle(fontSize: 15),
                          focusNode: passwordFocus,
                          onFieldSubmitted: (_) {
                            if (!formKey.currentState!.validate()) {
                              inputError = true;
                              return;
                            } else {
                              signIn(context);
                            }
                          },
                        ),
                        SizedBox(height: deviceSize.height * 0.02),
                        ElevatedButton(
                          style: ButtonStyle(
                            minimumSize: MaterialStateProperty.all(
                              Size(deviceSize.width * 0.9, 50),
                            ),
                            shape: MaterialStateProperty.all(
                              const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(25),
                                ),
                              ),
                            ),
                            foregroundColor:
                                MaterialStateProperty.all(Colors.white),
                            backgroundColor: MaterialStateProperty.all(
                              const Color.fromRGBO(222, 110, 75, 0.8),
                            ),
                            shadowColor: MaterialStateProperty.all(Colors.grey),
                            elevation: MaterialStateProperty.all(2),
                          ),
                          onPressed: () async {
                            if (!formKey.currentState!.validate()) {
                              inputError = true;
                              return;
                            } else {
                              signIn(context);
                            }
                          },
                          child: const Text(
                            "Sign In",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        SizedBox(height: deviceSize.height * 0.03),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(SlidingPageRoute(
                                child: const ForgotPasswordPage(),
                                route: ForgotPasswordPage.routeName));
                          },
                          child: const Text(
                            "Forgot password?",
                            style: TextStyle(
                              color: Color.fromRGBO(222, 110, 75, 0.7),
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: deviceSize.height * 0.23),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have an account?',
                              style: TextStyle(
                                color: Colors.grey.shade400,
                              ),
                            ),
                            SizedBox(width: deviceSize.width * 0.015),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushReplacement(
                                    SlidingPageRoute(
                                        child: const CreateAccountScreen(),
                                        route: CreateAccountScreen.routeName));
                              },
                              child: const Text(
                                'Sign up!',
                                style: TextStyle(
                                  color: Color.fromRGBO(222, 110, 75, 0.8),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
