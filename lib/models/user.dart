class User {
  final String uid;
  final String name;
  final String address;
  final String email;
  final String phoneNumber;
  final String creditCard;

  User({
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
