class User {
  final int id;
  final String name;
  final String company;

  const User({
    required this.id,
    required this.name,
    required this.company
  });

  factory User.fromJson(Map<String, dynamic> json) {
    final id = json['id'] as int;
    final name = json['name'] as String;
    final company = json['company']['name'] as String;
    return User(id: id, name: name, company: company);
  }
}