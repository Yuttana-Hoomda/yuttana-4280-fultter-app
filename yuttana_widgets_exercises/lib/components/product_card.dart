import 'package:flutter/material.dart';
import 'package:yuttana_4280_fultter_app/components/star_rating.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.img,
    required this.name,
    required this.price,
    required this.rating,
    required this.onTap,
  });

  final String img;
  final String name;
  final double price;
  final double rating;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: Image.network(
              img,
              width: 200,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white12,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            padding: EdgeInsetsGeometry.symmetric(horizontal: 12, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  '฿$price',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 8),
                StarRating(rating: rating),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
