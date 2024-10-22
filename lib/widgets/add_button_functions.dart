import 'package:flutter/material.dart';

class AddFunctions {
  static void addFolder(BuildContext context, Function(String) onFolderAdded) {
    TextEditingController _folderNameController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('New Folder'),
          content: TextField(
            controller: _folderNameController,
            decoration: InputDecoration(hintText: "Enter folder name"),
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
              },
            ),
            ElevatedButton(
              child: Text('Save'),
              onPressed: () {
                String folderName = _folderNameController.text;
                if (folderName.isNotEmpty) {
                  onFolderAdded(folderName); // Call the callback
                  Navigator.of(context).pop(); // Close dialog
                }
              },
            ),
          ],
        );
      },
    );
  }
}
