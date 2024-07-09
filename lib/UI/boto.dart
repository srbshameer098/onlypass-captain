import 'package:flutter/material.dart';

class MyHomePage1 extends StatefulWidget {
  @override
  _MyHomePage1State createState() => _MyHomePage1State();
}

class _MyHomePage1State extends State<MyHomePage1> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    // Replace these with your actual pages
    Placeholder(),
    Placeholder(),
    Placeholder(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Bottom Navigation Bar'),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 5,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNavItem(Icons.search, 0),
            _buildNavItem(Icons.view_list, 1),
            _buildCenterNavItem(Icons.home), // Center icon
            _buildNavItem(Icons.bookmark, 2),
            _buildNavItem(Icons.settings, 3),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child:
          Icon(icon, color: _currentIndex == index ? Colors.blue : Colors.grey),
    );
  }

  Widget _buildCenterNavItem(IconData icon) {
    return GestureDetector(
      onTap: () => _onItemTapped(2),
      // Center item always corresponds to index 2
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blue,
        ),
        child: Icon(icon, color: Colors.white),
      ),
    );
  }
}
