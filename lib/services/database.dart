import 'package:cloud_firestore/cloud_firestore.dart';

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
}
