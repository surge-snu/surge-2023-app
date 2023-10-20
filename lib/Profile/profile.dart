import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:surge_2023_app/Auth/changePassword.dart';
import 'package:surge_2023_app/Auth/login.dart';
import 'package:surge_2023_app/Utils/CustomAppbar.dart';

import '../Global Variables/Constants.dart';
import '../Utils/Navigator.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('Users');
  late FToast flutterToast;
  bool loading = false;
  String name = "Name";
  String email = "xyz@gmail.com";
  String university = "University";
  String phoneNumber = "000000";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    flutterToast = FToast();
    // if you want to use context from globally instead of content we need to pass navigatorKey.currentContext!
    flutterToast.init(context);
    fetchUserData();
  }

  _showToast(String s) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.greenAccent,
      ),
      child: Row(
        children: [
          const Icon(Icons.mail),
          const SizedBox(width: 6.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width, // Adjust as needed
                  child: Text(
                    s, // Your text here
                    maxLines: 5,
                    style: GoogleFonts.poppins(color: Colors.black),
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
      toastDuration: const Duration(seconds: 5),
    );

    // Custom Toast Position
    flutterToast.showToast(
        child: toast,
        toastDuration: const Duration(seconds: 5),
        positionedToastBuilder: (context, child) {
          return Positioned(
            top: 16.0,
            left: 16.0,
            child: child,
          );
        });
  }

  Future<void> fetchUserData() async {
    setState(() {
      loading = true;
    });

    try {
      String? uid = FirebaseAuth.instance.currentUser?.uid;

      if (uid != null) {
        DocumentSnapshot userDocument = await usersCollection.doc(uid).get();

        if (userDocument.exists) {
          Map<String, dynamic> data =
              userDocument.data() as Map<String, dynamic>;

          // Process data as needed
          name = data['name'];
          email = data['email'];
          phoneNumber = data['phoneNumber'];
          university = data['university'];

          print(
              'Name: $name, Email: $email, Phone: $phoneNumber, University: $university');
        } else {
          print('User document does not exist');
        }
      } else {
        print('User is not signed in');
      }

      setState(() {
        loading = false;
      });
    } catch (e) {
      setState(() {
        loading = false;
      });
      _showToast("Error fetching data");
      print('Error fetching data: $e');
    }
  }

  Future<void> logoutUser() async {
    await FirebaseAuth.instance.signOut().then((value) async {
      //delete uid from getstorage.

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('LogedIn', false);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
        (route) => false, // Remove all routes until now.
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: loading
          ? Center(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.1),
                child: const CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              ),
            )
          : Stack(
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  top: 2,
                  child: Stack(children: [
                    Stack(
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
                                    onTap: () {
                                      print('navigating');

                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (c) =>
                                              NavBar(passedIndex: 0),
                                        ),
                                      );

                                      print('navigated');
                                    },
                                    child: const Icon(
                                      Icons.keyboard_arrow_left_rounded,
                                      color: AppColors.primaryColor,
                                      size: 45,
                                    )),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Profile',
                                  style: GoogleFonts.poppins(
                                      color: AppColors.primaryColor,
                                      fontSize: 30,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ))
                      ],
                    ),
                  ]),
                ),
                Positioned(
                  top: 150,
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
                    child: Image.asset('assets/user.png'),
                  ),
                ),
                Positioned(
                    top: 300,
                    left: 70,
                    right: 70,
                    child: Center(
                      child: Container(
                        height: MediaQuery.sizeOf(context).height * 0.78,
                        color: Colors.black,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              name,
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 23),
                            ),

                            Text(
                              university,
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 23),
                            ),
                            SizedBox(
                              height: MediaQuery.sizeOf(context).height * 0.04,
                            ),
                            SizedBox(
                              height: MediaQuery.sizeOf(context).height * 0.1,
                            ),
                            InkWell(
                              onTap: () {
                                // manage change password on Tap
                                logoutUser();
                              },
                              child: Container(
                                height: 40,
                                width: MediaQuery.sizeOf(context).width * 0.76,
                                decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Center(
                                    child: Text(
                                  'Logout',
                                  style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14),
                                )),
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
