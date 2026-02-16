/// @author Yuttana Hoomda
/// @version 1.0
/// @date 2025-2-16
/// this lab will show the 100 list of Album
/// that fetch data from API
/// -------- logic -------
/// 1) return Future as List<Album> bucause is multiple value
/// 2) after decode response data to json it still dynamic list
/// 3) map the data to be list of album by using album factory
/// Not Using Ai
library;
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:yuttana_async_exercises/models/album.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MainCallAlbumsApi());
}

Future<List<Album>> fetchAlbums() async {
  try {
    final url = '${dotenv.env['BASE_URL']}${dotenv.env['ALBUMS_PATH']}';
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'User-Agent': 'Mozilla/5.0',
        'Accept': 'application/json, text/plain, */*',
        'Accept-Language': 'en-US,en;q=0.9',
        'Connection': 'keep-alive',
      },
    );
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<Album> albums = data.map((json) => Album.fromJson(json)).toList();
      debugPrint('$albums');
      return albums;
    } else {
      throw Exception('Failed to load albums');
    }
  } catch (err) {
    throw Exception('Failed to fetch API: $err');
  }
}

class MainCallAlbumsApi extends StatefulWidget {
  const MainCallAlbumsApi({super.key});

  @override
  State<MainCallAlbumsApi> createState() => _MainCallAlbumsApiState();
}

class _MainCallAlbumsApiState extends State<MainCallAlbumsApi> {
  late Future<List<Album>> futureAlbums;

  @override
  void initState() {
    super.initState();
    futureAlbums = fetchAlbums();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Fetch Albums'), centerTitle: true),
        body: FutureBuilder(
          future: futureAlbums,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final albums = snapshot.data!;
              return ListView.builder(
                itemCount: albums.length,
                itemBuilder: (context, index) {
                  final album = albums[index];
                  return Text(
                    '${album.id}.${album.title}',
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('${snapshot.error}'));
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
