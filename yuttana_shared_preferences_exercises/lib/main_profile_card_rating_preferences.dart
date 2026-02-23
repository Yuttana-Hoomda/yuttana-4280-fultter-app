/// @author Yuttana Hoomda
/// @version 1.0
/// @date 2025-2-22
/// this lab will show the Responsive of profile card rating
/// that can interact with rating star, when restart app star value is still resits
/// -------- logic -------
/// 1) use all widget from previous lab except interactive star
/// 2) pass parameter SharePreferenceWithCache from parent widget to children widget
/// 3) in interactive star widget save star value to local storage
/// Not Using Ai
library;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yuttana_shared_preferences_exercises/screens/profile_card_rating_responsive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferencesWithCache.create(
      cacheOptions: const SharedPreferencesWithCacheOptions(
        allowList: {'starRating'}
      )
  );
  
  runApp(MainProfileCardRatingPreferences(prefs: prefs));
}

class MainProfileCardRatingPreferences extends StatelessWidget {
  const MainProfileCardRatingPreferences({super.key, required this.prefs});

  final SharedPreferencesWithCache prefs;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileCardRatingResponsive(prefs: prefs,),
    );
  }
}
