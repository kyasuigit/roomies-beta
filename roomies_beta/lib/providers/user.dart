import "package:flutter/material.dart";
import "package:flutter/foundation.dart";

class User with ChangeNotifier {
  String _userName = '';
  String _userId = '';
  String _displayName = '';

  User(userName, userId, displayName) {
    _userName = userName;
    _userId = userId;
    _displayName = displayName;
  }

  String get getUsername {
    return _userName;
  }

  void setUsername(String newUsername) {
    _userName = newUsername;
  }

  String get getUserId {
    return _userId;
  }

  String get getDisplayName {
    return _displayName;
  }

  void setDisplayName(String newDisplayName) {
    _displayName = newDisplayName;
    notifyListeners();
  }
}
