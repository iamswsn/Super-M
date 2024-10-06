import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../shared/components/default_button/default_button.dart';
import '../../shared/components/default_text_form_field/default_text_form_field.dart';
import '../../shared/styles/colors.dart';

class ChangePasswordScreen extends StatelessWidget {
   ChangePasswordScreen({super.key});
var confirmPasswordController=TextEditingController();
var passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height:double.infinity,
      width: double.infinity,
      decoration:const  BoxDecoration(
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
                "Change Password",
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
                height: 45.h,
                width: 80.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.sp),
                ),
                child: Padding(
                  padding:
                  EdgeInsetsDirectional.only(top: 4.h, start: 3.w, end: 3.w),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "You Want to change your password ?",
                        style: GoogleFonts.inter(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 13.sp),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text(
                        "Please Enter new password and confirm new password",
                        style: GoogleFonts.inter(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 10.sp),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      defaultTextFormField(
                          context: context,
                          type: TextInputType.text,
                          validate: (value) {},
                          controller: passwordController,
                          label: "*********"),
                      SizedBox(
                        height: 1.5.h,
                      ),
                      defaultTextFormField(
                          context: context,
                          controller: confirmPasswordController,
                          type: TextInputType.text,
                          validate: (value) {},
                          label: "********"),
                      SizedBox(
                        height: 3.h,
                      ),
                      DefaultButton(
                        text: "Change Password",
                        onTap: () {
                        },
                      ),
                      SizedBox(height: 3.h),
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
