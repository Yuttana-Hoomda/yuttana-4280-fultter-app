/// @author Yuttana Hoomda
/// @version 1.0
/// @date 2025-1-27
/// this lab will show the list of product with as a grid 2 column
/// -------- logic -------
/// 1. in product_card component use cilpRRect for display img
///    and use container to how product detail
/// 2. in star_rating widget using loop the display the star icon given i < 5
///     --- if i < rating.floor --> show full star
///     --- if rating - i == 0.5 --> show half star
///     --- else ---> show outline star
/// 3. product_detail receive parameter as products[index]
///    in this screen use image and expanded widget inside column as main layout
///    image --> show image product by fix the size of image
///    expanded --> have a column widget as a child
///                 for make add cart button to bottom
///                 what ever how long of the production description
/// -----------------------
/// Not Using Ai
library;
import 'package:flutter/material.dart';
import 'package:yuttana_widgets_exercises/components/product_card.dart';
import 'package:yuttana_widgets_exercises/screens/product_detail.dart';

import 'models/product_model.dart';

void main() => runApp(const MainProductGallery());

class MainProductGallery extends StatelessWidget {
  const MainProductGallery({super.key});

  static final List<ProductModel> productList = [
    const ProductModel(
      id: 1,
      name: 'Wireless Noise-Canceling Headphones',
      price: 299.99,
      imageUrl:
          'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80',
      description:
          'Experience immersive sound with industry-leading noise cancellation and a 30-hour battery life.',
      rating: 4.8,
    ),
    const ProductModel(
      id: 2,
      name: 'Classic Analog Watch',
      price: 129.50,
      imageUrl:
          'https://images.unsplash.com/photo-1523275335684-37898b6baf30?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80',
      description:
          'A classic design featuring a genuine leather strap and water resistance up to 50 meters.',
      rating: 4.5,
    ),
    const ProductModel(
      id: 3,
      name: 'Ergonomic Office Chair',
      price: 249.00,
      imageUrl:
          'https://images.unsplash.com/photo-1592078615290-033ee584e267?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80',
      description:
          'Designed for comfort and productivity with adjustable lumbar support and breathable mesh.',
      rating: 3.5,
    ),
    const ProductModel(
      id: 4,
      name: 'Sneakers',
      price: 89.99,
      imageUrl:
          'https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80',
      description:
          'Lightweight and breathable sneakers perfect for running or casual wear.',
      rating: 4.9,
    ),
    const ProductModel(
      id: 5,
      name: 'Polaroid Camera',
      price: 99.99,
      imageUrl:
          'https://images.unsplash.com/photo-1526170375885-4d8ecf77b99f?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80',
      description:
          'Capture instant memories with this retro-inspired instant film camera.',
      rating: 2.5,
    ),
    const ProductModel(
      id: 6,
      name: 'Skin Care Set',
      price: 45.00,
      imageUrl:
          'https://images.unsplash.com/photo-1765963449601-02d96e3dcfcb?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      description:
          'Complete daily hydration set with natural organic ingredients.',
      rating: 4.7,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueAccent,
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueAccent,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: ThemeMode.system,
      home: Scaffold(
        appBar: AppBar(title: const Text('Product Gallery by 663040428-0')),
        body: Padding(
          padding: const EdgeInsetsGeometry.symmetric(
            horizontal: 12,
            vertical: 8,
          ),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.70,
            ),
            itemCount: productList.length,
            itemBuilder: (context, index) {
              final product = productList[index];
              return ProductCard(
                img: product.imageUrl,
                name: product.name,
                price: product.price,
                rating: product.rating,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetail(product: product),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
