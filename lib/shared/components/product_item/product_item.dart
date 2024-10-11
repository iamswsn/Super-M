import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:sizer/sizer.dart';

class ItemProduct extends StatelessWidget {
  final String productImage;
  String? productName;
  String? price;
  final Function ontap;


  ItemProduct(
      {required this.productImage,
        required this.ontap,
        required this.productName, required  this.price,
       });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ontap();
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 2.w),
        child: Stack(
          children: [
            Container(
              height: 30.h,
              width: 60.w,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                borderRadius: BorderRadius.circular(22.sp),
              ),
              child: Column(
                children: [
                  SizedBox(height: 3.h,),
                 Container(
                      height: 12.5.h,
                      width: 60.w,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(22.sp),
                            topRight: Radius.circular(22.sp)),
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(productImage)),
                      ),
                  ),
                  Stack(
                    children: [
                      Container(
                        // height: 11.h,
                        margin: EdgeInsets.symmetric(
                            horizontal: 1.w, vertical: 1.5.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                                Container(
                                  width: 35.w,
                                  child: Text(
                                    productName.toString(),
                                    maxLines: 1,
                                    style: GoogleFonts.poppins(
                                        letterSpacing: 0.4,
                                        fontSize:  12.sp,
                                        fontWeight:
                                             FontWeight.w500
                                            ),
                                  ),
                                ),


                            Padding(
                              padding: EdgeInsetsDirectional.only(top: 1.h),
                              child: Row(
                                children: [
                                  Container(
                                    width: 30.w,
                                    child: Text(
                                        "SR 125 ",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 13.sp)),
                                  ),


                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
