import 'package:flutter/material.dart';
import 'package:music_app/views/home_screen.dart';
import '../views/library_screen.dart';
import '../views/performance_mode.dart';
import '../views/profile_screen.dart';
import 'add_button_functions.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    LibraryScreen(onAddFolder: (String ) {  },),
    PerformanceScreen(),
    Container(),
    HomeScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    if (index == 2) {
      _showAddOptions(context);
    } else {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  void _showAddOptions (BuildContext context) {
    if (_currentIndex == 0) {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Wrap(
            children: [
              ListTile(
                leading: Icon(Icons.create_new_folder),
                title: Text('Add Folder'),
                onTap: () {
                  // TO DO
                  AddFunctions.addFolder(context, (folderName) {

                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.add_a_photo_rounded),
                title: Text('Take a Photo'),
                onTap: () {
                  AddFunctions.takePhoto(context);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Add from Images'),
                onTap: () {
                  AddFunctions.addFromImages(context);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.picture_as_pdf),
                title: Text('Add PDF'),
                onTap: () {
                  AddFunctions.addPDF(context);
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    } else {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Wrap(
            children: [
              ListTile(
                leading: Icon(Icons.add_a_photo_rounded),
                title: Text('Take a Photo'),
                onTap: () {
                  AddFunctions.takePhoto(context);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Add from Images'),
                onTap: () {
                  AddFunctions.addFromImages(context);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.picture_as_pdf),
                title: Text('Add PDF'),
                onTap: () {
                  AddFunctions.addPDF(context);
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
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
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
      onPressed: () {
      _showAddOptions(context); // Show add options
      },
      child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, // Center docked
    );
  }
}

