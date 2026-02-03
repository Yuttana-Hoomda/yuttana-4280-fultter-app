import 'package:flutter/material.dart';
import '../components/pet_card_with_model.dart';
import '../models/pet_model.dart';
import '../utils/pet_img.dart';

final PetModel bird = PetModel(
    name: 'Bird',
    imageUrl: PetImages.bird
);
final PetModel dog = PetModel(
    name: 'Dog',
    imageUrl: PetImages.dog,
    backgroundColor: Colors.brown
);
final PetModel cat = PetModel(
    name: 'Cat',
    imageUrl: PetImages.cat,
    textColor: Colors.yellow
);
final PetModel rabbit = PetModel(
    name: 'Rabbit',
    imageUrl: PetImages.rabbit,
    textColor: Colors.yellow,
    backgroundColor: Colors.green
);

class PetsGalleryScreen extends StatelessWidget {
  const PetsGalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Pet Gallery',
            style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepOrange,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(child: PetCardWithModel(pet: bird)),
              Expanded(child: PetCardWithModel(pet: dog))
            ],
          ),
          SizedBox(height: 16,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(child: PetCardWithModel(pet: cat)),
              Expanded(child: PetCardWithModel(pet: rabbit))
            ],
          )
        ],
      ),
    );
  }
}
