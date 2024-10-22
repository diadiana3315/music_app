import 'package:flutter/material.dart';
import 'package:music_app/utils/library_model.dart';
import 'package:music_app/widgets/bottom_nav_bar.dart';
import 'package:provider/provider.dart';  // Import provider
import 'views/library_screen.dart';
import 'views/home_screen.dart';
import 'views/profile_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => LibraryModel(), // Provide LibraryModel to the app
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CustomBottomNavBar(),
    );
  }
}

