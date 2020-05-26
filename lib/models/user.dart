import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  final String uid;
  final String name;
  final String address;
  final String email;
  final String phoneNumber;
  final String providerAccessRef;
  // final String creditCard;

  UserData(
      {this.uid,
      this.name,
      this.address,
      this.email,
      this.phoneNumber,
      this.providerAccessRef
      // this.creditCard,
      });

  factory UserData.fromFirestore(DocumentSnapshot document) {
    Map userData = document.data;

    return UserData(
        uid: document.documentID,
        name: userData['name'],
        address: userData['address'],
        email: userData['email'],
        phoneNumber: userData['phoneNumber']);
  }

  Map<String, dynamic> toMap() {
    return {
      'Name': name,
      'Address': address,
      'Email Address': email,
      'Phone Number': phoneNumber,
      // 'Credit Card Details': creditCard,
    };
  }
}
