import 'package:flutter/material.dart';
import 'package:provider/provider.dart';  // Import provider
import '../utils/library_model.dart';    // Import the model

class LibraryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final libraryModel = Provider.of<LibraryModel>(context);  // Access the state

    return Scaffold(
      appBar: AppBar(title: Text('Library')),
      body: ListView.builder(
        itemCount: libraryModel.folders.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.folder),
            title: Text(libraryModel.folders[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FolderScreen(folderName: libraryModel.folders[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class FolderScreen extends StatelessWidget {
  final String folderName;

  const FolderScreen({Key? key, required this.folderName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(folderName)),
      body: Center(
        child: Text('Welcome to the folder: $folderName'),
      ),
    );
  }
}
