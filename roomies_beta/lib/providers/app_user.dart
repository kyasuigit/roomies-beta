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
  Map<String, House> _houses = {};
  House _currentHouse = House();

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

  void fetchUserData(Map<String, dynamic> data) {
    _userId = FirebaseAuth.instance.currentUser!.uid;
    _email = data['email'];
    _displayName = data['displayName'];
    _isFirstTimeUser = data['isFirstTimeUser'];
    _houses = data['houses'];

    notifyListeners();
  }

  Map<String, House> get getListOfHouses {
    return {..._houses};
  }

  House get getCurrentHouse {
    return _currentHouse;
  }

  void setCurrentHouse(House currentHouse) {
    _currentHouse = currentHouse;
    FirebaseFirestore.instance
        .collection('users')
        .doc(_userId)
        .update({'currentHouse': currentHouse.getHouseId});
    notifyListeners();
  }

  void removeHouse(String houseId) {
    _houses.removeWhere((key, value) => (key == houseId));
    FirebaseFirestore.instance
        .collection('users')
        .doc(_userId)
        .update({'houses': _houses.keys.toList()});
    notifyListeners();
  }

  void addHouse(String houseId, House newHouse) {
    _houses.putIfAbsent(houseId, () => newHouse);

    FirebaseFirestore.instance
        .collection('users')
        .doc(_userId)
        .update({'houses': _houses.keys.toList()});
    notifyListeners();
  }
}
