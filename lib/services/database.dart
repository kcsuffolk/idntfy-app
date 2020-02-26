import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:idntfy_app/models/provider.dart';
import 'package:idntfy_app/models/user.dart';

class DatabaseService {
  final String uid;
  final String providerID;
  final String providerAccessRef;

  DatabaseService({this.uid, this.providerID, this.providerAccessRef});

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
      String company, String domain, String datapoints) async {
    return await userCollection.document(uid).collection('providers').add({
      'company': company,
      'domain': domain,
      'datapoints': datapoints,
    });
  }

  // method to create provider data access in provider collection
  Future updateUserProviderAccess(String docID, String name, String email,
      String address, String phoneNumber) async {
    return await userCollection
        .document(uid)
        .collection('providers')
        .document(docID)
        .collection('providerAccess')
        .add({
      'name': name,
      'email': email,
      'address': address,
      'phoneNumber': phoneNumber,
    });
  }

  // get user document and map to custom user model
  Stream<UserData> get getUserDocuments {
    return userCollection
        .document(uid)
        .snapshots()
        .map((doc) => UserData.fromFirestore(doc));
  }

  // get provider collection
  Stream<List<ProviderData>> get getProviderCollection {
    return userCollection
        .document(uid)
        .collection('providers')
        .snapshots()
        .map(_providerListFromSnapshot);
  }

  // method to map provider collection to provider data model
  List<ProviderData> _providerListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return ProviderData(
        providerID: doc.documentID,
        company: doc.data['company'] ?? '',
        domain: doc.data['domain'] ?? '',
        logo: doc.data['logo'] ?? '',
        datapoints: doc.data['datapoints'] ?? '',
      );
    }).toList();
  }

  // get provider access collection
  Stream<QuerySnapshot> get getProviderAccessCollection {
    return userCollection
        .document(uid)
        .collection('providers')
        .document(providerID)
        .collection('providerAccess')
        .snapshots();
  }
}
