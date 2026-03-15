import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../states/quiz_preferences_state.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final prefs = context.watch<QuizPreferencesState>();

    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 50,
                  child: Text(
                      prefs.userName[0],
                    style: textTheme.titleLarge?.copyWith(
                      fontSize: 35
                    ),
                  ),
              ),
              const SizedBox(height: 15),
              Text(prefs.userName, style: textTheme.titleLarge,),
              const SizedBox(height: 15),
              Text(prefs.userBio, style: textTheme.titleSmall?.copyWith(
                color: Theme.brightnessOf(context) == Brightness.light ? Colors.black45 : Colors.white60

              )),
              const SizedBox(height: 30),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _settingDisplay(
                    Icons.volume_up_rounded,
                    prefs.soundEnabled,
                    context,
                    "Sound",
                  ),
                  const SizedBox(width: 16),
                  _settingDisplay(
                    Icons.vibration_rounded,
                    prefs.vibrationEnabled,
                    context,
                    "Vibration",
                  ),
                ],
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: 160,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(alignment: Alignment.center),
                  onPressed: () => Navigator.pop(context),
                  child: Row(
                    children: [
                      Icon(Icons.settings),
                      const SizedBox(width: 8),
                      Text('Edit Setting'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _settingDisplay(
    IconData icon,
    bool value,
    BuildContext context,
    String field,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).colorScheme.primaryContainer,
          width: 1.5,
        ),
      ),
      child: Row(
        children: [
          Icon(icon, color: Theme.of(context).colorScheme.primary),
          const SizedBox(width: 8),
          Text('$field ${value ? 'On' : 'Off'}'),
        ],
      ),
    );
  }
}
