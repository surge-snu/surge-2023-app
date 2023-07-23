import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:surge_2023_app/Auth/login.dart';
import 'package:surge_2023_app/Global%20Variables/Constants.dart';
import 'package:surge_2023_app/Home/HomePage.dart';

class NavBar extends StatefulWidget {
  int passedIndex;
   NavBar({Key? key, required this.passedIndex}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex=0;
  final screens = [
    const HomePage(),
    const LoginScreen()
    // const MyHomePage(),
    // const QuestionPage(),
    // const Announcmentpage(),
    // const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: MediaQuery.of(context).size.height,

            child: screens[widget.passedIndex],
          ),


      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 15.0,right: 15),
        child: Container(
margin: EdgeInsets.only(top: 50),
          height: 100,
          width: MediaQuery.of(context).size.width,
         // padding: EdgeInsets.only(left: 6,right: 6),
        //  margin: EdgeInsets.only(left: 17,right: 17),
          decoration: BoxDecoration(

            color: Colors.black,
            borderRadius: BorderRadius.circular(12),

            border: Border.all(color: AppColors.primaryColor,
            width: 2.9)
          ),
          child: Padding(
            padding:  EdgeInsets.only(top: 13.0),
            child: BottomNavigationBar(
              selectedItemColor: Colors.white,

              iconSize: 30,
              unselectedItemColor: AppColors.primaryColor,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.black,
              onTap: (index){
                setState(() {
                  widget.passedIndex=index;
                });

              },
items: [
  BottomNavigationBarItem(icon: Icon(Icons.message,),label: 'QUERIES'),
  BottomNavigationBarItem(icon: Icon(Icons.person,),label: 'PROFILE'),
  BottomNavigationBarItem(icon: Icon(Icons.assistant_navigation,),label: 'MAP'),
  BottomNavigationBarItem(icon: Icon(Icons.call,),label: 'CONTACT')

],
            ),
          )
        ),
      ),
    );
  }
}
