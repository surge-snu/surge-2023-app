import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:surge_2023_app/Auth/login.dart';
import 'package:surge_2023_app/Global%20Variables/Constants.dart';
import 'package:surge_2023_app/Home/HomePage.dart';
import 'package:surge_2023_app/Utils/Navigator.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _universityController = TextEditingController();
  late FToast  flutterToast;
bool loading = false;
  @override
  void initState() {
    super.initState();
    flutterToast= FToast();
    // if you want to use context from globally instead of content we need to pass navigatorKey.currentContext!
    flutterToast.init(context);
  }
// function to show toast message for verification link
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
  // Function to create a new user in Firebase Authentication and store additional info in Firestore
  Future<void> signUpAndStoreUserData() async {
    setState(() {
      loading= true;
    });
    try {
      // Create a new user in Firebase Authentication
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      // Send email verification link
      await userCredential.user!.sendEmailVerification();

      // Get the newly created user's UID
      String userId = userCredential.user!.uid;

      // Store additional user data in Firestore
      await FirebaseFirestore.instance.collection('Users').doc(userId).set({
        'name': _nameController.text,
        'email': _emailController.text,
        'phoneNumber': _phoneNumberController.text,
        'university': _universityController.text,
      });

      // Navigate to the home screen or perform other actions
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LoginScreen()));
    } catch (e) {
      // Handle errors
      _showToast(e.toString());
      print(e);
    }
    setState(() {
      // Show a toast message
      _showToast("Verification link has been sent to your email");
      loading=false;
    });
  }




  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: AppColors.primaryColor,
      body:loading?Center(
    child: Container(
    padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.1),
    child: const CircularProgressIndicator(
    color: Colors.black,
    ),
    ),
    ): SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Center(
          child: Column(
            children: [

              SizedBox(height: 90,),
              Container(height: 60,width: 360,

                child: Center(
                  child: Text("Sign Up",style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.w900,fontFamily: 'Poppins'),),
                ),),

              // Name text filed
              SizedBox(height: 45,),
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
                    controller: _nameController,



                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                      fillColor: AppColors.primaryColor,
                      filled: true,
                      // errorStyle: TextStyle(height: 0.5),
                      hintStyle: TextStyle(color: Color(0xB310100E)),
                      hintText: 'Name',
                      border: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.circular(25),
                          borderSide:  BorderSide.none

                      ),
                    ),
                  ),
                ),
              ),

              // Phone Number text field
              SizedBox(height: 25,),
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
                    keyboardType: TextInputType.number,
                    controller: _phoneNumberController,



                    textAlign: TextAlign.left,
                    decoration: InputDecoration(

                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                      fillColor: AppColors.primaryColor,
                      filled: true,
                      // errorStyle: TextStyle(height: 0.5),
                      hintStyle: TextStyle(color: Color(0xB310100E)),

                      hintText: 'Phone Number',
                      border: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.circular(25),
                          borderSide:  BorderSide.none

                      ),
                    ),
                  ),
                ),
              ),


              // University  text filed
              SizedBox(height: 25,),
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

                    controller: _universityController,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                      fillColor: AppColors.primaryColor,
                      filled: true,
                      // errorStyle: TextStyle(height: 0.5),
                      hintStyle: TextStyle(color: Color(0xB310100E)),
                      hintText: 'University',
                      border: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.circular(25),
                          borderSide:  BorderSide.none

                      ),
                    ),
                  ),
                ),
              ),


              // Email text filed
              SizedBox(height: 25,),
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


              // password text fild
              SizedBox(height: 25,),
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
                      hintText: 'Password',
                      border: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.circular(25),
                          borderSide:  BorderSide.none

                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25,),


              // Signup Button
              InkWell(
                onTap: (){
                  signUpAndStoreUserData(); // Call the new function when Sign Up button is tapped
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
                  child: Center(child: Text("Sign Up",style: GoogleFonts.poppins(textStyle: TextStyle(decoration:TextDecoration.underline
                      ,color: AppColors.primaryColor,fontSize: 20,fontWeight: FontWeight.w400)))),

                ),
              ),
              SizedBox(height: 35,),

              // COntinue as Guest Button
              InkWell(
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>NavBar(passedIndex: 0)));
                  },
                  child: Text("Continue as guest",style: GoogleFonts.poppins(textStyle: TextStyle(decoration:TextDecoration.underline,color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400))))

            ],
          ),
        ),
      ),
    );
  }
}
