import "package:flutter/material.dart";
import "package:flutter/foundation.dart";
import 'package:roomies_beta/providers/house.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AppUser with ChangeNotifier {
  String _email = '';
  String _userId = '';
  String _displayName = '';
  bool _isFirstTimeUser = false;
  String _currentHouse = 'placeholder';

  AppUser(email, userId, displayName, isFirstTimeUser, currentHouse) {
    _email = email;
    _userId = userId;
    _displayName = displayName;
    _isFirstTimeUser = isFirstTimeUser;
    _currentHouse = currentHouse;
  }

  String get getUsername {
    return _email;
  }

  void setEmail(String newEmail) {
    _email = newEmail;
  }

  String get getUserId {
    return _userId;
  }

  void setUserId(String id) {
    _userId = id;
    notifyListeners();
  }

  String get getDisplayName {
    return _displayName;
  }

  void setDisplayName(String newDisplayName) {
    _displayName = newDisplayName;
    notifyListeners();
  }

  bool get isFirstTimeUser {
    return _isFirstTimeUser;
  }

  void setIsFirstTimeUser(bool isFirstTimeUser) {
    _isFirstTimeUser = isFirstTimeUser;
    notifyListeners();
  }

  void fetchUserData() async {
    var docSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    Map<String, dynamic> userData = docSnapshot.data() as Map<String, dynamic>;

    _userId = FirebaseAuth.instance.currentUser!.uid;
    _email = userData['email'];
    _displayName = userData['displayName'];
    _isFirstTimeUser = userData['isFirstTimeUser'];
    _currentHouse = userData['currentHouse'];

    notifyListeners();
  }

  String get getCurrentHouse {
    return _currentHouse;
  }

  void setCurrentHouse(String currentHouse) {
    _currentHouse = currentHouse;
    FirebaseFirestore.instance
        .collection('users')
        .doc(_userId)
        .update({'currentHouse': _currentHouse});
    notifyListeners();
  }
}
