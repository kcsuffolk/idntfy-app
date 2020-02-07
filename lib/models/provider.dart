class ProviderData {
  String company;
  String domain;
  String datapoints;

  ProviderData({this.company, this.domain, this.datapoints});

  Map<String, dynamic> toMap() {
    return {'company': company, 'domain': domain, 'datapoints': datapoints};
  }
}
