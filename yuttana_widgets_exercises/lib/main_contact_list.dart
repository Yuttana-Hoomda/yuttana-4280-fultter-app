/// @author Yuttana Hoomda
/// @version 1.0
/// @date 2025-1-7
/// this lab will focus on using List separator to show data and floating button for user interaction
/// the output will show list of contacts that have name and phone, button for add new contact
/// -------- logic -------
/// 1. create contact model that have name and phone number
/// 2. copy list of contacts from lab document
/// 3. use List.separated for show list of contacts that have space between element by using sizebox
/// 4. add state function to floating action button for add new contact
/// -----------------------
/// Not Using Ai
library;

import 'package:flutter/material.dart';
import 'package:yuttana_4280_fultter_app/screens/contact_list_screen.dart';

void main() => runApp(MainContactList());

class MainContactList extends StatelessWidget {
  const MainContactList({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        brightness: Brightness.light
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.orange,
            brightness: Brightness.dark
        )
      ),
      themeMode: ThemeMode.system,
      home: ContactListScreen(),
    );
  }
}
