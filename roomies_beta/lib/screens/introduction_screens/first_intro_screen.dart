import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FirstIntroScreen extends StatelessWidget {
  const FirstIntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Color.fromRGBO(247, 212, 136, 1),
          ),
        ),
        Align(
          alignment: const Alignment(0, -0.55),
          child: Container(
            height: deviceSize.height * 0.38,
            alignment: const Alignment(0, -0.6),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromARGB(255, 226, 184, 94),
            ),
          ),
        ),
        Container(
          alignment: const Alignment(0, -0.55),
          child: SvgPicture.asset(
            'assets/images/intro_screen1.svg',
            semanticsLabel: 'Friends having coffee',
            height: deviceSize.height * 0.3,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            height: deviceSize.height * 0.4,
            width: deviceSize.width * 0.8,
            child: Column(
              children: [
                const Text(
                  'Create Houses',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 42,
                    fontFamily: 'Gotham',
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: deviceSize.height * 0.06,
                ),
                const Text(
                  'Get your roommates together for private, customizable spaces for your house.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Gotham',
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
