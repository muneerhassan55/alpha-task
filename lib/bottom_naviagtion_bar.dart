import 'package:flutter/material.dart';

import 'home_screen..dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedTab = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    Center(
      child: Text("About"),
    ),
    Center(
      child: Text("Products"),
    ),
  ];

  void _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedTab],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff061321),
        currentIndex: _selectedTab,
        onTap: (index) => _changeTab(index),
        selectedItemColor: Color(0xff0C75DF),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.file_copy), label: "Plan"),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_box_outlined), label: "Progress"),
        ],
      ),
    );
  }
}
