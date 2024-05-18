import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'home.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool flag = false;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        // Finally
        body:
        Container(
          color: const Color(0xff6E2D8C),
          height: screenSize.height,
          width: screenSize.width ,
          // Step 16
          child: SingleChildScrollView(
            // Step#1
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Step1
                  SizedBox(height: screenSize.height * 0.02),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //Step2
                      ClipRRect(
                        borderRadius: BorderRadius.circular(13),
                        child: Image.asset(
                          "Assets/images/recognition.png",
                          // to  ignore any problem to width height
                          fit: BoxFit.cover,
                          height: 85,
                          width: 78,
                        ),
                      ),
                      //Step3
                      const Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  //Step5
                  SizedBox(height: screenSize.height * 0.01),

                  const Text(
                    "Security access detect me here!",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),

                  //Step7
                  SizedBox(height: screenSize.height * 0.03),

                  // Step6 : Create ElevatedButton
                  SizedBox(
                    // Step#3
                    width: 313, // Set the width here
                    height: 43, // Set the height here
                    // Step#1
                    child: ElevatedButton(
                      // Step#2:intilize Required Properties
                      onPressed: () {
                        // Define what should happen when the button is pressed
                        signInWithGoogle();
                      },
                      child: Row(
                        // Step#
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Step#
                          Image.asset('Assets/icons/iconGoogle.png',
                              height: 24.0), // Google logo
                          const Padding(
                            //Step#
                            padding:  EdgeInsets.only(left: 10),
                            child: Text('Sign in with Google',
                                style: TextStyle(
                                    color: Colors
                                        .white)), // Optional: Change text color
                          ),
                        ],
                      ),
                      // Step#3:Optional Properties
                      style: ButtonStyle(
                        shape:
                        MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                8), // Adjust the corner radius here
                            side: const BorderSide(
                                color: Colors.white,
                                width:
                                2), // Set the border color and width here
                          ),
                        ),
                        elevation: MaterialStateProperty.all(0),
                        backgroundColor: MaterialStateProperty.all<Color>(Colors
                            .transparent), // Optional: Change button color
                      ),
                    ),
                  ),
                  //Step8
                  const Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding:  EdgeInsets.all(15),

                          //Step1

                          child: Divider(
                            color: Colors.white,
                            thickness: 4,
                            indent: 31,
                          ),
                        ),
                      ),

                      //Step2

                      Text(
                        ' Sigin with google',
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),

                      //step3
                      Expanded(
                        child: Padding(
                          padding:  EdgeInsets.all(15),
                          child: Divider(
                            color: Colors.white,
                            thickness: 4,
                            endIndent: 31,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenSize.height * 0.03),

                  //Step9

                  Container(
                    //2
                    padding: const EdgeInsets.only(left: 25),
                    alignment: Alignment.topLeft,
                    //1
                    child: const Text(
                      'Email',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),

                  // Step 10
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 29),
                    child: TextField(
                        decoration:

                        InputDecoration(
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
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: screenSize.width * 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),


                        )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //###################
                  Container(
                    padding: const EdgeInsets.only(left: 25),
                    alignment: Alignment.topLeft,
                    child: const Text(
                      'Password',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  //
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 29),
                    child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 15),

                          hintText: 'Enter  your Password',

                          hintStyle: const TextStyle(color: Colors.grey),

                          enabledBorder: OutlineInputBorder(

                            borderSide:
                            const BorderSide(color: Colors.white, strokeAlign: 2 ,width: 2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: screenSize.width * 2,
                                color: Colors.black87, strokeAlign: 2),
                            borderRadius: BorderRadius.circular(8),
                          ),


                        )),
                  ),

                  SizedBox(height: screenSize.height * 0.01),

                  Padding(
                    padding: const EdgeInsets.only(left: 18),
                    child: Row(
                      children: [
                        Checkbox(
                          // hold state Checked box
                          value: flag,

                          // invoke when user interact with checkedbox
                          onChanged: (val) {
                            // Called to update data
                            //  Rebuild Widget New State
                            setState(() {
                              // update var in new val
                              flag = val!;
                            });
                          },

                          side: const BorderSide(color: Colors.white),
                          activeColor: Colors
                              .green, // Change the color when the checkbox is checked
                          checkColor:
                          Colors.white, // Change the color of the checkmark
                        ),

                        const Text(
                          ' Remmeber Me',
                          style:  TextStyle(fontSize: 15, color: Colors.white),
                        ),

                        // SizedBox(width: screenSize.width * 0.3),
                        Flexible(
                            flex: 1,
                            child: Container()),

                        GestureDetector(
                          onTap: () {},
                          child: const Padding(
                            padding:  EdgeInsets.only(right: 25),
                            child:  Text(
                              'ForgetPassword',
                              style:  TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.white,
                                decorationThickness:
                                2.0, // Set the thickness of the underline
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenSize.height * 0.03),

                  // Step11
                  SizedBox(
                    //2
                    width:  300,
                    height: 55,
                    //1
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/HomePage");
                      },
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all(Colors.black),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(horizontal: 99, vertical: 15)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                      ),
                      child: const Text(
                        "Sign in",
                        style:  TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),

                  // Step12
                  SizedBox(height: screenSize.height * 0.03),


                  // Step13

                  const Text(
                    "By Continuing you accepting our standards terms and conditions",
                    style:  TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                        decorationColor: Colors.white,
                        decoration: TextDecoration.underline),
                  ),
                  const Text(
                    "and our privacy policy.",
                    style:  TextStyle(fontSize: 10, color: Colors.white),
                  ),

                  // Step14

              SizedBox(height: screenSize.height * 0.03),

                  // Step 15
                  Row(
                    //4
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // #1
                      const Text(
                        "Don’t have an account?  ",
                        style:  TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                      // #3
                      GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, "/signup");
                          },
                          // #2
                          child: const Text(
                            "Sign Up",
                            style:  TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ))
                    ],
                  )
                ]),
          ),
        ),
      ),
    );
  }

// ################################################
  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleSignInAccount =
      await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        // You can retrieve the user's Google information as follows
        final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
        // to Naigate in HomePage Screen
        Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()));
        // Use this information to authenticate with your backend
        print("Google User Name: ${googleSignInAccount.id}");
        // Here, you can also navigate the user to another screen or perform other actions
        await googleSignIn.signOut();
      }
    } catch (error) {
      print('Error signing in with Google: $error');
    }
  }
}
