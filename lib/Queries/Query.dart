import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:surge_2023_app/Global%20Variables/Constants.dart';
import 'package:surge_2023_app/Utils/CustomAppbar.dart';
import 'package:uuid/uuid.dart';

class Query extends StatefulWidget {
  const Query({Key? key}) : super(key: key);

  @override
  State<Query> createState() => _QueryState();
}

class _QueryState extends State<Query> {
  List<String> items = [
    'Sports',
    'Emergency',
    'Complaint',
    'Accomodation',
    'Registration',
    'General'
  ];
  String selectedValue = 'Sports'; // Set an initial value
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool loading = false;
  String? email;
  String? uid;
  final TextEditingController _descriptionController = TextEditingController();
  bool open = false;
  late FToast flutterToast;
  @override
  void initState() {
    super.initState();
    flutterToast = FToast();
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
      child: Row(
        children: [
          const Icon(Icons.done),
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
                    style: const TextStyle(color: Colors.black),
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

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // getting current user info

  void getUserInfo() {
    if (_auth.currentUser != null) {
      uid = _auth.currentUser!.uid;
      email = _auth.currentUser!.email;
    } else {
      email = "";
      uid = "";
      print("User is not logged in.");
    }
  }

  void _addQuery() {
    setState(() {
      loading = true;
    });
    getUserInfo();
    var uuid = const Uuid();
    var id = uuid.v4();
    String category = selectedValue;
    String description = _descriptionController.text;
    if (uid != "" && email != "") {
      if (category.isNotEmpty && description.isNotEmpty) {
        _firestore.collection('Queries').doc(id).set({
          'email': email,
          'category': category,
          'description': description,
          'isResolved': false,
        });

        _descriptionController.clear();
        _showToast(
          "Your Query Has Been Submitted. We will get back to you soon.",
        );
      }
    } else {
      _showToast("Please Login to Submit Your Query");
    }
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.sizeOf(context).width,
            MediaQuery.sizeOf(context).height * 0.15),
        child: const CustomAppBar(
          heading: "Query",
        ),
      ),
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
          : SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Container(
                  height: MediaQuery.sizeOf(context).height * 0.78,
                  color: Colors.black,
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.05,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: width * .08),
                          Text(
                            'Choose Category',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 23,
                            ),
                          ),
                        ],
                      ),

                      // Category DropDown
                      Padding(
                        padding: EdgeInsets.only(
                          left: MediaQuery.sizeOf(context).width * 0.08,
                          right: MediaQuery.sizeOf(context).width * 0.08,
                        ),
                        child: DropdownButtonFormField2<String>(
                          isExpanded: true,
                          decoration: const InputDecoration(
                            iconColor: AppColors.primaryColor,

                            // Add Horizontal padding using menuItemStyleData.padding so it matches
                            // the menu padding when button's width is not specified.
                            //    contentPadding: const EdgeInsets.symmetric(vertical: 16),

                            // Add more decoration..
                          ),
                          hint: Text(
                            selectedValue,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 14),
                          ),
                          value: selectedValue,
                          items: items
                              .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Center(
                                      child: Text(
                                        item,
                                        style: const TextStyle(
                                            fontSize: 14, color: Colors.white),
                                      ),
                                    ),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            //Do something when selected item is changed.
                            selectedValue = value.toString();
                          },
                          onSaved: (value) {
                            selectedValue = value.toString();
                          },
                          buttonStyleData: ButtonStyleData(
                            //width: MediaQuery.sizeOf(context).width,
                            height: MediaQuery.sizeOf(context).height * 0.07,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                color: AppColors
                                    .primaryColor, // Replace with your desired color
                                width: 1,
                              ),
                            ),
                            padding: const EdgeInsets.only(right: 8),
                          ),
                          dropdownStyleData: const DropdownStyleData(
                              decoration: BoxDecoration(color: Colors.black)),
                          iconStyleData: const IconStyleData(
                            icon: Icon(Icons.arrow_drop_down,
                                color: AppColors.primaryColor),
                            iconSize: 24,
                          ),
                          menuItemStyleData: MenuItemStyleData(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              overlayColor:
                                  MaterialStateProperty.all(Colors.black)),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.03,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: width * .085,
                          ),
                          Text(
                            'Elaborate your problem',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 23,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.015,
                      ),

                      // Description text Field
                      Center(
                        child: Container(
                          height: MediaQuery.sizeOf(context).height * 0.2,
                          width: MediaQuery.sizeOf(context).width * 0.83,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                  color: AppColors.primaryColor, width: 1)),
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: MediaQuery.sizeOf(context).width * 0.04,
                              right: MediaQuery.sizeOf(context).width * 0.08,
                            ), // Add desired padding
                            child: TextField(
                              controller: _descriptionController,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                              maxLines: null,
                              decoration: const InputDecoration(
                                enabledBorder:
                                    InputBorder.none, // Remove underline
                                focusedBorder: InputBorder
                                    .none, // Remove underline when focused
                                errorBorder: InputBorder
                                    .none, // Remove underline on error
                                disabledBorder: InputBorder.none,
                                contentPadding: EdgeInsets
                                    .zero, // Set contentPadding to zero
                                hintText: "Describe your issue",
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.15,
                      ),

                      // Submit Button
                      InkWell(
                        onTap: () {
                          // manage change password on Tap
                          _addQuery();
                        },
                        child: Container(
                          height: height * .05,
                          width: MediaQuery.sizeOf(context).width * 0.76,
                          decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                              child: Text(
                            'Submit',
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 14),
                          )),
                        ),
                      )
                    ],
                  )),
            ),
    );
  }
}
