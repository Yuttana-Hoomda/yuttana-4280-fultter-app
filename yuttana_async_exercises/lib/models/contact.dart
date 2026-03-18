class Contact {
  final String name;
  final String phone;
  final String email;

  const Contact({
    required this.phone,
    required this.name,
    required this.email
});

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
        phone: json['phone'],
        name: json['name'],
        email: json['email']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "phone": phone,
      "email": email
    };
  }
}