import 'package:cloud_firestore/cloud_firestore.dart';

class ProviderData {
  final String providerID;
  final String company;
  final String domain;
  final String logo;

  ProviderData({this.providerID, this.company, this.domain, this.logo});

  factory ProviderData.fromFirestore(DocumentSnapshot document) {
    Map providerData = document.data;

    return ProviderData(
      company: providerData['company'],
      domain: providerData['domain'],
    );
  }
}
