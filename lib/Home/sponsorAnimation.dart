import 'package:flutter/material.dart';



class SponsorsAnimation extends StatefulWidget {
  @override
  _SponsorsAnimationState createState() => _SponsorsAnimationState();
}

class _SponsorsAnimationState extends State<SponsorsAnimation>
    with SingleTickerProviderStateMixin {
  double _scrollOffset = 0.0;
  double _scrollSpeed = 0.8; // You can adjust the scroll speed as needed
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5), // You can adjust the animation duration as needed
    )..addListener(() {
      setState(() {
        _scrollOffset += _scrollSpeed;
        if (_scrollOffset >= 150.0) {
          _scrollOffset = 0.0; // Reset the offset to make the images scroll continuously
        }
      });
    });

    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
     width: MediaQuery.sizeOf(context).width,
      // Adjust the height as needed
      child: ListView.builder(

        scrollDirection: Axis.horizontal,
        itemCount: 10, // Number of sponsors/images
        itemBuilder: (context, index) {

          return Transform.translate(
            offset: Offset(_scrollOffset, 0.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
            width:    MediaQuery.of(context).size.width * 0.45,
                child: Image.asset(
                  'assets/ISC.png',
                 // 'assets/sponsor_image_$index.png', // Replace with your sponsor image names
                  width: 150, // Adjust the width of each sponsor image
                  height: 100, // Adjust the height of each sponsor image
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
