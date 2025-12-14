/// @author Yuttana Hoomda
/// @version 2.0
/// @date 2025-12-10
/// widget quote card that use expanded make img full width
/// this lab will show picture of quote and the author
/// Not Using Ai
library;

import 'package:flutter/material.dart';

void main() {
  runApp(const QuoteCard());
}

class QuoteCard extends StatelessWidget {
  const QuoteCard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: .fromSeed(seedColor: Colors.blue),
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[200],
          title: Text("My Favorite Quote"),
        ),
        body: Padding(
          padding: EdgeInsetsGeometry.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                  constraints: BoxConstraints(
                      maxHeight: 500
                  ),
                  child: Expanded(child: Image.asset('assets/images.jpg', fit: BoxFit.cover,))
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                        'William',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent
                        )),
                    const SizedBox(width: 20),
                    const Text(
                        'Shakespeare',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
