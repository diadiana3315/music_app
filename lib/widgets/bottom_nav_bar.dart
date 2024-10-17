// import 'package:flutter/material.dart';
// import 'package:music_app/views/home_screen.dart';
// import '../views/library_screen.dart';
// import '../views/performance_mode.dart';
// import '../views/profile_screen.dart';
//
// class BottomNavBar extends StatefulWidget {
//   const BottomNavBar({Key? key}) : super(key: key);
//
//   @override
//   _BottomNavBarState createState() => _BottomNavBarState();
// }
//
// class _BottomNavBarState extends State<BottomNavBar> {
//   int _currentIndex = 0;
//
//   final List<Widget> _screens = [
//     LibraryScreen(),
//     PerformanceScreen(),
//     Container(),
//     HomeScreen(),
//     ProfileScreen(),
//   ];
//
//   void _onItemTapped(int index) {
//     if (index != 1) {
//       setState(() {
//         _currentIndex = index;
//       });
//     }
//   }
//   //
//   // void _showAddOptions (BuildContext context) {
//   //   showModalBottomSheet(
//   //       context: context,
//   //       builder: (BuildContext context) {
//   //         return Wrap(
//   //           children: [
//   //             ListTile(
//   //               leading: Icon(Icons.photo_library),
//   //               title: Text('Add from Images'),
//   //               onTap: () {
//   //                 Navigator.pop(context);
//   //               },
//   //             ),
//   //             ListTile(
//   //               leading: Icon(Icons.picture_as_pdf),
//   //               title: Text('Add PDF'),
//   //               onTap: () {
//   //                 Navigator.pop(context);
//   //               },
//   //             ),
//   //           ],
//   //         );
//   //       },
//   //   );
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: Text('Music App'),
//       // ),
//       body: _screens[_currentIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         items: [
//           const BottomNavigationBarItem(
//             icon: Icon(Icons.library_music),
//             label: "Library",
//           ),
//           const BottomNavigationBarItem(
//             icon: Icon(Icons.radio_button_off),
//             label: "Performance Mode",
//           ),
//           BottomNavigationBarItem(
//             icon: PopupMenuButton<String>(
//               icon: const Icon(Icons.add_circle),
//               onSelected: (String result) {
//                 if (result == 'images') {
//                   // Add from images logic
//                 } else if (result == 'pdf') {
//                   // Add PDF logic
//                 }
//               },
//               itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
//                 PopupMenuItem<String>(
//                   value: 'images',
//                   child: Text('Add from Images'),
//                 ),
//                 PopupMenuItem<String>(
//                   value: 'pdf',
//                   child: Text('Add PDF'),
//                 ),
//               ],
//             ),
//             label: "Add",
//           ),
//           const BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: "Home",
//           ),
//           const BottomNavigationBarItem(
//             icon: Icon(Icons.account_circle),
//             label: "Profile",
//           ),
//         ],
//         currentIndex: _currentIndex,
//         selectedItemColor: Colors.blue,
//         unselectedItemColor: Colors.grey,
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }
//

import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatefulWidget {
  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _currentIndex = 0; // Default index for screens

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onAddButtonPressed() {
    // Handle your add button logic
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.photo_library),
              title: Text('Add from Images'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.picture_as_pdf),
              title: Text('Add PDF'),
              onTap: () {},
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Music App'),
      ),
      body: Center(
        child: Text("Your screen content here"),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 0.0), // Pushes FAB lower
        child: FloatingActionButton(
          onPressed: _onAddButtonPressed,
          child: Icon(Icons.add, size: 40), // Larger icon size
          backgroundColor: Colors.white,
          elevation: 2.0,
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _onAddButtonPressed,
      //   child: Icon(Icons.add, size: 40), // Making the icon bigger
      //   backgroundColor: Colors.white,
      //   elevation: 2.0,
      // ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(), // Notch for FAB
        notchMargin: 8.0,
        child: Container(
          height: 80.0, // Height of BottomAppBar to accommodate larger icons
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    iconSize: 40, // Adjust the size of the icon
                    icon: Icon(Icons.library_music),
                    onPressed: () => _onItemTapped(0),
                  ),
                  IconButton(
                    iconSize: 40,
                    icon: Icon(Icons.check_circle),
                    onPressed: () => _onItemTapped(1),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    iconSize: 40,
                    icon: Icon(Icons.home),
                    onPressed: () => _onItemTapped(2),
                  ),
                  IconButton(
                    iconSize: 40,
                    icon: Icon(Icons.account_circle),
                    onPressed: () => _onItemTapped(3),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
