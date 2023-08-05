import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:surge_2023_app/Map/mapSnuExplore.dart';
import 'package:surge_2023_app/Profile/profile.dart';
import 'package:surge_2023_app/Queries/Query.dart';
import 'package:surge_2023_app/contact/contactus.dart';
import 'package:url_launcher/url_launcher.dart';

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
  // Function to open the URL


  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

      setState(() {
        widget.passedIndex = index;
      });

  }

  final screens = [
   // const HomePage(),
    const Query(),
    const Profile(),
    const MapExplore(),
    const ContactUs(),
  ];

  @override
  Widget build(BuildContext context) {
    print('passed ${widget.passedIndex}');
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: screens[_selectedIndex],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15),
        child: Container(

            height: 100,
            width: MediaQuery.of(context).size.width,
            // padding: EdgeInsets.only(left: 6,right: 6),
            //  margin: EdgeInsets.only(left: 17,right: 17),
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.primaryColor, width: 2.9)),
            child: Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: BottomNavigationBar(
                iconSize: 30,
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.black,
                selectedItemColor: Colors.white,
                unselectedItemColor: AppColors.primaryColor,
                currentIndex: _selectedIndex,
                onTap: _onItemTapped,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.message,
                    ),
                    label: 'QUERIES',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.person,
                    ),
                    label: 'PROFILE',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.assistant_navigation,
                    ),
                    label: 'MAP',
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.call,
                      ),
                      label: 'CONTACT')
                ],
              ),
            )),
      ),
    );
  }
}
