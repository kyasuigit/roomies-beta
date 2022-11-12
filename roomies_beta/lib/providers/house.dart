import 'app_user.dart';
import 'package:flutter/foundation.dart';

class House with ChangeNotifier {
  late final String _houseId;
  String _houseName = '';
  final Map<String, AppUser> _users = {};

  House(houseId, houseName) {
    _houseId = houseId;
    _houseName = houseName;
  }

  String get getHouseId {
    return _houseId;
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
