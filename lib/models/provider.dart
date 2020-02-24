class Provider {
  String company;
  String domain;
  String datapoints;

  Provider({this.company, this.domain, this.datapoints});

  Map<String, dynamic> toMap() {
    return {'company': company, 'domain': domain, 'datapoints': datapoints};
  }
}
