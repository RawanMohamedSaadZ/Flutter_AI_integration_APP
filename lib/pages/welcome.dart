import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: const Color(0xff2E1847),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
               const SizedBox(
                height: 100,
              ),
               const Text("Object Detection App ",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 22,
              ),


              ClipRRect(
                  borderRadius: BorderRadius.circular(66),
                  child: Image.asset('Assets/images/Screen.jpg', width: 224 ,
                    height:238 , fit: BoxFit.cover,
                  )),

               const SizedBox(
                height: 22,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/LoginForm");
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                  padding: MaterialStateProperty.all(
                       const EdgeInsets.symmetric(horizontal: 99, vertical: 15)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(66))),
                ),
                child:  const Text(
                  "Log in",
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 22,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 85, vertical: 15)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(66))),
                ),
                child: const Text(
                  "Sign up",
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
