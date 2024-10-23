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
          final folderName = libraryModel.folders[index];  // Get folder name

          // Wrap ListTile with Dismissible for swipe-to-delete
          return Dismissible(
            key: Key(folderName),  // Unique key for each item
            direction: DismissDirection.endToStart,  // Swipe from right to left

            // Red background with "Delete" text on swipe
            background: Container(
              color: Colors.redAccent,
              alignment: Alignment.centerRight,  // Align to right
              padding: EdgeInsets.only(right: 20),  // Padding from right edge
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.delete, color: Colors.white),  // Delete icon
                  SizedBox(width: 8),
                  Text(
                    'Delete',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),

            // What happens when the item is dismissed
            onDismissed: (direction) {
              libraryModel.deleteFolder(folderName);  // Remove folder

              // Show snackbar to confirm deletion
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('$folderName deleted')),
              );
            },

            child: ListTile(
              leading: Icon(Icons.folder),
              title: Text(folderName),
              onTap: () {
                // Navigate to FolderScreen on tap
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FolderScreen(folderName: folderName),
                  ),
                );
              },
            ),
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
