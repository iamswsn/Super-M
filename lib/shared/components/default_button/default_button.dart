import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../styles/colors.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final Function onTap;
  Color?color;
   DefaultButton({super.key,required this.text,required this.onTap,this.color});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){
        onTap();
      },
      child: Container(
        height: 6.h,
        width: 70.w,
        decoration: BoxDecoration(color: color??primaryColor,
          borderRadius: BorderRadius.circular(9.sp),),
        child: Center(
          child: Text(text, style: GoogleFonts.inter(
              color: Colors.white,fontWeight: FontWeight.w500,fontSize: 12.sp
          )),),),
    );

  }
}
