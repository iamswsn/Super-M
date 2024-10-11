import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../shared/components/default_text_form_field/default_text_form_field.dart';
import '../../shared/constants/constants.dart';
import '../../shared/network/local/local.dart';
import '../../shared/styles/colors.dart';
import '../change_password/change_password.dart';
import '../dialog_logout/dialog_logout.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  var emailController = TextEditingController(text:CacheHelper.getData(key: "email"));
  var phoneController = TextEditingController(text: phone);
  var nameController = TextEditingController(text: name);

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
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading:
            const Icon(Icons.arrow_back, color: Color(0xff000000)),
            title: Text(
              "Profile Information",
              style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w600),
              softWrap: false,
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 6.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.w),
                    child: Column(
                      children: [
                        defaultTextFormField(context: context,
                            controller: nameController,
                            type: TextInputType.text,
                            label: "Name",
                            validate: (String? val) {}),

                        SizedBox(
                          height: 1.3.h,
                        ),
                        defaultTextFormField(
                            context: context,
                            controller: emailController,
                            type: TextInputType.emailAddress,
                            isLocation: true,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return "Email is Required";
                              }
                            },
                            label: "Email"),

                        SizedBox(
                          height: 1.3.h,
                        ),


                      ],
                    ),
                  ),
                  SizedBox(height: 5.h,),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.w),
                      child:InkWell(
                        onTap: () {
Navigator.push(context, MaterialPageRoute(builder: (context)=>ChangePasswordScreen()));
                        },
                        child: Container(
                          height: 6.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(9.sp)),
                          child: Center(
                            child: Text(
                              "Change Password",
                              style: GoogleFonts.inter(
                                  color: Colors.white, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      )
                  ),
                  SizedBox(height: 3.h,),

                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.w),
                      child:InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) => const DialogLogOut());
                    },
                    child: Container(
                      height: 6.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(9.sp)),
                      child: Center(
                        child: Text(
                          "Logout",
                          style: GoogleFonts.inter(
                              color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  )
                  )
                ],
              ))

      ),
    );
  }
}
