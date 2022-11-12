import "package:flutter/material.dart";
import "package:flutter/foundation.dart";

class AppUser with ChangeNotifier {
  String _email = '';
  String _userId = '';
  String _displayName = '';
  bool _isFirstTimeUser = true;

  AppUser(email, userId, displayName) {
    _email = email;
    _userId = userId;
    _displayName = displayName;
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
  }
}
