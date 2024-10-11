import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class RowInfo extends StatelessWidget {
  final String title;
  final String subTitle;

  const RowInfo({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
             title, style:GoogleFonts.gothicA1(fontSize: 10.sp, fontWeight: FontWeight.w500)),
        const Spacer(),
        Text(
             subTitle,style: GoogleFonts.gothicA1(fontSize: 11.sp, fontWeight: FontWeight.w600)),
      ],
    );
  }
}
