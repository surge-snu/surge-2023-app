import 'package:flutter/material.dart';
import 'package:surge_2023_app/Utils/CustomAppbar.dart';

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
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.sizeOf(context).width,MediaQuery.sizeOf(context).height*0.2
      ),
        child: CustomAppBar(heading: 'Profile',),
    )
    );
  }
}
