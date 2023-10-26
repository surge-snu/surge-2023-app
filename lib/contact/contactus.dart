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
          child: CustomAppBar(
            heading: 'Contact Us',
          ),
        ),
        body: GetBuilder<DropDownController>(

          builder: (dropdowncontroller) {
            return Container(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: width * .08,
                      right: width * .08,
                      top: height * .03,
                      bottom: height * .03),
                  child:
                      Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                    SizedBox(
                      height: height * .025,
                    ),
                    CustomDropDown(

                        maincolor: Color(0xffF51940),
                        mainText: 'Emergency',
                        name1: "Hospital (On campus)",
                        con1: "9110449419",
                        name3: "Closest Police Station",
                        con3: "9110449419",
                        name2: "Fire Brigade",
                        con2: "9110449419",
                        mainIcon: Icons.add),
                    SizedBox(
                      height: height * .03,
                    ),
                    CustomDropDown(

                        maincolor: AppColors.primaryColor,
                        mainText: 'Organizing Team',
                        name1: "Pavan Reddy",
                        con1: "8143595998",
                        name3: "Krishna",
                        con3: "9940347380",
                        name2: "Dwiti Modi",
                        con2: "9316244424",
                        mainIcon: Icons.people_alt_rounded),
                    SizedBox(
                      height: height * .03,
                    ),
                    CustomDropDown(

                        maincolor: AppColors.primaryColor,
                        mainText: 'Point of Contact',
                        name1: "Akshita Jakhar",
                        con1: "8448585442",
                        name3: "Prabhav Pandey",
                        con3: "9110449419",
                        name2: "Nandini Bhusri",
                        con2: "9911596623",
                        mainIcon: Icons.person),
                  ]),
                ),
              ),
            );
          }
        ));
  }
}


class CustomDropDownState {
  bool isOpen = false;
}
