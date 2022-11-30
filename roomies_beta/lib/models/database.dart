import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';

import '../providers/house.dart';
import '../providers/app_user.dart';

class Database {
  Stream<House> getHouseData(String houseId) {
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
            List<String>.from(
              documentSnapshot.get('users'),
            ),
          ),
        );
  }

  Stream<List<AppUser>> getUserListData(List<String> userIds) {
    if (userIds.isEmpty) {
      userIds = ["placeholder"];
    }

    return FirebaseFirestore.instance
        .collection('users')
        .snapshots()
        .map((QuerySnapshot querySnapshot) {
      return querySnapshot.docs
          .map(
            (DocumentSnapshot documentSnapshot) {
              if (userIds.contains(documentSnapshot.id)) {
                return AppUser(
                  documentSnapshot.get('email'),
                  documentSnapshot.id,
                  documentSnapshot['displayName'],
                  documentSnapshot['isFirstTimeUser'],
                  documentSnapshot['currentHouse'],
                );
              } else {}
            },
          )
          .whereNotNull()
          .toList();
    });
  }

  Iterable<Iterable> removeNullItems(
      Iterable<Iterable<AppUser?>?> nullableItemList) {
    return nullableItemList
        .whereType<Iterable>()
        .map((e) => e.whereType<AppUser>());
  }
}
