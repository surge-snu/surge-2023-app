import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:surge_2023_app/Global%20Variables/Constants.dart';
import 'package:surge_2023_app/Home/HomePage.dart';
import 'package:surge_2023_app/Utils/Navigator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _phoneNumberController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Column(
          children: [

            SizedBox(height: 90,),
            Container(height: 60,width: 360,

            child: Center(
              child: Text("Login",style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.w900,fontFamily: 'Poppins'),),
            ),),
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
                  keyboardType: TextInputType.number,
                  controller: _phoneNumberController,



                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                    fillColor: AppColors.primaryColor,
                    filled: true,
                    // errorStyle: TextStyle(height: 0.5),
                    hintStyle: TextStyle(color: Color(0xB310100E)),
                    hintText: 'user name',
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
            InkWell(
              onTap: (){

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
            SizedBox(height: 35,),
            InkWell(
                onTap: (){
Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>NavBar(passedIndex: 0)));
                },
                child: Text("Continue as guest",style: GoogleFonts.poppins(textStyle: TextStyle(decoration:TextDecoration.underline,color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400))))

          ],
        ),
      ),
    );
  }
}
