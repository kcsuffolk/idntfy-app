import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:idntfy_app/models/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // collection reference in Firestore
  final CollectionReference userCollection =
      Firestore.instance.collection('users');

  // method to create user data
  Future updateUserData(String name, String email, String address,
      String phoneNumber, String creditCard) async {
    return await userCollection.document(uid).setData({
      'name': name,
      'email': email,
      'address': address,
      'phoneNumber': phoneNumber,
      'creditCard': creditCard,
    });
  }

  // method to create provder data in user collection
  Future updateUserProviderData(
      String company, String datapoints, String domain) async {
    return await userCollection
        .document(uid)
        .collection('providers')
        .document()
        .setData({
      'name': company,
      'datapoints': datapoints,
      'domain': domain,
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
