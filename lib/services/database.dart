import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:idntfy_app/models/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // user collection reference in Firestore
  final CollectionReference userCollection =
      Firestore.instance.collection('users');

  // method to create user data
  Future updateUserData(
      String name, String email, String address, String phoneNumber) async {
    return await userCollection.document(uid).setData({
      'name': name,
      'email': email,
      'address': address,
      'phoneNumber': phoneNumber,
      // 'creditCard': creditCard,
    });
  }

  // method to create provider data in user collection
  Future updateUserProviderData(
    String company,
    String domain,
    String datapoints,
  ) async {
    return await userCollection
        .document(uid)
        .collection('providers')
        .document(uid)
        .setData({
      'company': company,
      'domain': domain,
      'datapoints': datapoints,
    });
  }

  // method to map user document snapshot to customer user model
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid,
        name: snapshot.data['name'],
        address: snapshot.data['address'],
        email: snapshot.data['email'],
        phoneNumber: snapshot.data['phoneNumber']
        // creditCard: snapshot.data['creditCard'],
        );
  }

  // get user document stream
  Stream<UserData> get getUserDocuments {
    return userCollection.document(uid).snapshots().map(_userDataFromSnapshot);
  }

  // ProviderData _providerDataFromSnapshot(DocumentSnapshot snapshot) {
  //   return ProviderData(
  //       company: snapshot.data['company'],
  //       domain: snapshot.data['domain'],
  //       datapoints: snapshot.data['datapoints']);
  // }

  // get provider collection stream
  Stream get getProviderCollection {
    return userCollection.document(uid).collection('providers').snapshots();
  }
}
