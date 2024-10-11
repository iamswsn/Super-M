import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:self_checker/modules/login_screen/login_screen.dart';
import 'package:sizer/sizer.dart';

import '../../shared/components/default_button/default_button.dart';
import '../../shared/components/default_text_form_field/default_text_form_field.dart';
import '../../shared/styles/colors.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class RegisterScreen extends StatelessWidget {
   RegisterScreen({super.key});

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
   var phoneController = TextEditingController();
   var nameController = TextEditingController();
   static var registerKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(BuildContext context)=>RegisterCubit(),
      child: BlocConsumer<RegisterCubit,RegisterStates>(
        listener:(context,state){
          if(state is RegisterSuccessState){
            if(state.statusCode==200||state.statusCode==201){
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginScreen()), (route) => false,);
            }
          }
          if(state is RegisterErrorState){

          }
        },
        builder:(context,state)=> Form(
          key: registerKey,
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
                  padding: EdgeInsets.symmetric(horizontal: 8.w,vertical:18.h),
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
                                  validate: (value) {
                                if(value!.isEmpty){
                                  return 'Name is required';
                                }
                                  },
                                  controller: nameController,
                                  label: "Ahmed"),
                              SizedBox(height: 1.5.h,),
                              defaultTextFormField(context: context,
                                  type: TextInputType.emailAddress,
                                  validate: (value) {
                                    if(value!.isEmpty){
                                      return 'Email is required';
                                    }
                                    if(! value.contains("@")){
                                      return 'Please Enter valid email address';
                                    }
                                    if(! value.contains(".com")){
                                      return 'Please Enter valid email address';
                                    }
                                  },
                                  controller: emailController,
                                  label: "email@domain.com"),
                              SizedBox(height: 1.5.h,),
                              defaultTextFormField(context: context,
                                  type: TextInputType.number,
                                  validate: (value) {
                                    if(value!.isEmpty){
                                      return 'Phone is required';
                                    }
                                  },
                                  controller: phoneController,
                                  label: "+96652145200"),
                              SizedBox(height: 1.5.h,),
                              defaultTextFormField(context: context,
                                  type: TextInputType.text,
                                  validate: (value) {
                                    if(value!.isEmpty){
                                      return 'Password is required';
                                    }
                                  },
                                  controller: passwordController,
                                  label: "Enter Password"),
                              SizedBox(height: 3.h,),
                               ConditionalBuilder(
                                 condition: state is! RegisterLoadingState,
                                 fallback: (context)=>const Center(child: CircularProgressIndicator(),),
                                   builder:(context)=> DefaultButton(text:"Sign up",onTap: (){
                                     if(registerKey.currentState!.validate()){
                                     RegisterCubit.get(context).register(name: nameController.text,
                                         email: emailController.text, password: passwordController.text, phone: phoneController.text);
                                   }},)),
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
                SizedBox(height: 2.h,),
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
