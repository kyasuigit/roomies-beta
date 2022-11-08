import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

enum AuthMode { Signup, Login }

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
                  Color.fromRGBO(255, 95, 109, 1),
                  Color.fromRGBO(255, 195, 113, 1),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          SizedBox(
            height: deviceSize.height,
            width: deviceSize.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  child: Container(
                    margin: EdgeInsets.only(
                      right: deviceSize.width * 0.05,
                      left: deviceSize.width * 0.05,
                    ),
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
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(
                              Size(deviceSize.width * 0.7, 50)),
                          shape: MaterialStateProperty.all(
                            const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(40),
                              ),
                            ),
                          ),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.black),
                          backgroundColor: MaterialStateProperty.all(
                            const Color.fromRGBO(133, 235, 255, 1),
                          ),
                          shadowColor: MaterialStateProperty.all(Colors.grey),
                          elevation: MaterialStateProperty.all(5),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Sign In",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      SizedBox(height: deviceSize.height * 0.03),
                      ElevatedButton(
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(
                              Size(deviceSize.width * 0.7, 50)),
                          shape: MaterialStateProperty.all(
                            const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(40),
                              ),
                            ),
                          ),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.black),
                          backgroundColor: MaterialStateProperty.all(
                            Colors.white,
                          ),
                          shadowColor: MaterialStateProperty.all(Colors.grey),
                          elevation: MaterialStateProperty.all(5),
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
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      CircleAvatar(radius: 30),
                      CircleAvatar(radius: 30),
                      CircleAvatar(radius: 30),
                      CircleAvatar(radius: 30),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
