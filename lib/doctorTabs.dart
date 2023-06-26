import 'package:first_app/doctorProfile.dart';
// import 'package:first_app/doctorprofile.dart';
import 'package:flutter/material.dart';
import 'package:first_app/doctorHome.dart';


class doctorTabs extends StatefulWidget {
  const doctorTabs({super.key});

  @override
  State<doctorTabs> createState() => _TabsState();
}

class _TabsState extends State<doctorTabs> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static List<Widget> _pages = <Widget>[
    HomeScreen(),
    doctorProfile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Health Monitoring'),
        backgroundColor: Color.fromARGB(255, 90, 13, 103),
      ),
      body: SafeArea(
        child: Container(
          child: _pages.elementAt(_selectedIndex), //New
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 90, 13, 103),
        selectedItemColor: Color.fromARGB(255, 221, 230, 97),
        unselectedItemColor: Color.fromARGB(255, 255, 255, 255),
        currentIndex: _selectedIndex, //New
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
         
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
