import 'package:flutter/material.dart';
import 'package:image_classification_app/pages/drawerscreen.dart';
import 'package:image_classification_app/pages/home.dart';
import 'package:image_classification_app/pages/items.dart';
import 'package:image_classification_app/pages/items1api.dart';
import 'package:image_classification_app/pages/login.dart';
import 'package:image_classification_app/pages/navigationbar.dart';
import 'package:image_classification_app/pages/navigationbar2.dart';
import 'package:image_classification_app/pages/navigationbar3.dart';
import 'package:image_classification_app/pages/signup.dart';
import 'package:image_classification_app/pages/welcome.dart';
import 'AI Model/camera_screen.dart';
import 'AI Model/gallery_screen.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: Home(),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) =>  const Welcome(),
        "/HomePage" : (context) =>  const Home(),
        "/LoginForm" : (context) =>  const LoginForm(),
        "/custom-drawer" : (context) =>  const CustomDrawer(),
        "/signup" : (context) =>  const Signup(),
        "/Items" : (context) =>  const Items(),
        "/Items1" : (context) =>  const Items_API(),
        "/Bottom1" : (context) =>  const Bottom1(),
        "/Bottom2" : (context) =>  const Bottom2(),
        "/Bottom3" : (context) =>  const Bottom3(),
        "/Gallery" : (context) => const GalleryScreen(),
        "/Camera" : (context) => const CameraScreen(),
      },
    );
  }
}


