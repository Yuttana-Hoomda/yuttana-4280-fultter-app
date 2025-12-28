/// @author Yuttana Hoomda
/// @version 1.0
/// @date 2025-12-22
/// this lab will focus on create custom widget with model
/// the output it will grid area 2x2 that have 4 pet card widget
/// -------- logic -------
/// petModel --> create class pet model in pet_model file
///     that have properties name, img, textColor and bgColor
/// PetCardWithModel --> create custom widget that required pet model
/// PetGalleryScreen --> use PetCardWithModel in this screen,
///     this screen have layout that similar to previous exercise
/// Not Using Ai
library;
import 'package:flutter/material.dart';
import 'package:yuttana_4280_fultter_app/screens/pets_gallery_screen.dart';

void main() => runApp(const MainPetModelGallery());

class MainPetModelGallery extends StatelessWidget {
  const MainPetModelGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: PetsGalleryScreen(),
    );
  }
}
