import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:roomies_beta/screens/landing_page/signin_screen.dart';

class CreateAccountScreen extends StatelessWidget {
  CreateAccountScreen({super.key});
  static const routeName = '/create_account';

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                      SizedBox(
                        // EMAIL FIELD
                        height: 50,
                        child: TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
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
                          ),
                          style: const TextStyle(fontSize: 15),
                          textAlignVertical: TextAlignVertical.center,
                        ),
                      ),
                      SizedBox(height: deviceSize.height * 0.02),
                      SizedBox(
                        // PASSWORD FIELD
                        height: 50,
                        child: TextField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
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
                          ),
                          style: const TextStyle(fontSize: 15),
                        ),
                      ),
                      SizedBox(height: deviceSize.height * 0.02),
                      SizedBox(
                        // CONFIRM PASSWORD FIELD
                        height: 50,
                        child: TextField(
                          controller: _confirmPasswordController,
                          obscureText: true,
                          decoration: InputDecoration(
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
                          ),
                          style: const TextStyle(fontSize: 15),
                        ),
                      ),
                      SizedBox(height: deviceSize.height * 0.05),
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
                        onPressed: () {},
                        child: const Text(
                          "Create Account",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      SizedBox(height: deviceSize.height * 0.20),
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
                              Navigator.of(context)
                                  .pushReplacementNamed(SigninScreen.routeName);
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
        ],
      ),
    );
  }
}
