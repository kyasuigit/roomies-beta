import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import './screens/introduction_screens/introduction_screen.dart';
import './screens/landing_page/auth_screen.dart';
import './screens/tabs_screen.dart';
import './providers/app_user.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser>(context);
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return user.isFirstTimeUser
              ? const IntroductionScreen()
              : const TabsScreen();
        } else {
          return AuthScreen();
        }
      },
    );
  }
}
