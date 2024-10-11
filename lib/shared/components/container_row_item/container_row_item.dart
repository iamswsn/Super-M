import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../styles/colors.dart';

class ContainerRowItem extends StatelessWidget {
  final IconData icon;
  final String text;
  const ContainerRowItem({super.key,required this.text,required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 9.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9.sp),
          color:Colors.white.withOpacity(0.25)     ),
      child:
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon,size: 50.sp,color: primaryColor,),
          SizedBox(width:5.w),
          Center(child: Text(text,style: GoogleFonts.chenla(fontSize: 11.sp,color: Colors.black,fontWeight: FontWeight.w600),))
        ],
      ),
    );
  }
}
