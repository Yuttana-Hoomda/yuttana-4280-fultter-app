/// @author Yuttana Hoomda
/// @version 1.0
/// @date 2025-12-8
/// Don't use AI
library;

import 'package:flutter/material.dart';

void main() {
  runApp(const StudentProfile());
}

class StudentProfile extends StatelessWidget {
  const StudentProfile({super.key});

  @override
  Widget build(BuildContext context) {
    const String name = 'Yuttana Hoomda';
    const String id = '66304028-0';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: .fromSeed(seedColor: Colors.blueAccent),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blueAccent,
        )
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Student Profile'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: .center,
            children: [
              Text(
                  name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
              ),
              Text(
                id,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

