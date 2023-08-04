import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:surge_2023_app/Global%20Variables/Constants.dart';
import 'package:surge_2023_app/Utils/CustomAppbar.dart';

class Query extends StatefulWidget {
  const Query({Key? key}) : super(key: key);

  @override
  State<Query> createState() => _QueryState();
}

class _QueryState extends State<Query> {
  List<String> items = ['Sports', 'Option 2', 'Option 3', 'Option 4'];
  String selectedValue = 'Sports'; // Set an initial value
 bool open = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        child: CustomAppBar(heading: "Query"),
        preferredSize: Size(MediaQuery.sizeOf(context).width,MediaQuery.sizeOf(context).height*0.15),

      ),
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Center(

            child: Container(
                height: MediaQuery.sizeOf(context).height*0.78,
                color: Colors.black,
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                SizedBox(height: MediaQuery.sizeOf(context).height*0.05,),
                Text('Choose Category',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 23),),
                SizedBox(height: MediaQuery.sizeOf(context).height*0.03,),
                Padding(
                  padding:  EdgeInsets.only(left: MediaQuery.sizeOf(context).width*0.11,right: MediaQuery.sizeOf(context).width*0.11),
                  child: DropdownButtonFormField2<String>(

                    isExpanded: true,

                    decoration: InputDecoration(

                        iconColor: AppColors.primaryColor,


                      // Add Horizontal padding using menuItemStyleData.padding so it matches
                      // the menu padding when button's width is not specified.
                  //    contentPadding: const EdgeInsets.symmetric(vertical: 16),

                      // Add more decoration..
                    ),
                    hint: Text(
                      selectedValue,
                      style: TextStyle(color:Colors.white,fontSize: 14),
                    ),
value:selectedValue,
                    items: items
                        .map((item) => DropdownMenuItem<String>(

                      value: item,
                      child: Center(
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white
                          ),
                        ),
                      ),
                    ))
                        .toList(),

                    onChanged: (value) {
                      //Do something when selected item is changed.
                      selectedValue = value.toString();
                    },
                    onSaved: (value) {
                      selectedValue = value.toString();
                    },
                    buttonStyleData: ButtonStyleData(
                      //width: MediaQuery.sizeOf(context).width,
                      height: MediaQuery.sizeOf(context).height*0.07,
                     decoration: BoxDecoration(

                       borderRadius: BorderRadius.circular(25),
                       border: Border.all(
                         color: AppColors.primaryColor, // Replace with your desired color
                         width: 2,
                       ),
                     ),
                      padding: EdgeInsets.only(right: 8),
                    ),
dropdownStyleData: DropdownStyleData(
  decoration: BoxDecoration(
    color: Colors.black
  )
),
                    iconStyleData: const IconStyleData(
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: AppColors.primaryColor
                      ),
                      iconSize: 24,
                    ),

                    menuItemStyleData:  MenuItemStyleData(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                     overlayColor:  MaterialStateProperty.all(Colors.black)
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height*0.03,),
                Text('Elaborate your Problem',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 23),),
                SizedBox(height: MediaQuery.sizeOf(context).height*0.03,),
                  Center(
                    child: Container(
                      height: MediaQuery.sizeOf(context).height*0.18,
                      width:MediaQuery.sizeOf(context).width*0.78 ,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: AppColors.primaryColor,
                          width:1.5
                        )
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.0), // Add desired padding
                        child: TextField(
                          style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
                          maxLines: null,
                          decoration: InputDecoration(
                            enabledBorder: InputBorder.none, // Remove underline
                            focusedBorder: InputBorder.none, // Remove underline when focused
                            errorBorder: InputBorder.none, // Remove underline on error
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.zero, // Set contentPadding to zero
                            hintText: "Describe your issue",
                          ),
                        ),
                      ),
                    ),
                  ),
                SizedBox(height: MediaQuery.sizeOf(context).height*0.07,),
                InkWell(
                  onTap: (){
                    // manage change password on Tap
                  },
                  child: Container(
                    height: 40,
                    width: MediaQuery.sizeOf(context).width*0.76,
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Center(child: Text('Submit',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 14),)),
                  ),
                )
              ],
            )
    ),
          ),
        ),
    );
  }
}
