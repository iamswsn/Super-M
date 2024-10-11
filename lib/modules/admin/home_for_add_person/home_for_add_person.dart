import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:self_checker/modules/admin/add_person/add_person.dart';
import 'package:self_checker/shared/components/container_item/container_item.dart';
import 'package:sizer/sizer.dart';

import '../../../shared/components/container_row_item/container_row_item.dart';
import '../../../shared/styles/colors.dart';

class HomeForAddPersonScreen extends StatelessWidget {
  const HomeForAddPersonScreen({super.key});

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
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 12.h,),
              Text(
                "Choose Type" ,
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
              Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Choose type of account",
                    style: GoogleFonts.inter(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 13.sp),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),

                 InkWell(
                     onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>AddPersonScreen(type: "Local Admin")));
                     },
                     child: const ContainerRowItem(text: " Admin-Super-Market", icon: Icons.admin_panel_settings_sharp)),
                 SizedBox(height: 2.w,),
                 InkWell(
                     onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>AddPersonScreen(type: "Cashier")));

                     },
                     child:const  ContainerRowItem(text: "Cashier", icon: Icons.attach_money)),
                 SizedBox(height: 2.w,),
                 InkWell(
                     onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>AddPersonScreen(type: "Analyst")));
                     },
                     child: const ContainerRowItem(text: "Analysis", icon: Icons.analytics_sharp))
                ],
              )
            ],
          ),
        ),

      ),
    );
  }
}
