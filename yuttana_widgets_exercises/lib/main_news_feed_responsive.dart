/// @author Yuttana Hoomda
/// @version 1.0
/// @date 2025-1-28
/// this lab will show the list of news feed and can responsive the number of column
/// is depend on screen size
/// -------- logic -------
/// 1. Use media queries to get context what is screen size
/// 2 Use GridView.Builder for display the news feed list
///   create private method _gridColumn and _gridRatio
///   to make number of Column and the size of feed card depend on screen size
///   portrait ----> 1 column,
///   landscape ---> 2 column,
///   tablet and window ---> 3 column,
/// -----------------------
/// Not Using Ai
library;

import 'package:flutter/material.dart';
import 'package:yuttana_4280_fultter_app/screens/news_feed_screen.dart';

void main() => runApp(const MainNewsFeedResponsive());

class MainNewsFeedResponsive extends StatelessWidget {
  const MainNewsFeedResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepOrange,
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepOrange,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: ThemeMode.system,
      home: NewsFeedScreen(),
    );
  }
}
