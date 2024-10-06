

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../shared/components/default_button/default_button.dart';
import '../../../shared/components/default_text_form_field/default_text_form_field.dart';
import '../../../shared/styles/colors.dart';

class ShowProductDetailsScreen extends StatelessWidget {
   ShowProductDetailsScreen({super.key});
  var companyNameController = TextEditingController(text:"YCOMPANY");
  var productNameController = TextEditingController(text:"Milk");
  var priceController = TextEditingController(text:"155");
  var serialNumberController = TextEditingController(text: "125874200420024");
  String type= "Gluten-free";
  List <String> items=["Seasonings","Gluten-free","Sodium-free"];
  @override
  Widget build(BuildContext context) {
    return Container(
      height:double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/background.png"),fit: BoxFit.cover)
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
            elevation: 0,
            toolbarHeight: 7.h,
            title: Text("Milk",
                style: GoogleFonts.poppins(fontSize: 11.sp, color: primaryColor)),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            leading: Container()),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                EdgeInsetsDirectional.only(top: 4.h, end: 4.w, start:4.w),
                child: Column(
                  children: [

                  Container(
                    height: 25.h,
                    width: 50.w,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0),
                        image: DecorationImage(fit: BoxFit.cover,
                            image: NetworkImage("https://img.freepik.com/free-vector/fresh-milk-with-text-banner_1308-6819.jpg?size=626&ext=jpg&ga=GA1.1.2008272138.1726531200&semt=ais_hybrid"))),
                   
                  ),
                    SizedBox(
                      height: 3.h,
                    ),

                    defaultTextFormField(
                        context: context,
                        type: TextInputType.text,
                        controller: productNameController,
                        validate: (value) {},
                        label: "Product Name"),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    defaultTextFormField(
                        context: context,
                        type: TextInputType.text,
                        controller: companyNameController,
                        validate: (value) {},
                        label: "Company Name"),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    defaultTextFormField(
                        context: context,
                        type: TextInputType.text,
                        controller: priceController,
                        validate: (value) {},
                        label: "Price"),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    defaultTextFormField(
                        context: context,
                        type: TextInputType.text,
                        controller: serialNumberController,
                        validate: (value) {},
                        label: "Serial Number"),
                    SizedBox(height: 1.5.h,),
                    StatefulBuilder(
                        builder: (context,state) {
                          return Container(
                            height: 5.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(10.sp),border: Border.all(color:Colors.grey)),
                            child: DropdownButton(
                              underline: Text(" "),
                              isExpanded: true,
                              elevation: 10,
                              iconDisabledColor: Colors.grey,
                              iconEnabledColor: primaryColor,
                              icon: Padding(
                                padding:
                                EdgeInsetsDirectional.only(end: 5.w),
                                child: const Icon(
                                    Icons.arrow_circle_down_sharp),
                              ),
                              borderRadius: BorderRadius.circular(10.sp),
                              hint: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 2.w, vertical: 1.h),
                                child: Text(
                                  type ?? " ",
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 11.sp),
                                ),
                              ),
                              items: items
                                  .map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  alignment: Alignment.center,
                                  child: Material(
                                    elevation: 5,
                                    shadowColor: Colors.grey[400],
                                    child: Container(
                                        width: double.infinity,
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 2.w,
                                              vertical: 1.h),
                                          child: Text(value,
                                              textAlign: TextAlign.start),
                                        )),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                state((){
                                  type=newValue!;
                                });
                              },
                            ),
                          );
                        }
                    ),

                    SizedBox(
                      height: 6.h,
                    ),
                    DefaultButton(
                      text: 'Edit',
                      onTap: () {
                      },
                    ),
SizedBox(height:2.h),
                    DefaultButton(
                      text: 'Delete',
                      color: Colors.red,
                      onTap: () {
                      },
                    ),

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );

  }
}
