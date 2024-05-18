import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../AI Model/Detector_screen.dart';
import 'home.dart';
import 'items1api.dart';

class Bottom3 extends StatefulWidget {
  const Bottom3({super.key});

  @override
  Bottom3State createState() => Bottom3State();
}
class Bottom3State extends State<Bottom3> {
  int _selectedIndex = 0;


  final List <Color>  backgroundColors= [
    const Color(0xffDBCCEC),
    Colors.black,
    Colors.white,
  ];
  final List<Widget> _screens = [
    const Items_API(),
    const DetectorPage(),
    const Home(), // Add your screens here
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],

      backgroundColor: backgroundColors[_selectedIndex],
      bottomNavigationBar: SafeArea(
        child: Container(
          width: 287,
          height: 82,
          padding: const EdgeInsets.all(20),

          margin: const EdgeInsets.fromLTRB(47, 5, 47 ,30),
          decoration: BoxDecoration(
            // How to apply Specific gradient to each  of Screen
            gradient: _selectedIndex == 2
                ?const LinearGradient(
              colors: [
                Color(0xff7E4DB5),
                Color(0xff641289),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ) :
                 const LinearGradient(
              colors: [
                Color(0xff7E4DB5),
                Color(0xff7E4DB5),
              ], begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(16),
            // color: _selectedIndex == 2 ? Color(0xff641289): Color(0xff7E4DB5),
            boxShadow: [
              BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1)),
            ],
            border: Border.all(
              color: const Color(0xff17062B), // Color of the border
              width: 1, // Width of the border
            ),
          ),

          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: GNav(
              gap: 1,
              activeColor: Colors.black,
              color: Colors.white,
              iconSize: 24,
              textSize: 16,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              duration: const Duration(milliseconds: 800),
              tabBackgroundColor: Colors.white,
              tabs: const[
                GButton(
                  icon: Icons.shop,
                  text: 'Shop',
                ),
                GButton(
                  icon: Icons.camera,
                  text: 'Detection',
                ),
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
