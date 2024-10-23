import 'package:flutter/material.dart';

class LibraryModel extends ChangeNotifier {
  List<String> _folders = [];

  List<String> get folders => _folders;

  void addFolder(String folderName) {
    _folders.add(folderName);
    notifyListeners();
  }

  void deleteFolder(String folderName) {
    _folders.remove(folderName);
    notifyListeners();
  }
}
