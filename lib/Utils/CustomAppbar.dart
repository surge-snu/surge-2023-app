
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:surge_2023_app/Global%20Variables/Constants.dart';
import 'package:surge_2023_app/Utils/Navigator.dart';

class CustomAppBar extends StatefulWidget {
  final String heading;
  const CustomAppBar({Key? key, required this.heading}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height*0.15,
      child: Stack(
        children: [
          Image.asset('assets/appbarback.png'),
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
              Text(widget.heading,style: TextStyle(color: AppColors.primaryColor,fontSize: 30,fontWeight: FontWeight.w700),)
            ],
          ))
        ],
      ),
    );
  }
}
