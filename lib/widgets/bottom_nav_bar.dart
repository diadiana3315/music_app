import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/library_model.dart';
import '../views/home_screen.dart';
import '../views/library_screen.dart';
import '../views/performance_mode.dart';
import '../views/profile_screen.dart';
import 'add_button_functions.dart';

class CustomBottomNavBar extends StatefulWidget {
  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    LibraryScreen(),
    PerformanceScreen(),
    Container(),
    HomeScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }


    void _showAddOptionsModal(BuildContext context) {
      final libraryModel = Provider.of<LibraryModel>(context, listen: false);

      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Wrap(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.folder),
                title: Text('Create Folder'),
                onTap: () {
                  Navigator.of(context).pop(); // Close modal
                  AddFunctions.addFolder(context, (folderName) {
                    libraryModel.addFolder(folderName);
                  });
                },
              ),
              ListTile(
                leading: Icon(Icons.picture_as_pdf),
                title: Text('Add PDF'),
                onTap: () {
                  Navigator.of(context).pop(); // Close modal
                  // Implement Add PDF logic
                },
              ),
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('Take Image'),
                onTap: () {
                  Navigator.of(context).pop(); // Close modal
                  // Implement Take Image logic
                },
              ),
              ListTile(
                leading: Icon(Icons.photo),
                title: Text('Add Image'),
                onTap: () {
                  Navigator.of(context).pop(); // Close modal
                  // Implement Add Image logic
                },
              ),
            ],
          );
        },
      );
    }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: _screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onItemTapped,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.library_music),
              label: "Library",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.radio_button_off),
              label: "Performance Mode",
            ),
            BottomNavigationBarItem(
              icon: Icon(null),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: "Profile",
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // _onItemTapped(2); // Show the add options dialog
            _showAddOptionsModal(
                context); // Show the modal when the + button is pressed
          },
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      );
    }
  }

