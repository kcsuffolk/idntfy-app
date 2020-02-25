import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String uid;
  final String name;
  final String address;
  final String email;
  final String phoneNumber;
  // final String creditCard;

  User({
    this.uid,
    this.name,
    this.address,
    this.email,
    this.phoneNumber,
    // this.creditCard,
  });

  factory User.fromFirestore(DocumentSnapshot document) {
    Map userData = document.data;

    return User(
        uid: document.documentID,
        name: userData['name'],
        address: userData['address'],
        email: userData['email'],
        phoneNumber: userData['phoneNumber']);
  }

  Map<String, dynamic> toMap() {
    return {
      'Address': address,
      'Email Address': email,
      'Phone Number': phoneNumber,
      // 'Credit Card Details': creditCard,
    };
  }
}
