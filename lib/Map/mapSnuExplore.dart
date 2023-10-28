import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Global Variables/Constants.dart';

class MapExplore extends StatefulWidget {
  const MapExplore({Key? key}) : super(key: key);

  @override
  State<MapExplore> createState() => _MapExploreState();
}

class _MapExploreState extends State<MapExplore> {
  String websiteURL = 'https://snuxplore.com/';
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'SNUxplore - SNU\'s Navigation Guide',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: AppColors.primaryColor,
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 26,
            ),
            InkWell(
              onTap: () async {
                try {
                  await _openURL(websiteURL);
                } catch (e) {
                  print('Error opening URL: $e');
                }
              },
              child: Container(
                height: 40,
                width: MediaQuery.sizeOf(context).width * 0.76,
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(15)),
                child: const Center(
                    child: Text(
                  'SnuXplore',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 14),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
