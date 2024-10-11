import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';

import '../../styles/colors.dart';

class PersonItem extends StatelessWidget {
  final String personName;
  final String personType;
  final Function onClick;
  const PersonItem(
      {Key? key,
        required this.personType,
        required this.personName,
        required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClick();
      },
      child: Container(
        width: 50.w,
        margin: EdgeInsets.symmetric(horizontal: 2.w),
        child: Stack(
          children: [
            Material(
              elevation: 5,
              shadowColor: HexColor('#ACB7CA'),
              borderRadius: BorderRadius.circular(20.sp),
              child: Container(
                height: 25.h,
                width: 50.w,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(20.sp),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 12.5.h,
                      width: 50.w,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(26.0),
                            topRight: Radius.circular(26.0)),
                        color: HexColor("D7DEEB"),
                      ),
                    ),
                    Stack(
                      children: [
                        Container(
                          height: 8.h,
                          margin: EdgeInsetsDirectional.only(top: 4.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                personName,
                                style: GoogleFonts.poppins(
                                    letterSpacing: 0.4,
                                    fontSize: 12.sp,

                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Container(
                                height: 3.h,

                                child: Text(
                                  personType,
                                  style: GoogleFonts.poppins(
                                      letterSpacing: 0.4,
                                      fontSize: 8.sp,
                                      color: Colors.grey[500],
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
                top: 1.h,
                right: 6.w,
                child: Container(
                  height: 15.h,
                  width: 35.w,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: primaryColor),
                )),
            Positioned(
              top: 1.6.h,
              right: 7.w,
              child:
                    Container(
                      height: 13.8.h,
                      width: 33.w,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          image: DecorationImage(fit: BoxFit.cover,image:
                          NetworkImage("https://images.rawpixel.com/image_800/czNmcy1wcml2YXRlL3Jhd3BpeGVsX2ltYWdlcy93ZWJzaXRlX2NvbnRlbnQvbHIvdjkzNy1hZXctMTExXzMuanBn.jpg"))),
                    ),


            ),
          ],
        ),
      ),
    );
  }
}
