

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../shared/components/container_row_item/container_row_item.dart';
import '../../../shared/styles/colors.dart';
import '../../cashier/status_invoice/widgets/row_info/row_info.dart';
import '../../profile/profile.dart';

class HomeAnalystScreen extends StatelessWidget {
  const HomeAnalystScreen({super.key});

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
          padding:  EdgeInsets.symmetric(horizontal: 6.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 7.h,),
              Row(
                children: [
                  Text(
                    "Weekly Report",
                    style: GoogleFonts.poppins(
                      color: primaryColor,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
      Spacer(),

                  InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));
                      },
                      child: Icon(Icons.person_sharp,size: 25.sp,color: Colors.blueGrey,))
                ],
              ),
              SizedBox(height: 9.h,),
              RowInfo(title: "All Product",subTitle: "6000",),
              SizedBox(height: 2.h,),
              RowInfo(title: "All Product Sold",subTitle: "2000",),
              SizedBox(height: 2.h,),
              RowInfo(title: "Profits",subTitle: "10000 SR",),
              SizedBox(height: 2.h,),
              RowInfo(title: "Number of customers",subTitle: "200",),
              SizedBox(height: 2.h,),
              RowInfo(title: "Number of invoices",subTitle: "70",),
            ],
          ),
        ),
      ),
    );
  }
}
