class UserContact {
  final String contactId;
  final String name;
  final String email;
  final String phoneNumber;

  UserContact(
      {required this.contactId,
      required this.phoneNumber,
      required this.email,
      required this.name});

  factory UserContact.fromJson(Map<String, dynamic> json) {
    return UserContact(
      contactId: json['Id'],
      phoneNumber: json['phone'],
      email: json['email'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': contactId,
      'phone': phoneNumber,
      'email': email,
      'name': name,
    };
  }
}
