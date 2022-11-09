import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});
  static const routeName = '/login_screen';

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
                  child: Column(
                    children: [
                      SizedBox(height: deviceSize.height * 0.08),
                      SizedBox(
                        // EMAIL FIELD
                        height: 50,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide.none,
                            ),
                            labelText: 'Email',
                            labelStyle: const TextStyle(
                              fontSize: 14,
                              color: Color.fromRGBO(206, 209, 216, 1),
                            ),
                            filled: true,
                            fillColor: const Color.fromRGBO(237, 240, 247, 0.7),
                          ),
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                      SizedBox(height: deviceSize.height * 0.02),
                      SizedBox(
                        // PASSWORD FIELD
                        height: 50,
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide.none,
                            ),
                            labelText: 'Password',
                            labelStyle: const TextStyle(
                              fontSize: 14,
                              color: Color.fromRGBO(206, 209, 216, 1),
                            ),
                            filled: true,
                            fillColor: const Color.fromRGBO(237, 240, 247, 0.7),
                          ),
                          style: const TextStyle(fontSize: 14),
                        ),
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
                        onPressed: () {},
                        child: const Text(
                          "Sign In",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      SizedBox(height: deviceSize.height * 0.03),
                      GestureDetector(
                        onTap: () {},
                        child: const Text(
                          "Forgot password?",
                          style: TextStyle(
                            color: Color.fromRGBO(222, 110, 75, 0.8),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: deviceSize.height * 0.27),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account?',
                            style: TextStyle(
                              color: Colors.grey.shade400,
                            ),
                          ),
                          SizedBox(width: deviceSize.width * 0.02),
                          GestureDetector(
                            onTap: () {},
                            child: const Text(
                              'Sign up',
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
