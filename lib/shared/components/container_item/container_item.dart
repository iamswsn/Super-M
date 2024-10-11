import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../styles/colors.dart';

class ContainerItem extends StatelessWidget {
  final IconData icon;
  final String text;
  const ContainerItem({super.key,required this.text,required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 25.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.sp),
color:Colors.white.withOpacity(0.3)      ),
      child:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon,size: 50.sp,color: primaryColor,),
          Center(child: Text(text,style: GoogleFonts.chenla(fontSize: 11.sp,color: Colors.black,
              fontWeight: FontWeight.w600),))
        ],
      ),
    );
  }
}
