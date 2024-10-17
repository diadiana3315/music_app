import 'package:flutter/material.dart';

class AddFunctions {
  static void addFolder(BuildContext context, Function(String) onAddFolder) {
    String folderName = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Create New Folder'),
          content: TextField(
            onChanged: (value) {
              folderName = value;
            },
            decoration: InputDecoration(hintText: "Enter folder name"),
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: Text('Create'),
              onPressed: () {
                if (folderName.isNotEmpty) {
                  onAddFolder(folderName); // Use the callback to add the folder
                  Navigator.of(context).pop(); // Close the dialog
                } else {
                  // Show a snackbar if the folder name is empty
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Folder name cannot be empty!')),
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }

  static void takePhoto(BuildContext context) {

  }

  static void addFromImages(BuildContext context) {

  }

  static void addPDF(BuildContext context) {

  }
}