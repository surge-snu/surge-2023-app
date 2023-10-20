import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../Global Variables/Constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> dataList = [
    {
      'asset': 'assets/sponsors/atiumSports.png',
    },
    {
      'asset': 'assets/sponsors/boat.png',
    },
    {
      'asset': 'assets/sponsors/careerLauncher.png',
    },
    {
      'asset': 'assets/sponsors/dassaultSystems.png',
    },
    {
      'asset': 'assets/sponsors/fisto.png',
    },
    {
      'asset': 'assets/sponsors/fujifilm.png',
    },
    {
      'asset': 'assets/sponsors/levo.png',
    },
    {
      'asset': 'assets/sponsors/redbull.png',
    },
    {
      'asset': 'assets/sponsors/snuxplore.png',
    },
    {
      'asset': 'assets/sponsors/spawnPoint.png',
    },
    {
      'asset': 'assets/sponsors/stag.png',
    },
    {
      'asset': 'assets/sponsors/turtlePic.png',
    },
    // Add more entries here as needed
  ];

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Center(
            child: Container(
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/ISC.png',
                      height: MediaQuery.sizeOf(context).height * 0.2,
                      width: 600,
                    ),
                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
                    const Text(
                      'Our Sponsors',
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.55,
                      child: GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.all(10.0),
                        itemCount: dataList.length,
                        controller: scrollController,
                        itemBuilder: (ctx, i) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(dataList[i]['asset']),
                          );
                        },
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: MediaQuery.of(context).size.width /
                              (MediaQuery.of(context).size.height / 2.5),
                          crossAxisSpacing: 4,
                          mainAxisSpacing: 4,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
