import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Global Variables/Constants.dart';

class MapExplore extends StatefulWidget {
  const MapExplore({Key? key}) : super(key: key);

  @override
  State<MapExplore> createState() => _MapExploreState();
}

class _MapExploreState extends State<MapExplore> {
  String websiteURL =
      'https://snuxplore.com/';
  Future<void> _openURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  void initState() {
    // TODO: implement initState


    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:   Center(
        child: InkWell(
          onTap: () async {
            try {
           await   _openURL(websiteURL);
            }catch(e){
              print('Error opening URL: $e');
            }
          },
          child: Container(
            height: 40,
            width: MediaQuery.sizeOf(context).width*0.76,
            decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(15)
            ),
            child: Center(child: Text('Snu Explore',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 14),)),
          ),
        ),
      ),
    );
  }
}
