

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:self_checker/modules/admin_super_market/home_admin_super_market/home_admin_super_market.dart';
import 'package:self_checker/shared/components/default_button/default_button.dart';
import 'package:sizer/sizer.dart';
import 'package:barcode_widget/barcode_widget.dart';

import '../../../shared/styles/colors.dart';

class ShowBarCodeProduct extends StatelessWidget {
  final String serialNumberProduct;
  final String productName;
  const ShowBarCodeProduct({super.key,required this.serialNumberProduct,required this.productName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 4.w),
        child: Column(
          mainAxisAlignment:
          MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 9.h,),
            Row(
              mainAxisAlignment:           MainAxisAlignment.center,
              children: [
                Icon(Icons.done_all,color: Colors.green,size: 22.sp,),

                Text(
                  productName,
                  style: GoogleFonts.poppins(
                    color: primaryColor,
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            Container(
              height: 45.h,
              width: 80.h,
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
                      "BarCode $productName",
                      style: GoogleFonts.inter(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 13.sp),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      "This Barcode helps customers to check product  ",
                      style: GoogleFonts.inter(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 10.sp),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 30.h,
                          width: 80.w,
                          color: Colors.transparent,
                          child: BarcodeWidget(

                              width: 50.w,
                              height: 10.h,
                              data: serialNumberProduct.toString(),
                              barcode: Barcode.codabar()),
                        ),
                      ],
                    ),
SizedBox(height: 3.h,),
                    DefaultButton(text: "Back to home", onTap: (){
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const HomeAdminSuperMarketScreen()), (route) => false,);

                    }),
                  ],
                    ),

                ),
              ),

          ],
        ),
      ),

    );
  }
}
