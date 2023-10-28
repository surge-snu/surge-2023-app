import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:surge_2023_app/Global%20Variables/Constants.dart';
import 'package:url_launcher/url_launcher.dart';

import 'contactresponse.dart';
import 'contactus.dart';

class CustomDropDown extends StatefulWidget {
  final Color maincolor;
  final String mainText;
  final IconData mainIcon;
  final String? name1;
  final String? name3;
  final String? name2;
  final String? con1;
  final String sub1;
  final String? sub2;
  final String sub3;
  final String? con2;
  final String? con3;
  const CustomDropDown({
    Key? key,
    required this.maincolor,
    required this.mainText,
    required this.mainIcon,
    required this.name1,
    required this.name3,
    required this.con1,
    this.con2,
    required this.con3,
    this.name2,
    required this.sub1,
    this.sub2,
    required this.sub3,
  }) : super(key: key);

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  bool open = false;

  Future<void> _launchPhoneDialer(String phoneNumber) async {
    final String url = 'tel:$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Center(
      child: GetBuilder<DropDownController>(builder: (dropdowncontroller) {
        return Container(
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
                            begin: const FractionalOffset(0.0, 0.1),
                            end: const FractionalOffset(0.0, 0.4))
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
                                    width: MediaQuery.sizeOf(context).width *
                                        0.02),
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
                              left: width * 0.03,
                              right: width * 0.04),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        widget.name1!,
                                        style: GoogleFonts.poppins(
                                            color: AppColors.primaryColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Text(
                                        widget.sub1,
                                        style: GoogleFonts.poppins(
                                          color: AppColors.primaryColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ],
                                  ),
                                  InkWell(
                                    onTap: () {
                                      _launchPhoneDialer(widget.con1!);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          left: width * 0.025,
                                          right: width * 0.025),
                                      width: width * 0.2,
                                      decoration: BoxDecoration(
                                          color: AppColors.primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Icon(
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
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 13,
                              ),
                              (widget.name2 != null
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              widget.name2!,
                                              style: GoogleFonts.poppins(
                                                  color: AppColors.primaryColor,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            Text(
                                              widget.sub2!,
                                              style: GoogleFonts.poppins(
                                                color: AppColors.primaryColor,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            )
                                          ],
                                        ),
                                        InkWell(
                                          onTap: () {
                                            _launchPhoneDialer(widget.con2!);
                                          },
                                          child: Container(
                                            padding: EdgeInsets.only(
                                                left: width * 0.025,
                                                right: width * 0.025),
                                            width: width * 0.2,
                                            decoration: BoxDecoration(
                                                color: AppColors.primaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Icon(
                                                  Icons.call,
                                                  color: Colors.black,
                                                  size: 20,
                                                ),
                                                Text(
                                                  'Call',
                                                  style: GoogleFonts.poppins(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 16),
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  : Container()),
                              const SizedBox(
                                height: 13,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        widget.name3!,
                                        style: GoogleFonts.poppins(
                                            color: AppColors.primaryColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Text(
                                        widget.sub3,
                                        style: GoogleFonts.poppins(
                                          color: AppColors.primaryColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ],
                                  ),
                                  InkWell(
                                    onTap: () {
                                      _launchPhoneDialer(widget.con3!);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          left: width * 0.025,
                                          right: width * 0.025),
                                      width: width * 0.2,
                                      decoration: BoxDecoration(
                                          color: AppColors.primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Icon(
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
        );
      }),
    );
  }
}
