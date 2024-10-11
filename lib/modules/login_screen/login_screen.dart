import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:self_checker/modules/admin/home_admin_screen/home_admin_screen.dart';
import 'package:self_checker/modules/admin_super_market/add_product/add_product.dart';
import 'package:self_checker/modules/admin_super_market/home_admin_super_market/home_admin_super_market.dart';
import 'package:self_checker/modules/analyst/home_analyst/home_analyst.dart';
import 'package:self_checker/modules/cashier/home_cashier/home_cashier.dart';
import 'package:self_checker/modules/register_screen/register_screen.dart';
import 'package:self_checker/shared/components/default_text_form_field/default_text_form_field.dart';
import 'package:self_checker/shared/styles/colors.dart';
import 'package:sizer/sizer.dart';

import '../../shared/components/default_button/default_button.dart';
import '../../shared/constants/constants.dart';
import '../customer/customer_home_screen/customer_home_screen.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  static var loginKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => LoginCubit(),
  child: BlocConsumer<LoginCubit,LoginStates>(
      listener:(context,state){
        if(state is LoginSuccessState){
          if(state.statusCode=="201"|| state.statusCode=="200"){
            if(usertype=="admin"){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>const HomeAdminScreen()));}
            if(usertype=="Local Admin"){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>const HomeAdminSuperMarketScreen()));}
            if(usertype=="Cashier"){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>const HomeCashierScreen()));}
            if(usertype=="customer"){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>const CustomerHomeScreen()));}
            if(usertype=="Analyst"){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomeAnalystScreen()));}
          }
          emailController.clear;
          passwordController.clear;
        }
        if(state is LoginErrorState){}
      },
    builder:(context,state)=> Form(
      key: loginKey,
      child: Container(
          height:double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
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
                    "Welcome",
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
                    // height: 45.h,
                    // width: 80.h,
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
                            "Sign In with an account",
                            style: GoogleFonts.inter(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 13.sp),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            "Enter your email to sign in for this app",
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
                              type: TextInputType.emailAddress,
                              validate: (String ?value) {
                                if(value!.isEmpty){
                                  return "Email is required";
                                }
                                if(!value.contains("@")){
                                  return "please write correct email";
                                }
                                if(!value.contains(".com")){
                                  return "please write correct email";
                                }
                              },
                              controller: emailController,
                              label: "email@domain.com"),
                          SizedBox(
                            height: 1.5.h,
                          ),
                          defaultTextFormField(
                              context: context,
                              controller: passwordController,
                              type: TextInputType.text,
                              validate: (value) {
                                if(value!.isEmpty){
                                  return "password is required";
                                }
                              },
                              label: "Enter Password"),
                          SizedBox(
                            height: 3.h,
                          ),
                          ConditionalBuilder(
                            condition: state is! LoginLoadingState,
                            fallback: (context)=>const Center(child: CircularProgressIndicator(),),
                            builder:(context)=> DefaultButton(
                              text: "Sign in",
                              onTap: () {
                                if(loginKey.currentState!.validate()){
                                LoginCubit.get(context).login(email: emailController.text, passsword: passwordController.text);
                              }},
                            ),
                          ),
                          SizedBox(height: 3.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Don\'t have an account?',
                                  style: GoogleFonts.poppins(
                                      color: Colors.grey,
                                      fontSize: 9.5.sp,
                                      fontWeight: FontWeight.w400)),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => RegisterScreen()));
                                },
                                child: Text('Register Now',
                                    style: GoogleFonts.poppins(
                                        color: Colors.grey,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w500,
                                        decoration: TextDecoration.underline)),
                              ),
                            ],
                          ),
                          SizedBox(height:2.h)
      ,                      ],
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
);
  }
}
