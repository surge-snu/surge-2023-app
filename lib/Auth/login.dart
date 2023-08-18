import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:surge_2023_app/Auth/signUp.dart';
import 'package:surge_2023_app/Global%20Variables/Constants.dart';
import 'package:surge_2023_app/Home/HomePage.dart';
import 'package:surge_2023_app/Utils/Navigator.dart';

import 'changePassword.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  late FToast  flutterToast;

  bool loading = false;
  @override
  void initState() {
    super.initState();
    flutterToast= FToast();
    // if you want to use context from globally instead of content we need to pass navigatorKey.currentContext!
    flutterToast.init(context);
  }


  _showToast(String s) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.greenAccent,
      ),
      child:Row(
        children: [
          Icon(Icons.mail),
          SizedBox(width: 6.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width, // Adjust as needed
                  child: Text(
                    s, // Your text here
                    maxLines: 5,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

    );


    flutterToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 5),
    );

    // Custom Toast Position
    flutterToast.showToast(
        child: toast,
        toastDuration: Duration(seconds: 5),
        positionedToastBuilder: (context, child) {
          return Positioned(
            child: child,
            top: 16.0,
            left: 16.0,
          );
        });
  }

  Future<void> setLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('LogedIn', true);
  }

  Future<void> loginUser() async {
    try {
      setState(() {
        loading= true;
      });
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text, // Use email as the username
        password: _passwordController.text,
      );

      // Check if the user's email is verified
      if (userCredential.user != null && userCredential.user!.emailVerified) {
        // Successfully logged in and email is verified
        setLoggedIn();

        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => NavBar(passedIndex: 0)));
        setState(() {
          loading= false;
        });
      } else {
        // Email is not verified

        _showToast("Please verify your email before logging in.");
        setState(() {
          loading= false;
        });
      }

    } catch (e) {
      print("Error during login: $e");
      _showToast("Login failed. Please check your credentials.");
      setState(() {
        loading= false;
      });

    }
  }



  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: loading?Center(
        child: Container(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.1),
          child: const CircularProgressIndicator(
            color:Colors.black
          ),
        ),
      ):SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Center(
          child: Column(
            children: [

              SizedBox(height: 90,),
              Container(height: 60,width: 360,

              child: Center(
                child: Text("Login",style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.w900,fontFamily: 'Poppins'),),
              ),),
              SizedBox(height: 45,),

              // Email Field
              Container(
                margin: EdgeInsets.only(left: 55,right: 55),
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  border: Border.all(
                    width: 2,
                      color: Colors.black),
                  borderRadius:
                  BorderRadius.circular(25),

                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: TextFormField(

                    controller: _emailController,



                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                      fillColor: AppColors.primaryColor,
                      filled: true,
                      // errorStyle: TextStyle(height: 0.5),
                      hintStyle: TextStyle(color: Color(0xB310100E)),
                      hintText: 'Email',
                      border: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.circular(25),
                          borderSide:  BorderSide.none

                      ),
                    ),
                  ),
                ),
              ),
SizedBox(height: 35,),

              // Password Text Field
              Container(
                margin: EdgeInsets.only(left: 55,right: 55),
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  border: Border.all(
                    width: 2,
                      color: Colors.black),
                  borderRadius:
                  BorderRadius.circular(25),

                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: TextFormField(

                    controller: _passwordController,



                    textAlign: TextAlign.left,
                    obscureText: true,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                      fillColor: AppColors.primaryColor,
                      filled: true,

                      hintStyle: TextStyle(color: Color(0xB310100E)),
                      hintText: 'password',
                      border: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.circular(25),
                          borderSide:  BorderSide.none

                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 35,),

// Login Button
              InkWell(
                onTap: (){
loginUser();
                },
                child: Container(
                  margin: EdgeInsets.only(left: 55,right: 55),
                  height: 40,
                  width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black,

                      borderRadius:
                      BorderRadius.circular(25),

                    ),
                  child: Center(child: Text("Log In",style: GoogleFonts.poppins(textStyle: TextStyle(decoration:TextDecoration.underline
                      ,color: AppColors.primaryColor,fontSize: 20,fontWeight: FontWeight.w400)))),

                ),
              ),
              SizedBox(height: 25,),
              // Change Password  Button
              InkWell(
                onTap: (){
                  Get.to(()=>ChangePassword());
                },
                child: Container(
                  margin: EdgeInsets.only(left: 55,right: 55),
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black,

                    borderRadius:
                    BorderRadius.circular(25),

                  ),
                  child: Center(child: Text("Forgot Password",style: GoogleFonts.poppins(textStyle: TextStyle(decoration:TextDecoration.underline
                      ,color: AppColors.primaryColor,fontSize: 20,fontWeight: FontWeight.w400)))),

                ),
              ),
              SizedBox(height: 25,),
              //Sign Up Button
              InkWell(
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>SignUpScreen()));
                  },
                  child: Text("SignUp",style: GoogleFonts.poppins(textStyle: TextStyle(decoration:TextDecoration.underline,color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400)))),
              SizedBox(height: 25,),
              // Continue as guest button
              InkWell(
                  onTap: (){
Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>NavBar(passedIndex: 0)));
                  },
                  child: Text("Continue as guest",style: GoogleFonts.poppins(textStyle: TextStyle(decoration:TextDecoration.underline,color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400)))),

            ],
          ),
        ),
      ),
    );
  }
}
