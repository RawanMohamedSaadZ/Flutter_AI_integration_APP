import 'package:flutter/material.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
          body: Container(
            color: const Color(0xff6E2D8C),
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                  children: [
                    SizedBox(
                      height: screenSize.height*0.05,
                    ),
                    Row(
                      children: [

                        Container(
                          alignment: Alignment.topLeft,
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back_ios, color: Colors.white,size: 18,),
                            onPressed: () {
                              // Handle back button press
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        SizedBox(width :screenSize.width *0.1), // Add some space between the back button and text

                        const Text(
                          "Create an Account",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(height :screenSize.height *0.03), // Add some space between the back button and text

                     const Text(
                      "OR",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),


                    SizedBox(height :screenSize.height *0.04), // Add some space between the back button and text

                    Padding(
                      padding: const EdgeInsets.all(29),
                      child: TextField(
                          decoration:

                          InputDecoration(

                            suffixIcon: const Icon(
                              Icons.email,
                              color: Colors.white,
                            ),
                            contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                            hintText: 'Enter  your Email',
                            labelText: 'Email',
                            labelStyle: const TextStyle(color: Colors.grey),
                            hintStyle: const TextStyle(color: Colors.grey),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.white,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.black,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),


                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 29),
                      child: TextField(
                          obscureText: true,
                          decoration:

                          InputDecoration(
                            suffixIcon: const Icon(
                              Icons.visibility,
                              color: Colors.white,
                            ),
                            contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                            hintText: 'Enter  your Password',
                            labelText: 'Enter  your Password',
                            labelStyle: const TextStyle(color: Colors.grey),
                            hintStyle: const TextStyle(color: Colors.grey),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.white,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.black,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),


                          )),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(29),
                      child: TextField(
                          decoration:

                          InputDecoration(
                            suffixIcon: const Icon(
                              Icons.visibility,
                              color: Colors.white,
                            ),
                            contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                            hintText: 'Confirm  your Password',
                            labelText: 'Confirm  your Password',
                            labelStyle: const TextStyle(color: Colors.grey),
                            hintStyle: const TextStyle(color: Colors.grey),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.white,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.black,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),


                          )),
                    ),



                    SizedBox(height :screenSize.height *0.1), // Add some space between the back button and text

                    SizedBox(
                      width: 300,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/LoginForm");
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.black),
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                        ),
                        child: const Text(
                          "Create Account",
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height :screenSize.height *0.03), // Add some space between the back button and text

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account?  ",
                          style:  TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, "/LoginForm");
                            },
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ))
                      ],
                    ),

                  ]),
            ),
          ),
        ));
  }
}
