import 'package:flutter/material.dart';
import '../widgets/add_button_functions.dart'; //

class LibraryScreen extends StatefulWidget {
  final Function(String) onAddFolder;


  const LibraryScreen({Key? key, required this.onAddFolder}) : super(key: key);

  @override
  LibraryScreenState createState() => LibraryScreenState();
}

class LibraryScreenState extends State<LibraryScreen> {
  List<String> folders = []; // List to hold folder names

  void addFolder(String folderName) {
    if (folderName.isNotEmpty) {
      setState(() {
        folders.add(folderName); // Update the folder list
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Library')),
      body: ListView.builder(
        itemCount: folders.length,
        itemBuilder: (context, index) {
          return ListTile(title: Text(folders[index])); // Display folder names
        },
      ),
    );
  }
  // // Method to add a folder
  // void addFolder(String folderName) {
  //   setState(() {
  //     folders.add(folderName); // Update the folder list
  //   });
  // }
}


