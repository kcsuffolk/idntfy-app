class User {
  final String uid;

  User({this.uid});
}

class UserData {
  final String uid, name, address, email, phoneNumber, creditCard;

  UserData({
    this.uid,
    this.name,
    this.address,
    this.email,
    this.phoneNumber,
    this.creditCard,
  });

  Map<String, dynamic> toMap() {
    return {
      'Address': this.address,
      'Email Address': this.email,
      'Phone Number': this.phoneNumber,
      'Credit Card': this.creditCard,
    };
  }
}
