import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

import '../../transitions/sliding_page_route.dart';
import './signin_screen.dart';
import '../../providers/app_user.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});
  static const routeName = '/create_account';

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  bool inputError = false;
  final formKey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';

  Future signUp(BuildContext context) async {
    try {
      formKey.currentState!.save();

      showDialog(
        context: context,
        builder: (context) {
          return const Center(child: CircularProgressIndicator());
        },
      );

      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: _email, password: _password);

      FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set(
        {
          'email': FirebaseAuth.instance.currentUser!.email,
          'isFirstTimeUser': true,
        },
      );

      if (!mounted) return;

      final user = Provider.of<AppUser>(context, listen: false);
      user.setUserId(FirebaseAuth.instance.currentUser!.uid);

      Navigator.of(context).pop();
      Navigator.of(context).pop();
    } on FirebaseAuthException catch (error) {
      Navigator.of(context).pop();
      var errorMsg = '';
      switch (error.code) {
        case ('email-already-in-use'):
          errorMsg = 'That email is already in use!';
          break;
        case ('invalid-email'):
          errorMsg = 'Something is not right \nwith that email!';
          break;
        case ('operation-not-allowed'):
          errorMsg = 'That is not allowed!';
          break;
        case ('weak-password'):
          errorMsg = 'The password needs to be stronger!';
          break;
        default:
          errorMsg = 'Something went wrong!';
      }
      showErrorBox(context, errorMsg);
    }
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
    final confirmPasswordFocus = FocusNode();
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
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
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
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: deviceSize.width * 0.03),
                      child: Lottie.network(
                        'https://assets5.lottiefiles.com/packages/lf20_R7qGYA.json',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: deviceSize.width * 0.055,
                          bottom: deviceSize.height * 0.04),
                      child: const Text(
                        'Create \nAccount',
                        style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ),
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
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Text(
                                "Sign up to begin!",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.grey.shade400,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: deviceSize.height * 0.03),

                        // EMAIL FIELD
                        TextFormField(
                          onSaved: (value) => _email = value as String,
                          validator: (value) {
                            RegExp emailCheck =
                                RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                            if (!emailCheck.hasMatch(value as String)) {
                              return 'Enter a valid email';
                            } else {
                              return null;
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

                        // PASSWORD FIELD
                        TextFormField(
                          onSaved: (value) => _password = value as String,
                          validator: (value) {
                            RegExp validPass = RegExp(
                                r'(?=.*[0-9]+)(?=.*[a-z]+)(?=.*[A-Z]+).{6,}');
                            if (!validPass.hasMatch(value as String)) {
                              return 'Weak password!';
                            } else {
                              return null;
                            }
                          },
                          focusNode: passwordFocus,
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
                          textAlignVertical: TextAlignVertical.center,
                          textInputAction: TextInputAction.next,
                          onChanged: (value) => _password = value,
                          onFieldSubmitted: (_) {
                            FocusScope.of(context)
                                .requestFocus(confirmPasswordFocus);
                          },
                        ),

                        SizedBox(height: deviceSize.height * 0.02),

                        // CONFIRM PASSWORD FIELD
                        TextFormField(
                          validator: (value) {
                            if (value != _password) {
                              return 'That password does not match!';
                            } else {
                              return null;
                            }
                          },
                          focusNode: confirmPasswordFocus,
                          obscureText: true,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 16.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide.none,
                            ),
                            labelText: 'Confirm Password',
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
                          onFieldSubmitted: (_) {
                            if (!formKey.currentState!.validate()) {
                              inputError = true;
                              return;
                            } else {
                              signUp(context);
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
                          onPressed: () {
                            if (!formKey.currentState!.validate()) {
                              inputError = true;
                              return;
                            } else {
                              signUp(context);
                            }
                          },
                          child: const Text(
                            "Create Account",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        SizedBox(height: deviceSize.height * 0.22),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have an account?',
                              style: TextStyle(
                                color: Colors.grey.shade400,
                              ),
                            ),
                            SizedBox(width: deviceSize.width * 0.02),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushReplacement(
                                    SlidingPageRoute(
                                        child: const SigninScreen(),
                                        route: SigninScreen.routeName));
                              },
                              child: const Text(
                                'Sign in!',
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
