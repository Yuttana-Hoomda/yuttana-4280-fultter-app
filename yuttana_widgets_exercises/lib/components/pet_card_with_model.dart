import 'package:flutter/material.dart';
import '../models/pet_model.dart';

class PetCardWithModel extends StatelessWidget {
  const PetCardWithModel({super.key, required this.pet});
  final PetModel pet;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(12)
            ),
            child: Image.network(pet.imageUrl, width: 120, height: 120, fit: BoxFit.cover),
          ),
        Container(
          width: 120,
          decoration: BoxDecoration(
            color: pet.backgroundColor,
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(12)
            )
          ),
          padding: EdgeInsetsGeometry.symmetric(vertical: 8),
          child: Text(
            textAlign: TextAlign.center,
            pet.name,
            style: TextStyle(
                color: pet.textColor,
                fontWeight: FontWeight.bold,
                fontSize: 18
            ),
          ),
        )
      ],
    );
  }
}
