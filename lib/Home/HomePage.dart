import 'package:flutter/material.dart';
import 'package:surge_2023_app/Home/sponsorAnimation.dart';

import '../Global Variables/Constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> dataList = [
    {
      'name': 'John',
      'title': 'Engineer',
      'score': 85,
    },
    {
      'name': 'Alice',
      'title': 'Designer',
      'score': 90,
    },
    {
      'name': 'Bob',
      'title': 'Developer',
      'score': 78,
    },
    // Add more entries here as needed
  ];



  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          color: Colors.black,
          child: Padding(
            padding: EdgeInsets.only(left: 18.0,right: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/ISC.png',
                  height: 270,
                  width: 600,
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
                const Text(
                  'Recent Updates',
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 25,
                  ),
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
             Stack(
               children: [
                 Container(
                   height:  MediaQuery.of(context).size.height*0.25,
                  width:   MediaQuery.of(context).size.width*0.9,
                   child: ListView.builder(
                     controller: _scrollController,
                     scrollDirection: Axis.horizontal,

    shrinkWrap:  true,
    itemCount:11, itemBuilder: (con, index){
      return Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
        height: MediaQuery.of(context).size.height*0.1,
        width: MediaQuery.of(context).size.width*0.38,
    decoration: BoxDecoration(
      color: Colors.white10,
      borderRadius: BorderRadius.circular(15),
      border:  Border.all(
        color: AppColors.primaryColor,
        width: 2
      )
    ),
child: Padding(

  padding: const EdgeInsets.only(left: 18.0,top: 18),
  child:   Column(
mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

      Text('Cricket',style: TextStyle(
          color: AppColors.primaryColor,fontWeight: FontWeight.w700,fontSize: 16,fontStyle: FontStyle.italic),),
       SizedBox(height: MediaQuery.sizeOf(context).height*0.03,),
      Text('Shiv Nadar University',style: TextStyle(
          color: Colors.white,fontWeight: FontWeight.w400,fontSize: 12,),),
      SizedBox(height: MediaQuery.sizeOf(context).height*0.007,),
      Text('147-10',style: TextStyle(
        color: Colors.white,fontWeight: FontWeight.w700,fontSize: 14,),),
      SizedBox(height: MediaQuery.sizeOf(context).height*0.005,),
      Text('20 .0',style: TextStyle(
        color: Colors.white,fontWeight: FontWeight.w400,fontSize: 9,),),

      SizedBox(height: MediaQuery.sizeOf(context).height*0.03,),
      Text('Ashoka University',style: TextStyle(
        color: Colors.white,fontWeight: FontWeight.w400,fontSize: 12,),),
      SizedBox(height: MediaQuery.sizeOf(context).height*0.007,),
      Text('147-10',style: TextStyle(
        color: Colors.white,fontWeight: FontWeight.w700,fontSize: 14,),),
      SizedBox(height: MediaQuery.sizeOf(context).height*0.005,),
      Text('20 .0',style: TextStyle(
        color: Colors.white,fontWeight: FontWeight.w400,fontSize: 9,),),
    ],

  ),
),
        ),
      );

                   },

            ),
                 ),

                 Positioned(
                   left: MediaQuery.sizeOf(context).width*0.8,
                   top: MediaQuery.sizeOf(context).width*0.19,
                   child: IconButton(
                     icon: Icon(Icons.arrow_forward_ios,color: AppColors.primaryColor,size: 40,),
                     onPressed: () {
                       _scrollController.animateTo(
                         _scrollController.offset + 100, // You can adjust the scroll distance here
                         curve: Curves.easeInOut,
                         duration: Duration(milliseconds: 200),
                       );
                     },
                   ),
                 ),
               ],
             ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
                const Text(
                  'Our Sponsors',
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 25,
                  ),
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
                SponsorsAnimation()
            ]
          ),
        ),
      ),
    )
    );

  }
}

