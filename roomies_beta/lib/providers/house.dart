import './app_user.dart';

class House {
  String _houseId = '';
  String _houseName = '';
  List<String> _users = [];

  House(String houseId, String houseName, List<String> users) {
    _houseId = houseId;
    _houseName = houseName;
    _users = users;
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
}
