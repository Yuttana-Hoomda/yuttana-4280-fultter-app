import 'package:flutter/material.dart';
import 'package:yuttana_4280_fultter_app/components/pet_card.dart';
import 'package:yuttana_4280_fultter_app/utils/pet_img.dart';

class PetsScreen extends StatelessWidget {
  const PetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Pet App'),
      ),
      body: Center(
        child: Padding(
            padding: EdgeInsetsGeometry.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Expanded(child: PetCard(img: PetImages.bird, petName: PetNames.bird)),
                    Expanded(child: PetCard(img: PetImages.dog, petName: PetNames.dog))
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: PetCard(img: PetImages.cat, petName: PetNames.cat)),
                    Expanded(child: PetCard(img: PetImages.rabbit, petName: PetNames.rabbit))
                  ],
                )
              ],
            )
        )
      ),
    );
  }
}