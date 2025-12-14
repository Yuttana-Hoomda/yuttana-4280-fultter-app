/// @author Yuttana Hoomda
/// @version 1.0
/// @date 2025-12-14
/// widget quote card that use Container for making button in author section
/// this lab will show picture of quote and the author inside button blue color
/// Not Using Ai
library;

import 'package:flutter/material.dart';

void main() {
  runApp(const QuoteContainerCard());
}

class QuoteContainerCard extends StatelessWidget {
  const QuoteContainerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: .fromSeed(seedColor: Colors.blueAccent),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blueAccent,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22
          ),
        )
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My Favorite Quote')
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsetsGeometry.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  constraints: BoxConstraints(
                    maxHeight: 500
                  ),
                  child: Expanded(child: Image.asset('assets/images.jpg', fit: BoxFit.cover,))
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                          'William',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          )),
                      const SizedBox(width: 20),
                      const Text(
                          'Shakespeare',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          )),
                    ],
                  ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
