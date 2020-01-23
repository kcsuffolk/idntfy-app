import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:idntfy_app/models/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // collection reference
  final CollectionReference userCollection =
      Firestore.instance.collection('users');

  Future updateUserData(String address, String phoneNumber) async {
    return await userCollection.document(uid).setData({
      'address': address,
      'phoneNumber': phoneNumber,
    });
  }

  Future updateUserProviderData(String provider, String datapoints) async {
    return await userCollection
        .document(uid)
        .collection('providers')
        .document()
        .setData({
      'name': provider,
      'datapoints': datapoints,
    });
  }

  // userData from Snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot.data['name'],
      address: snapshot.data['address'],
      email: snapshot.data['email'],
      phoneNumber: snapshot.data['phoneNumber'],
      creditCard: snapshot.data['creditCard'],
    );
  }

  // get user stream
  Stream<UserData> get userData {
    return userCollection.document(uid).snapshots().map(_userDataFromSnapshot);
  }

  // get providers stream
}
