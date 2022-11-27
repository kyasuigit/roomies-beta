import 'package:cloud_firestore/cloud_firestore.dart';

import '../providers/app_user.dart';
import '../providers/house.dart';

class Database {
  static Stream<House> getHouseData(String houseId) {
    if (houseId.isEmpty) {
      houseId = "placeholder";
    }

    return FirebaseFirestore.instance
        .collection('houses')
        .doc(houseId)
        .snapshots()
        .map(
          (DocumentSnapshot documentSnapshot) => House(
            documentSnapshot.id,
            documentSnapshot.get('houseName'),
            documentSnapshot.get('users').map(
                  (String userId) => FirebaseFirestore.instance
                      .collection('users')
                      .doc(userId)
                      .snapshots()
                      .map(
                    (DocumentSnapshot userSnapshot) {
                      AppUser(
                        userSnapshot.get('email'),
                        userId,
                        userSnapshot.get('displayName'),
                        userSnapshot.get('isFirstTimeUser'),
                        userSnapshot.get('currentHouse'),
                      );
                    },
                  ).toList(),
                ),
          ),
        );
  }
}
