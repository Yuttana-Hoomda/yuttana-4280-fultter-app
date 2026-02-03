import 'package:flutter/material.dart';

Text _text(String text, BuildContext context, [Color? color]) {
  return Text(
    text,
    style: Theme.of(context).textTheme.titleLarge?.copyWith(
      color: color ?? Theme.of(context).colorScheme.primary,
    ),
  );
}

class ProfileWithButton extends StatelessWidget {
  const ProfileWithButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _text('Yuttana', context),
                _text('663040428-0', context),
              ],
            ),
            Image.network(
              'https://contentful.harrypotter.com/usf1vwtuqyxm/6fjvdemYmo7kJ2V5P5Xqhc/1fc2b0b396123f891e858069e00d0d2b/hp-f6-harry-at-great-hall-table-web-fact-file-image.jpg',
              height: 400,
              fit: BoxFit.cover,
            ),
            Column(
              children: [
                _text('Photo Credit: Google', context),
                const SizedBox(height: 24),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Confirmation'),
                          content: const Text(
                            'Are you sure you want to submit?',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: _text(
                      'Submit',
                      context,
                    Theme.of(context).colorScheme.onPrimary
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
