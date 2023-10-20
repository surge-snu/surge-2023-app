import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:surge_2023_app/Global%20Variables/Constants.dart';

class CustomDropDown extends StatefulWidget {
  final Color maincolor;
  final String mainText;
  final IconData mainIcon;
  const CustomDropDown(
      {Key? key,
      required this.maincolor,
      required this.mainText,
      required this.mainIcon})
      : super(key: key);

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  bool open = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Center(
      child: Container(
        width: double.infinity,
        child: Column(
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  open = !open;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: !open ? widget.maincolor : null,
                  gradient: open
                      ? LinearGradient(
                          colors: [
                              widget.maincolor,
                              Colors.black,
                            ],
                          begin: FractionalOffset(0.0, 0.1),
                          end: FractionalOffset(0.0, 0.4))
                      : null,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10.0,
                        right: 10,
                        top: 15,
                        bottom: 15,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                widget.mainIcon,
                                color:
                                    widget.maincolor == AppColors.primaryColor
                                        ? Colors.black
                                        : Colors.white,
                                size: 35,
                                weight: 50,
                              ),
                              SizedBox(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.02),
                              Text(
                                widget.mainText,
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                    color: widget.maincolor ==
                                            AppColors.primaryColor
                                        ? Colors.black
                                        : Colors.white),
                                textAlign: TextAlign.right,
                              ),
                            ],
                          ),

                          //SizedBox(width: MediaQuery.sizeOf(context).width*0.13),
                          Icon(
                            open
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down,
                            color: widget.maincolor == AppColors.primaryColor
                                ? Colors.black
                                : Colors.white,
                            size: 45,
                          ),
                        ],
                      ),
                    ),
                    if (open)
                      Container(
                        padding: EdgeInsets.only(
                            top: height * 0.015,
                            left: width * 0.1,
                            right: width * 0.04),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Ambulance Service',
                                  style: GoogleFonts.poppins(
                                      color: AppColors.primaryColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(
                                  width: width * 0.03,
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      left: width * 0.025,
                                      right: width * 0.025),
                                  width: width * 0.2,
                                  decoration: BoxDecoration(
                                      color: AppColors.primaryColor,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(
                                        Icons.call,
                                        color: Colors.black,
                                        size: 20,
                                      ),
                                      Text(
                                        'Call',
                                        style: GoogleFonts.poppins(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 13,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Security',
                                  style: GoogleFonts.poppins(
                                      color: AppColors.primaryColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(
                                  width: width * 0.03,
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      left: width * 0.025,
                                      right: width * 0.025),
                                  width: width * 0.2,
                                  decoration: BoxDecoration(
                                      color: AppColors.primaryColor,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(
                                        Icons.call,
                                        color: Colors.black,
                                        size: 20,
                                      ),
                                      Text(
                                        'Call',
                                        style: GoogleFonts.poppins(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 13,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Lost & Found',
                                  style: GoogleFonts.poppins(
                                      color: AppColors.primaryColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(
                                  width: width * 0.03,
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      left: width * 0.025,
                                      right: width * 0.025),
                                  width: width * 0.2,
                                  decoration: BoxDecoration(
                                      color: AppColors.primaryColor,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(
                                        Icons.call,
                                        color: Colors.black,
                                        size: 20,
                                      ),
                                      Text(
                                        'Call',
                                        style: GoogleFonts.poppins(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            // SizedBox(height: 13,),
                          ],
                        ),
                      )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
