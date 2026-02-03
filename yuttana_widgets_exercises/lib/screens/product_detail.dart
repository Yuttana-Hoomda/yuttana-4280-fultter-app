import 'package:flutter/material.dart';
import '../components/star_rating.dart';
import '../models/product_model.dart';

void _handleTap(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: const Text('Add to Cart'),
      duration: const Duration(seconds: 2),
      persist: false,
      action: SnackBarAction(
        label: 'Dismiss',
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    ),
  );
}

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name),),
      body: Column(
        children: [
          Image.network(
              product.imageUrl,
            height: 300,
            fit: BoxFit.cover,
          ),
          Expanded(
              child: Container(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 12, vertical: 25),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              product.name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24
                              ),
                          ),
                          const SizedBox(height: 6,),
                          Text(
                              '฿${product.price}',
                            style: TextStyle(
                              fontSize: 20,
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          const SizedBox(height: 6,),
                          Row(
                            children: [
                              StarRating(rating: product.rating),
                              const SizedBox(width: 8,),
                              Text('${product.rating}/5.0')
                            ],
                          ),
                          const SizedBox(height: 10,),
                          const Divider(),
                          const SizedBox(height: 10,),
                          const Text(
                              'Description',
                            style: TextStyle(
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          const SizedBox(height: 6,),
                          Text(product.description)
                        ],
                      ),
                      ElevatedButton(
                          onPressed: () => _handleTap(context),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsetsGeometry.symmetric(vertical: 16),
                            backgroundColor: Theme.of(context).colorScheme.primary,
                            foregroundColor: Colors.white
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                  Icons.shopping_cart,
                                  color: Theme.of(context).brightness == Brightness.dark
                                    ? Colors.black
                                    : Colors.white,
                              ),
                              const SizedBox(width: 10,),
                              Text(
                                  'Add to Cart',
                                style: TextStyle(
                                  color: Theme.of(context).brightness == Brightness.dark
                                      ? Colors.black
                                      : Colors.white,
                                ),
                              )
                            ],
                          )
                      )
                    ]
                ),
              )
          )
        ],
      ),
    );
  }
}
