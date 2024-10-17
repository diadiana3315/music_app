import 'package:flutter/material.dart';
import 'package:music_app/views/library_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
    );
    //   body: Center(
    //     child: ElevatedButton(
    //      child: Text("Go to Library"),
    //       onPressed: () {
    //         Navigator.pushNamed(context, '/library');
    //       },
    //     ),
    //   ),
    // );
  }
}