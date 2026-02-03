import 'package:flutter/material.dart';
import '../models/faculty_model.dart';

class FacultyDetail extends StatelessWidget {
  const FacultyDetail({super.key, required this.faculty});

  final FacultyModel faculty;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(faculty.name),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Text(
                      faculty.description,
                    style: TextStyle(
                      fontSize: 18,
                      color: Theme.of(context).colorScheme.onPrimary
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                    faculty.thaiName,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 36
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: Image.asset(faculty.imageUrl, fit: BoxFit.contain,)),
        ],
      ),
    );
  }
}
