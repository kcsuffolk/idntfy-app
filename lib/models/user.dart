class User {
  final String uid;

  User({this.uid});
}

class UserData {
  final String uid;
  final String name;
  final String address;
  final String email;
  final String phoneNumber;
  final String creditCard;

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
      'Address': address,
      'Email Address': email,
      'Phone Number': phoneNumber,
      'Credit Card Details': creditCard,
    };
  }
}
