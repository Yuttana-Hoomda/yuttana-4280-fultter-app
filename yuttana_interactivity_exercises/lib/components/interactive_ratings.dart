import 'package:flutter/material.dart';

class InteractiveRatings extends StatefulWidget {
  const InteractiveRatings({super.key});

  @override
  State<InteractiveRatings> createState() => _InteractiveRatingsState();
}

class _InteractiveRatingsState extends State<InteractiveRatings> {
  int activeStar = 0;

  void _onTap(int index) {
    setState(() {
      activeStar = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for(int i = 0; i < 5; i++)
          GestureDetector(
            onTap: () => _onTap(i),
            child: Icon(
                Icons.star,
              color: i < activeStar + 1 ? Theme.of(context).colorScheme.primary : Colors.grey,
            ),
          )
      ],
    );
  }
}
