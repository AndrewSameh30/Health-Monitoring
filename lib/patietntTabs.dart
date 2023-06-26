import 'package:first_app/patientProfile.dart';
import 'package:first_app/patientSettings.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

import 'patientHome.dart';

class patientTabs extends StatefulWidget {
  const patientTabs({super.key});

  @override
  State<patientTabs> createState() => _TabsState();
}

class _TabsState extends State<patientTabs> {
  int _selectedIndex = 1;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static List<Widget> _pages = <Widget>[
    SettingsScreen(),
    HomeScreen(),
    ProfileScreen(),
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
            icon: Icon(Icons.settings),
            label: 'Settings',
            
          ),
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
