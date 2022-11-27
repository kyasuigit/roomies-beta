import './app_user.dart';

class House {
  String _houseId = '';
  String _houseName = '';
  List<AppUser> _users = [];

  House(String houseId, String houseName, List<AppUser> users) {
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

  List<AppUser> get getUsers {
    return [..._users];
  }

  void addUser(AppUser newUser) {
    _users.add(newUser);
  }
}
