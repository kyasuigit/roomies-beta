import 'package:flutter/material.dart';

final List<Color> _colors = [
  Colors.red.shade400,
  Colors.purple.shade400,
  Colors.lightBlue.shade400,
  Colors.yellow.shade400,
  Colors.lightGreen.shade400,
];

class House {
  String _houseId = '';
  String _houseName = '';
  List<String> _users = [];
  Map<String, Color> _colorCodes = {};

  House(String houseId, String houseName, List<String> users) {
    _houseId = houseId;
    _houseName = houseName;
    _users = users;
    for (int i = 0; i < _users.length; i++) {
      _colorCodes[_users[i]] = _colors[i];
    }
  }

  String get getHouseId {
    return _houseId;
  }

  void setHouseId(String id) {
    _houseId = id;
  }

  String get getHouseName {
    return _houseName;
  }

  void setHouseName(String newHouseName) {
    _houseName = newHouseName;
  }

  List<String> get getUsersIds {
    return [..._users];
  }

  void addUser(String newUser) {
    _users.add(newUser);
  }

  Color? getColor(String userId) {
    return _colorCodes[userId];
  }
}
