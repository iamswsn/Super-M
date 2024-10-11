import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:self_checker/modules/change_password/cubit/cubit.dart';
import 'package:self_checker/modules/change_password/cubit/states.dart';
import 'package:sizer/sizer.dart';

import '../../shared/components/default_button/default_button.dart';
import '../../shared/components/default_text_form_field/default_text_form_field.dart';
import '../../shared/styles/colors.dart';

class ChangePasswordScreen extends StatelessWidget {
   ChangePasswordScreen({super.key});
var confirmPasswordController=TextEditingController();
var passwordController=TextEditingController();
   var oldPasswordController=TextEditingController();
static var changePasswordKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>ChangePasswordCubit(),
      child: BlocConsumer<ChangePasswordCubit,ChangePasswordStates>(
        listener: (context,state){
          if(state is ChangePasswordSuccessState){
            if(state.message=="faile update"){
            }
            if(state.message=="updated"){
              passwordController.clear();
              passwordController.clear();
              oldPasswordController.clear();
              Navigator.pop(context);
            }
          }
        },
        builder:(context,state)=> Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: changePasswordKey,
          child: Container(
            height:double.infinity,
            width: double.infinity,
            decoration:const  BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/background.png"),fit: BoxFit.cover)
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: SingleChildScrollView(

                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 15.h),
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
                                  validate: (value) {
                                    if(value!.isEmpty){
                                      return 'old password is required';
                                    }
                                  },
                                  controller: oldPasswordController,
                                  label: "*********"),
                              SizedBox(
                                height: 1.5.h,
                              ),
                              defaultTextFormField(
                                  context: context,
                                  type: TextInputType.text,
                                  validate: (value) {
                                    if(value!.isEmpty){
                                      return 'new password is required';
                                    }
                                  },
                                  controller: passwordController,
                                  label: "*********"),
                              SizedBox(
                                height: 1.5.h,
                              ),
                              defaultTextFormField(
                                  context: context,
                                  controller: confirmPasswordController,
                                  type: TextInputType.text,
                                  validate: (value) {
                                    if(value!.isEmpty){
                                      return 'confirm new password is required';
                                    }
                                    if(confirmPasswordController.text!=passwordController.text){
                                      return 'new password and confirm new password not matched';
                                    }
                                  },
                                  label: "********"),
                              SizedBox(
                                height: 3.h,
                              ),
                              ConditionalBuilder(
                                condition: state is! ChangePasswordLoadingState,
                                fallback: (context)=>const Center(child: CircularProgressIndicator(),),
                                builder:(context)=> DefaultButton(
                                  text: "Change Password",
                                  onTap: () {
                                    if(changePasswordKey.currentState!.validate()){
                                    ChangePasswordCubit.get(context).changePassword(oldPassword: oldPasswordController.text,
                                        newPassword: passwordController.text, confirmNewPassword: confirmPasswordController.text);
                                  }},
                                ),
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
            ),
          ),
        ),
      ),
    );
  }
}
