import 'package:flutter/material.dart';

class PetCard extends StatelessWidget {
  const PetCard({required this.img, required this.petName, super.key});

  final String img;
  final String petName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadiusGeometry.vertical(
              top: Radius.circular(20)),
          child: Image.network(
              img,
            height: 120,
            width: 120,
            fit: BoxFit.cover,
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadiusGeometry.vertical(
            bottom: Radius.circular(20)
          ),
          child: Container(
            padding: const EdgeInsetsGeometry.symmetric(
                  horizontal: 12,
                  vertical: 8
                ),
            width: 120,
            alignment: Alignment.center,
            color: Colors.deepPurple,
            child: Text(
                petName,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
        )
      ],
    );
  }
}
