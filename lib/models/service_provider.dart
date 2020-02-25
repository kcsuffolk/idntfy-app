import 'package:cloud_firestore/cloud_firestore.dart';

class ServiceProvider {
  final String providerID;
  final String company;
  final String domain;
  final String datapoints;

  ServiceProvider(
      {this.providerID, this.company, this.domain, this.datapoints});

  factory ServiceProvider.fromFirestore(DocumentSnapshot document) {
    Map data = document.data;

    return ServiceProvider(
      providerID: document.documentID,
      company: data['company'],
      domain: data['domain'],
      datapoints: data['data'],
    );
  }
}
