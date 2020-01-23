class User {
  String address;
  String email;
  String phoneNumber;
  String creditCardNumber;

  User({this.address, this.email, this.phoneNumber, this.creditCardNumber});

  Map<String, dynamic> toMap() {
    return {
      'Address': this.address,
      'Email Address': this.email,
      'Phone Number': this.phoneNumber,
      'Credit Card': this.creditCardNumber
    };
  }
}
