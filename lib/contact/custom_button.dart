import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:surge_2023_app/Global%20Variables/Constants.dart';

class CustomDropDown extends StatefulWidget {
  final Color maincolor;
  final String mainText;
  final IconData mainIcon;
  const CustomDropDown({Key? key, required this.maincolor, required this.mainText, required this.mainIcon}) : super(key: key);

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  bool open= false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        child: Column(

          children: [
            InkWell(
              onTap: (){
                setState(() {
                  open=!open;
                });
              },

              child: Container(
                decoration: BoxDecoration(
color:  !open?widget.maincolor:null ,
                  gradient: open? LinearGradient(colors: [
                  widget.maincolor,
                    Colors.black,

                  ],
                      begin: FractionalOffset(0.0,0.1),
                      end: FractionalOffset(0.0,0.4)
                  ):null,
                  borderRadius: BorderRadius.circular(15),

                ),

                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(widget.mainIcon,color:widget.maincolor==AppColors.primaryColor?Colors.black: Colors.white,size: 45,weight:30 ),
                          //SizedBox(width: MediaQuery.sizeOf(context).width*0.03),
                          Text(
                            widget.mainText,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 30,color:widget.maincolor==AppColors.primaryColor?Colors.black: Colors.white),
                        textAlign: TextAlign.right,  ),

                          //SizedBox(width: MediaQuery.sizeOf(context).width*0.13),
                          Icon(open?Icons.keyboard_arrow_up:Icons.keyboard_arrow_down,color: widget.maincolor==AppColors.primaryColor?Colors.black: Colors.white ,size: 45,),

                        ],
                      ),
                    ),
                    if(open)Container(

                      padding: EdgeInsets.only(top: 14),
                      decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Ambulance Service',style: TextStyle(color: AppColors.primaryColor,fontSize: 25,fontWeight:  FontWeight.w700),),
                              SizedBox(width: 15,),
                              Container(
                                padding: EdgeInsets.only(left: 7,right: 7),
                                width: 80,
                                decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    borderRadius: BorderRadius.circular(15)
                                ),

                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(Icons.call,color: Colors.black ,size: 24,),

                                    Text('Call',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 20),)
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 13,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Ambulance Service',style: TextStyle(color: AppColors.primaryColor,fontSize: 25,fontWeight:  FontWeight.w700),),
                              SizedBox(width: 15,),
                              Container(
                                padding: EdgeInsets.only(left: 7,right: 7),
                                width: 80,
                                decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    borderRadius: BorderRadius.circular(15)
                                ),

                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(Icons.call,color: Colors.black ,size: 24,),

                                    Text('Call',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 20),)
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 13,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Ambulance Service',style: TextStyle(color: AppColors.primaryColor,fontSize: 25,fontWeight:  FontWeight.w700),),
                              SizedBox(width: 15,),
                              Container(
                                padding: EdgeInsets.only(left: 7,right: 7),
                                width: 80,
                                decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    borderRadius: BorderRadius.circular(15)
                                ),

                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(Icons.call,color: Colors.black ,size: 24,),

                                    Text('Call',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 20),)
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
