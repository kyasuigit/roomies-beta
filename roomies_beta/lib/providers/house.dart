import 'app_user.dart';
import 'package:flutter/foundation.dart';

class House with ChangeNotifier {
  String _houseId = '';
  String _houseName = '';
  final Map<String, AppUser> _users = {};

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

  Map<String, AppUser> get getUsers {
    return {..._users};
  }

  void addUser(String id, AppUser newUser) {
    _users.putIfAbsent(id, () => newUser);
    notifyListeners();
  }
}
