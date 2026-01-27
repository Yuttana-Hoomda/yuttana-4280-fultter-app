class ProductModel {
  final int id;
  final String name;
  final double price;
  final String imageUrl;
  final String description;
  final double rating;

  const ProductModel({
    required this.description,
    required this.imageUrl,
    required this.name,
    required this.rating,
    required this.id,
    required this.price
  });
}