import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:surge_2023_app/Global%20Variables/Constants.dart';
import 'package:surge_2023_app/Utils/CustomAppbar.dart';
import 'package:surge_2023_app/contact/contactresponse.dart';
import 'package:surge_2023_app/contact/custom_button.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final dropDownController = Get.put(DropDownController());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    DropDownController dropDownController = Get.find();
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: PreferredSize(
          preferredSize: Size(MediaQuery.sizeOf(context).width,
              MediaQuery.sizeOf(context).height * 0.15),
          child: const CustomAppBar(
            heading: 'Contact Us',
          ),
        ),
        body: GetBuilder<DropDownController>(builder: (dropdowncontroller) {
          return Container(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                    left: width * .08,
                    right: width * .08,
                    top: height * .03,
                    bottom: height * .03),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height * .025,
                      ),
                      const CustomDropDown(
                        maincolor: Color(0xffF51940),
                        mainText: 'Emergency',
                        name1: "Hospital (On campus)",
                        con1: "7737550092",
                        name3: "Closest Police Station",
                        con3: "8595902549",
                        sub1: "Blue Circle",
                        sub3: "Dadri Police Station",
                        mainIcon: Icons.add,
                      ),
                      SizedBox(
                        height: height * .03,
                      ),
                      const CustomDropDown(
                        maincolor: AppColors.primaryColor,
                        mainText: 'Organizing Team',
                        name1: "Akshita Jakhar",
                        con1: "8448585442",
                        name3: "Prabhav Pandey",
                        con3: "9110449419",
                        name2: "Nandini Bhusri",
                        con2: "9911596623",
                        sub1: "Chairperson",
                        sub2: "Co-chairperson",
                        sub3: "Co-chairoerson",
                        mainIcon: Icons.person,
                      ),
                      SizedBox(
                        height: height * .03,
                      ),
                      const CustomDropDown(
                        maincolor: AppColors.primaryColor,
                        mainText: 'Point Of Contact',
                        name1: "Pavan Reddy",
                        con1: "8143595998",
                        name3: "Krishna",
                        con3: "9940347380",
                        name2: "Dwiti Modi",
                        con2: "9316244424",
                        sub1: "Accomodation Head (Male)",
                        sub2: "Accomodation Head (Female)",
                        sub3: "Sports Management Head",
                        mainIcon: Icons.people_alt_rounded,
                      ),
                    ]),
              ),
            ),
          );
        }));
  }
}

class CustomDropDownState {
  bool isOpen = false;
}
