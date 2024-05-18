import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';import '../AI Model/Detector_screen.dart';
import 'home.dart';

import 'items.dart';

class Bottom2 extends StatefulWidget {
  const Bottom2({super.key});

  @override
  State<Bottom2> createState() => Bottom2State();
}

class Bottom2State extends State<Bottom2> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const Items(),
    const DetectorPage(),
    const Home(),
    // Add your screens here
  ];

   final List <Color>  backgroundColor = [
     const Color(0xffDBCCEC),
     Colors.black87,
     Colors.white ,
   ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: _screens[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: backgroundColor[_currentIndex],
        color: _currentIndex == 2 ? const Color(0xff6E2D8C) : const Color(0xff7E4DB5),
        animationDuration: const Duration(milliseconds: 300), // Corrected
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          Icon(
            Icons.shop,
            color: Colors.white,
          ),
          Icon(
            Icons.camera,
            color: Colors.white,
          ),
          Icon(
            Icons.home,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
