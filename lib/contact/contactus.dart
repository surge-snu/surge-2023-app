import 'package:flutter/material.dart';
import 'package:surge_2023_app/Global%20Variables/Constants.dart';
import 'package:surge_2023_app/Utils/CustomAppbar.dart';
import 'package:surge_2023_app/contact/custom_button.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.sizeOf(context).width,MediaQuery.sizeOf(context).height*0.15),
        child: CustomAppBar(heading: 'Contact Us',),
      ),
      body: Container(

        child: const Padding(
          padding: EdgeInsets.only(left: 8.0,right: 8,top: 17),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start ,
            children:[ CustomDropDown(maincolor: Color(0xffF51940),mainText: 'Emergency',mainIcon: Icons.add),
              SizedBox(height: 14,),
              CustomDropDown(maincolor: AppColors.primaryColor,mainText: 'Organizing Team',mainIcon: Icons.people_alt_rounded),
              SizedBox(height: 14,),
              CustomDropDown(maincolor: AppColors.primaryColor,mainText: 'Point of Contact',mainIcon: Icons.person),
            ]
          ),
        ),
      )
    );
  }
}
