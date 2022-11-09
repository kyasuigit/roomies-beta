import 'package:flutter/material.dart';
import './signin_screen.dart';

class AuthScreen extends StatelessWidget {
  static const routeName = '/auth';

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(249, 160, 63, 1),
                  Color.fromRGBO(247, 212, 136, 1),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  flex: 3,
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: deviceSize.width * 0.03),
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 8.0),
                    child: Image.asset(
                      'assets/images/Roomies_logo_transparent.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(
                            Size(deviceSize.width * 0.8, 50),
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
                          Navigator.of(context)
                              .pushNamed(SigninScreen.routeName);
                        },
                        child: const Text(
                          "Sign In",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      SizedBox(height: deviceSize.height * 0.02),
                      ElevatedButton(
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(
                              Size(deviceSize.width * 0.8, 50)),
                          shape: MaterialStateProperty.all(
                            const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(25),
                              ),
                            ),
                          ),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.black),
                          backgroundColor: MaterialStateProperty.all(
                            Colors.white,
                          ),
                          shadowColor: MaterialStateProperty.all(Colors.grey),
                          elevation: MaterialStateProperty.all(2),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Create Account",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          radius: 25,
                          backgroundColor: Color.fromRGBO(249, 160, 63, 1),
                        ),
                        SizedBox(width: deviceSize.width * 0.01),
                        const CircleAvatar(
                            radius: 25,
                            backgroundColor: Color.fromRGBO(249, 160, 63, 1)),
                        SizedBox(width: deviceSize.width * 0.01),
                        const CircleAvatar(
                            radius: 25,
                            backgroundColor: Color.fromRGBO(249, 160, 63, 1)),
                        SizedBox(width: deviceSize.width * 0.01),
                        const CircleAvatar(
                            radius: 25,
                            backgroundColor: Color.fromRGBO(249, 160, 63, 1)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
