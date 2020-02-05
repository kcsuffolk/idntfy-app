class ProviderData {
  String company;
  String domain;
  String datapoints;

  ProviderData({this.company, this.domain, this.datapoints});

  Map<String, dynamic> toMap() {
    return {'company': company, 'domain': domain, 'datapoints': datapoints};
  }
}

class ProviderAccess {
  final String docID;
  final String name;
  final String address;
  final String email;
  final String phoneNumber;

  ProviderAccess({
    this.docID,
    this.name,
    this.address,
    this.email,
    this.phoneNumber,
  });
}
