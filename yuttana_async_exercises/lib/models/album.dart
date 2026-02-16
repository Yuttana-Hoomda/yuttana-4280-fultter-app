class Album {
  final int userId;
  final int id;
  final String title;

  const Album({
    required this.title,
    required this.id,
    required this.userId
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
        title: json['title'] as String? ?? '',
        id: json['id'] as int? ?? 0,
        userId: json['userId'] as int? ?? 0
    );
  }
}