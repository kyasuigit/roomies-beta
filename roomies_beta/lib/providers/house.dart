import '../providers/user.dart';
import 'package:flutter/foundation.dart';

class House with ChangeNotifier {
  late final String _houseId;
  String _houseName = '';
  final Map<String, User> _users = {};

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

  Map<String, User> get getUsers {
    return {..._users};
  }

  void addUser(String id, User newUser) {
    _users.putIfAbsent(id, () => newUser);
    notifyListeners();
  }
}
