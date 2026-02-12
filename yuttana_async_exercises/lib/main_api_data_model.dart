/// @author Yuttana Hoomda
/// @version 1.0
/// @date 2025-2-12
/// this lab will show the tex display name and company via terminal by using future for fetch api
/// this lab focus on using future to fetch data then access data as json
/// and use Model of data for strict type and filed of json data
/// then use RichText for display different color of text inline
/// Not Using Ai
library;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'models/user.dart';

Future<User> fetchUser() async {
  try {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users/1'),
      headers: {
        'User-Agent': 'Mozilla/5.0',
        'Accept': 'application/json, text/plain, */*',
        'Accept-Language': 'en-US,en;q=0.9',
        'Connection': 'keep-alive',
      },
    );
    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load user');
    }
  } catch (err) {
    throw Exception('Failed to to fetch api: $err');
  }
}

void main() => runApp(const MainApiDataModel());

class MainApiDataModel extends StatefulWidget {
  const MainApiDataModel({super.key});

  @override
  State<MainApiDataModel> createState() => _MainApiDataModelState();
}

class _MainApiDataModelState extends State<MainApiDataModel> {
  late Future<User> futureUser;

  @override
  void initState() {
    super.initState();
    futureUser = fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: ThemeMode.system,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Call API By Yuttana 4280'),
          centerTitle: true,
        ),
        body: Center(
          child: FutureBuilder(
            future: futureUser,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final data = snapshot.data!;
                return RichText(
                  text: TextSpan(
                    text: data.name,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' works at ',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: DefaultTextStyle.of(context).style.color,
                        ),
                      ),
                      TextSpan(
                        text: data.company,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
