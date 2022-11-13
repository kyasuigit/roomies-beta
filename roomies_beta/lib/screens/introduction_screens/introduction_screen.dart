import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:provider/provider.dart';

import './first_intro_screen.dart';
import './second_intro_screen.dart';
import './third_intro_screen.dart';
import '../tabs_screen.dart';
import '../../transitions/sliding_page_route.dart';
import '../../providers/app_user.dart';

class IntroductionScreen extends StatefulWidget {
  static const routeName = '/introduction_screen';
  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  final PageController _controller = PageController();
  bool isLastPage = false;

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

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser>(context);
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: (index) {
              setState(() {
                isLastPage = (index == 2);
              });
            },
            controller: _controller,
            children: const [
              FirstIntroScreen(),
              SecondIntroScreen(),
              ThirdIntroScreen(),
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.85),
            child: SmoothPageIndicator(
              effect: const ExpandingDotsEffect(
                activeDotColor: Color.fromRGBO(222, 110, 75, 0.8),
                dotColor: Color.fromRGBO(249, 160, 63, 1),
              ),
              controller: _controller,
              count: 3,
            ),
          ),
          Container(
            alignment: const Alignment(0.8, 0.92),
            child: GestureDetector(
              onTap: () {
                if (isLastPage) {
                  user.setIsFirstTimeUser(false);
                  FirebaseFirestore.instance
                      .collection('users')
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .update({'isFirstTimeUser': false});

                  updateUserData();
                } else {
                  _controller.nextPage(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeIn);
                }
              },
              child: isLastPage
                  ? const Text(
                      'done',
                      style: TextStyle(
                        color: Color.fromRGBO(222, 110, 75, 0.8),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : const Text(
                      'next',
                      style: TextStyle(
                        color: Color.fromRGBO(249, 160, 63, 1),
                        fontSize: 16,
                      ),
                    ),
            ),
          )
        ],
      ),
    );
  }
}
