/// @author Yuttana Hoomda
/// @version 1.0
/// @date 2025-1-27
/// this lab will show the list of faculties, when click it will show to detail screen
/// -------- logic -------
/// 1. in main_screen use List separated to show list of faculties
///    and separated with sizedbox for make space between card
///    pass parameter facultie to detail screen
/// 2. facultie detail screen use 2 expanded inside column
///     for divide screen is equal of 2 section
///     display image and name of faculties from parameter
/// -----------------------
/// Not Using Ai
library;
import 'package:flutter/material.dart';
import 'package:yuttana_widgets_exercises/screens/faculty_detail.dart';

import 'models/faculty_model.dart';

void main() => runApp(const MainFacultyList());

class MainFacultyList extends StatelessWidget {
  const MainFacultyList({super.key});
  static final List<FacultyModel> faculties = [
    FacultyModel(
        name: 'Engineering',
        imageUrl: 'assets/en_kku.jpg',
        description: 'https://www.en.kku.ac.th/web',
        thaiName: 'วิศวกรรมศาสตร์'
    ),
    FacultyModel(
        name: 'Nurse',
        imageUrl: 'assets/nu_kku.jpg',
        description: 'https://www.nu.kku.ac.th/web',
        thaiName: 'พยาบาล'
    ),
    FacultyModel(
        name: 'Science',
        imageUrl: 'assets/sci_kku.jpg',
        description: 'https://www.sc.kku.ac.th/web',
        thaiName: 'วิทยาศาสตร์'
    )
  ];

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
      home: Scaffold(
        appBar: AppBar(
          title:  const Text('KKU Faculties 663040428-0'),
          centerTitle: true,
        ),
        body: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(height: 8,),
            itemCount: faculties.length,
            itemBuilder: (context, index) {
              return ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(12)
                ),
                tileColor: Colors.white10,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FacultyDetail(faculty: faculties[index])
                  )
                ),
                leading: Icon(Icons.arrow_right_rounded),
                title: Text(faculties[index].name),
              );
            }
        ),
      ),
    );
  }
}
