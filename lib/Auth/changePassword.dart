import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:surge_2023_app/Auth/login.dart';
import 'package:surge_2023_app/Utils/CustomAppbar.dart';

import '../Global Variables/Constants.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  late FToast  flutterToast;
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
  
  bool loading = false;
  final _emailController = TextEditingController();

  Future<void> _resetPassword() async {
  
      try {
setState(() {
  loading = true;
});
        await FirebaseAuth.instance.sendPasswordResetEmail(
          email: _emailController.text,
        );
setState(() {
  loading = false;
});
Navigator.pushReplacement(context, new MaterialPageRoute(builder: (_)=>LoginScreen()));
      _showToast("Verfication link sent to your email, check your spam folder too !");
      } catch (error) {
        setState(() {
          loading = false;
        });

        _showToast("Something went wrong : Check your internet connection");
      }
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar:PreferredSize(
        child: CustomAppBar(heading: "Change Password"),
        preferredSize: Size(MediaQuery.sizeOf(context).width,MediaQuery.sizeOf(context).height*0.15),
      ),
      body: loading?Center(
        child: Container(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.1),
          child: const CircularProgressIndicator(
            color: AppColors.primaryColor,
          ),
        ),
      ):SingleChildScrollView(

        child: Center(
          child: Container(
           height: MediaQuery.sizeOf(context).height*0.78,
            color: Colors.black,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.sizeOf(context).height*0.05,),
                Image.asset('assets/changePassword.png',height: MediaQuery.sizeOf(context).height*0.28,width: MediaQuery.sizeOf(context).width*0.88,),

                SizedBox(height: MediaQuery.sizeOf(context).height*0.05,),
                Text('Enter Your Registered Email ',style: TextStyle(color: AppColors.primaryColor ,fontWeight: FontWeight.w600,fontSize: 20),),
                SizedBox(height: MediaQuery.sizeOf(context).height*0.03,),

                Container(
                  margin: EdgeInsets.only(left: MediaQuery.sizeOf(context).width*0.12,right: MediaQuery.sizeOf(context).width*0.12),
                  height: 40,
                  width: MediaQuery.sizeOf(context).width*0.76,
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
                SizedBox(height: MediaQuery.sizeOf(context).height*0.02,),
                Padding(
                  padding: EdgeInsets.only(left:MediaQuery.sizeOf(context).width*0.15,right:MediaQuery.sizeOf(context).width*0.15),
                  child: Text('We Will Send a verification link to your email , you will be there redirected to change your password ',style: TextStyle(color: AppColors.primaryColor ,fontWeight: FontWeight.w400,fontSize: 13),),
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height*0.1,),


                // OtpTextField(
                //   numberOfFields: 4,
                //   borderColor: AppColors.primaryColor,
                //   focusedBorderColor:  Colors.white,
                //   disabledBorderColor: AppColors.primaryColor,
                //   enabledBorderColor: AppColors.primaryColor,
                //   borderRadius: BorderRadius.circular(15),
                //   textStyle: TextStyle(color: Colors.white),
                //   //set to true to show as box or false to show as dash
                //   showFieldAsBox: true,
                //   //runs when a code is typed in
                //   onCodeChanged: (String code) {
                //     //handle validation or checks here
                //   },
                //   //runs when every textfield is filled
                //   onSubmit: (String verificationCode){
                //    // enter on submitted
                //   }, // end onSubmit
                // ),
                // SizedBox(height: MediaQuery.sizeOf(context).height*0.15,),
                InkWell(
                  onTap: (){
                    // manage change  on Tap
_resetPassword();
                  },
                  child: Container(
                    height: 40,
                    width: MediaQuery.sizeOf(context).width*0.76,
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Center(child: Text('Verify',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 14),)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
