import 'package:cloud_firestore/cloud_firestore.dart';

class ProviderData {
  final String providerID;
  final String company;
  final String domain;
  final String datapoints;

  ProviderData({this.providerID, this.company, this.domain, this.datapoints});

  factory ProviderData.fromFirestore(DocumentSnapshot document) {
    Map data = document.data;

    return ProviderData(
      providerID: document.documentID,
      company: data['company'],
      domain: data['domain'],
      datapoints: data['data'],
    );
  }
}
