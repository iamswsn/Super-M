

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../shared/components/default_button/default_button.dart';
import '../../../shared/components/default_text_form_field/default_text_form_field.dart';
import '../../../shared/styles/colors.dart';

class ShowPersonDetailsScreen extends StatelessWidget {
   ShowPersonDetailsScreen({super.key});
   var personNameController=TextEditingController(text:"Ahmed Mohamed");
   var personEmailController=TextEditingController(text: "ahmed@gmail.com");
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
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Ahmed Mohamed" ,
                style: GoogleFonts.poppins(
                  color: primaryColor,
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 1.5.h,
              ),
              Container(
                height: 50.h,
                width: 80.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.sp),
                ),
                child: Padding(
                  padding:  EdgeInsetsDirectional.only(top: 4.h,start: 3.w,end: 3.w),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 5.h,
                      ),
                      defaultTextFormField(context: context,
                          type: TextInputType.name,
                          controller: personNameController,
                          validate: (value) {},
                          label: "Ahmed"),
                      SizedBox(height: 1.5.h,),
                      defaultTextFormField(context: context,
                          controller: personEmailController,
                          type: TextInputType.emailAddress,
                          validate: (value) {},
                          label: "ahmed@domain.com"),
                      SizedBox(height: 5.h,),
                      DefaultButton(text:"Edit",onTap: (){},),
                      SizedBox(height: 2.h,),
                      DefaultButton(text:"Delete",onTap: (){},color: Colors.red,),

                    ],
                  ),
                ),
              )
            ],
          ),
        ),

      ),
    );
  }
}
