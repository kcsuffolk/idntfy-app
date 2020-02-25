import 'package:cloud_firestore/cloud_firestore.dart';

class Provider {
  final String providerID;
  final String company;
  final String domain;
  final String datapoints;

  Provider({this.providerID, this.company, this.domain, this.datapoints});

  factory Provider.fromFirestore(DocumentSnapshot document) {
    Map data = document.data;

    return Provider(
      providerID: document.documentID,
      company: data['company'],
      domain: data['domain'],
      datapoints: data['data'],
    );
  }
}
