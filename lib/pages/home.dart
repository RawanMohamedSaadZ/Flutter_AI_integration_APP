import 'package:flutter/material.dart';
import '../AI Model/camera_screen.dart';
import '../AI Model/gallery_screen.dart';
import 'drawerscreen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff6E2D8C),
        title: const Text("Image Classifaction",style:  TextStyle(fontWeight:FontWeight.bold,color: Colors.white ,fontSize: 26) ),
        // leading: IconButton(onPressed: (){}, icon: Icon(Icons.menu),style: ButtonStyle(iconSize:MaterialStateProperty.all(100)),)  ,
        iconTheme: const IconThemeData(color: Colors.white ,size: 42) ,
        centerTitle: true,
      ),
      drawer: const CustomDrawer (),
      body: Center(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              flex: 1,
              child: Container(),
            ),
            ElevatedButton(

              style: ButtonStyle(
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))),
                  backgroundColor: MaterialStateProperty.all(const Color(0xff6E2D8C))
              ),
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CameraScreen()));

              },
              child: const Text(' Open Camera', style: TextStyle( fontSize :20 , color: Colors.white ,),),
            ),
            const Expanded(
              flex: 0 ,
              child: SizedBox(height: 20,),
            ),
            ElevatedButton(

              style: ButtonStyle(
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))),
                  backgroundColor: MaterialStateProperty.all(const Color(0xff6E2D8C))
              ),
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const GalleryScreen()));

              },
              child: const Text(' Open Gallery', style: TextStyle( fontSize :20 , color: Colors.white ,),),
            ),
            Flexible(
                flex: 1,
                child: Container()) ,


            // ElevatedButton(
            //
            //   style: ButtonStyle(
            //       shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))),
            //       backgroundColor: MaterialStateProperty.all(Color(0xff6E2D8C))
            //   ),
            //   onPressed: () => Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) => DetectorPage()),
            //   ),
            //   child: Text(' Object Detection', style: TextStyle( fontSize :18 , color: Colors.white ,),),
            // ),
            // Spacer(
            //   flex: 1,
            //
            // ),
          ],
        ),
      ),
    );
  }
}
