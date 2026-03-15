import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yuttana_navigation_exercises/states/quiz_preferences_state.dart';

void _showNameDialog(BuildContext context, String field, String current) {
  final controller = TextEditingController(text: current);
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: Text('Edit $field'),
      content: TextField(controller: controller),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            if (field == 'Name') {
              context.read<QuizPreferencesState>().setUserName(
                controller.text.trim(),
              );
            } else {
              context.read<QuizPreferencesState>().setBio(
                controller.text.trim(),
              );
            }
            Navigator.pop(context);
          },
          child: const Text('Save'),
        ),
      ],
    ),
  );
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final prefs = context.watch<QuizPreferencesState>();
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final List<ThemeMode> themes = [
      ThemeMode.light,
      ThemeMode.dark,
      ThemeMode.system,
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: Text(
              'User Profile',
              style: textTheme.titleMedium?.copyWith(
                color: colorScheme.primary,
              ),
            ),
          ),
          _userProfileListTile(
            Icons.person,
            'Name',
            prefs.userName,
                () => _showNameDialog(context, 'Name', prefs.userName),
          ),
          _userProfileListTile(
            Icons.info_outline,
            'Bio',
            prefs.userBio,
                () => _showNameDialog(context, 'Bio', prefs.userBio),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: Text(
              'Preferences',
              style: textTheme.titleMedium?.copyWith(color: colorScheme.primary),
            ),
          ),
          _preferenceListTile(
            Icons.volume_up_rounded,
            'Sound Effects',
            'Play sounds when answering',
            prefs.soundEnabled,
            prefs.setSoundEnable,
          ),
          _preferenceListTile(
            Icons.vibration_rounded,
            'Vibration',
            'Vibration on correct/wrong answer',
            prefs.vibrationEnabled,
            prefs.setVibrationEnable,
          ),
          const Divider(),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: Text(
              'Theme',
              style: textTheme.titleMedium?.copyWith(color: colorScheme.primary),
            ),
          ),
          RadioGroup<ThemeMode>(
            groupValue: prefs.themeMode,
            onChanged: prefs.setTheme,
            child: Column(
              children: themes
                  .map(
                    (theme) => RadioListTile<ThemeMode>(
                  title: Text('${theme.name} mode'),
                  value: theme,
                ),
              )
                  .toList(),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.pushNamed(context, '/profile'),
        label: Text('View Profile'),
        icon: Icon(Icons.person),
      ),
    );
  }
}

Widget _userProfileListTile(
  IconData iconData,
  String title,
  String subTitle,
  VoidCallback onTap,
) {
  return ListTile(
    leading: Icon(iconData),
    title: Text(title),
    subtitle: Text(subTitle),
    trailing: IconButton(
      onPressed: onTap,
      icon: Icon(Icons.arrow_right_rounded),
    ),
  );
}

Widget _preferenceListTile(
  IconData iconData,
  String title,
  String subTitle,
  bool value,
  ValueChanged<bool> onChanged,
) {
  return SwitchListTile(
    secondary: Icon(iconData),
    title: Text(title),
    subtitle: Text(subTitle),
    value: value,
    onChanged: onChanged,
  );
}
