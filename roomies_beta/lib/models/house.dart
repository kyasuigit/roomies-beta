import 'package:roomies_beta/models/user.dart';

class House {
  late String _houseId;
  late String _houseName;
  late List<User> _users;

  House({required houseId, required houseName, required users}) {
    _houseId = houseId;
    _houseName = houseName;
    _users = users;
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

  List<User> get getUsers {
    return _users;
  }

  void setUsers(List<User> newUserList) {
    _users = newUserList;
  }

  void addUser(User newUser) {
    _users.add(newUser);
  }
}
