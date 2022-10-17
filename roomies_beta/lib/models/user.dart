import "package:flutter/material.dart";
import "./house.dart";

class User {
  late String _userName;
  late String _userId;
  late String _displayName;

  User({
    required username,
    required userId,
    required displayName,
  }) {
    _userName = username;
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
  }
}
