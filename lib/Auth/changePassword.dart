import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:surge_2023_app/Utils/CustomAppbar.dart';

import '../Global Variables/Constants.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar:PreferredSize(
        child: CustomAppBar(heading: "Change Password"),
        preferredSize: Size(MediaQuery.sizeOf(context).width,MediaQuery.sizeOf(context).height*0.15),
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
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
                Text('Enter the OTP sent to your registered email',style: TextStyle(color: AppColors.primaryColor ,fontWeight: FontWeight.w400,fontSize: 13),),
                SizedBox(height: MediaQuery.sizeOf(context).height*0.05,),
                OtpTextField(
                  numberOfFields: 4,
                  borderColor: AppColors.primaryColor,
                  focusedBorderColor:  Colors.white,
                  disabledBorderColor: AppColors.primaryColor,
                  enabledBorderColor: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(15),
                  textStyle: TextStyle(color: Colors.white),
                  //set to true to show as box or false to show as dash
                  showFieldAsBox: true,
                  //runs when a code is typed in
                  onCodeChanged: (String code) {
                    //handle validation or checks here
                  },
                  //runs when every textfield is filled
                  onSubmit: (String verificationCode){
                   // enter on submitted
                  }, // end onSubmit
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height*0.15,),
                InkWell(
                  onTap: (){
                    // manage change  on Tap

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
