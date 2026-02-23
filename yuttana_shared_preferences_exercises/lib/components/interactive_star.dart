import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InteractiveStar extends StatefulWidget {
  const InteractiveStar({super.key, required this.prefs});

  final SharedPreferencesWithCache prefs;

  @override
  State<InteractiveStar> createState() => _InteractiveStarState();
}

class _InteractiveStarState extends State<InteractiveStar> {
  int _rating = 0;

  @override
  void initState() {
    super.initState();
    _rating = widget.prefs.getInt('starRating') ?? 0;
  }

  Future<void> _saveRating(int rating) async {
    await widget.prefs.setInt('starRating', rating);
    if (!mounted) return;
    setState(() {
      _rating = rating;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for(int i = 0; i < 5; i++)
          GestureDetector(
            onTap: () => _saveRating(i+1),
            child: Icon(
                Icons.star,
              color: i < _rating ? Theme.of(context).primaryColor : Colors.grey,
            ),
          )
      ],
    );
  }
}
