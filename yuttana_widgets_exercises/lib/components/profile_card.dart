import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key, required this.img, required this.name});

  final String img;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: const Alignment(0.5, 0.6),
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(img),
          radius: 150,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.black54
          ),
          child: Text(
            name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold
            ),
          ),
        )
      ],
    );
  }
}
