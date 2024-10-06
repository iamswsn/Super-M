import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:self_checker/modules/login_screen/login_screen.dart';
import 'package:sizer/sizer.dart';

import '../../shared/components/default_button/default_button.dart';
import '../../shared/components/default_text_form_field/default_text_form_field.dart';
import '../../shared/styles/colors.dart';

class RegisterScreen extends StatelessWidget {
   RegisterScreen({super.key});

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
   var phoneController = TextEditingController();
   var nameController = TextEditingController();

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
                "Welcome" ,
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
                height: 60.h,
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
                      Text(
                        "Create an account",
                        style: GoogleFonts.inter(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 13.sp),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text(
                        "Enter your data to sign up for this app",
                        style: GoogleFonts.inter(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 10.sp),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      defaultTextFormField(context: context,
                          type: TextInputType.emailAddress,
                          validate: (value) {},
                          controller: nameController,
                          label: "Ahmed"),
                      SizedBox(height: 1.5.h,),
                      defaultTextFormField(context: context,
                          type: TextInputType.emailAddress,
                          validate: (value) {},
                          controller: emailController,
                          label: "email@domain.com"),
                      SizedBox(height: 1.5.h,),
                      defaultTextFormField(context: context,
                          type: TextInputType.number,
                          validate: (value) {},
                          controller: phoneController,
                          label: "+96652145200"),
                      SizedBox(height: 1.5.h,),
                      defaultTextFormField(context: context,
                          type: TextInputType.text,
                          validate: (value) {},
                          controller: passwordController,
                          label: "Enter Password"),
                      SizedBox(height: 3.h,),
                       DefaultButton(text:"Sign up",onTap: (){},),
                      SizedBox(height:3.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              'Already have an account?',
                              style: GoogleFonts.poppins(
                                  color:Colors.grey,
                                  fontSize:9.5.sp,
                                  fontWeight: FontWeight.w400
                              )
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          LoginScreen()));
                            },
                            child: Text(
                                'Login Now',
                                style: GoogleFonts.poppins(
                                    color:Colors.grey,
                                    fontSize:10.sp,
                                    fontWeight: FontWeight.w500,
                                    decoration:TextDecoration.underline
                                )
                            ),
                          ),
                        ],
                      ),

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
