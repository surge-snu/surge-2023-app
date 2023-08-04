import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:surge_2023_app/Auth/changePassword.dart';
import 'package:surge_2023_app/Utils/CustomAppbar.dart';

import '../Global Variables/Constants.dart';
import '../Utils/Navigator.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: Stack(
        children: [
      Positioned(
        left: 0,
        right: 0,
        top: 2,
        child: Stack(
          children:[ Container(
        //  height: MediaQuery.sizeOf(context).height*0.3,
          child: Stack(
            children: [
              Column(
                children: [
                  Image.asset('assets/appbarback.png'),
                  Image.asset('assets/profile_bar.png'),
                ],
              ),
              Positioned(
                  left: 10,
                  top: 40,
                  child: Row(
                    children: [
                      InkWell(
                          onTap:(){
                            print('navigating');

                            Navigator.push(context, MaterialPageRoute(builder: (c)=>NavBar(passedIndex: 0)));


                            print('navigated');
                          },

                          child: Icon(Icons.keyboard_arrow_left_rounded,color: AppColors.primaryColor,size: 45,)),
                      SizedBox(width: 10,),
                      Text('Profile',style: TextStyle(color: AppColors.primaryColor,fontSize: 30,fontWeight: FontWeight.w700),)
                    ],
                  ))
            ],
          ),
    ),]
        ),
      ),




          Positioned(

            top:150,
             left: 110,
            right: 110,
            child: Container(
              width: 130,
              height: 130,
              decoration: const ShapeDecoration(
                color: Colors.white,
                shape: CircleBorder(
                  side: BorderSide(
                    width: 2.5,
                    color: Color(0xFFE2E1FA),
                    style: BorderStyle.solid,
                  ),
                ),
              ),

            ),
          ),


          Positioned(
              top: 300,
 left: 70,
              right:70,
              child: Center(
                child: Container(
            height: MediaQuery.sizeOf(context).height*0.78,
            color: Colors.black,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Your Name',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 23),),
SizedBox(height: MediaQuery.sizeOf(context).height*0.01,),
                      Text('Shiv Nadar University',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 23),),
                      SizedBox(height: MediaQuery.sizeOf(context).height*0.05,),
                      Text('Payment Status',style: TextStyle(color: AppColors.primaryColor ,fontWeight: FontWeight.w600,fontSize: 25),),
                      SizedBox(height: MediaQuery.sizeOf(context).height*0.01,),
                      Text('Under Process',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 23),),
                      SizedBox(height: MediaQuery.sizeOf(context).height*0.03,),
                      Text('Accomodation',style: TextStyle(color: AppColors.primaryColor ,fontWeight: FontWeight.w600,fontSize: 25),),
                      SizedBox(height: MediaQuery.sizeOf(context).height*0.01,),
                      Text('3 Nights',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 23),),
                      SizedBox(height: MediaQuery.sizeOf(context).height*0.05,),

                      InkWell(
                        onTap: (){
                          // manage change password on Tap
                          Get.to(()=>ChangePassword());
                        },
                        child: Container(
                          height: 40,
                          width: MediaQuery.sizeOf(context).width*0.76,
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(15)
                          ),
                     child: Center(child: Text('Change Password',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 14),)),
                        ),
                      )
                    ],
                  ),
          ),
              ))
        ],
      ),
    );
  }
}
