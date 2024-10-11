import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:self_checker/modules/cashier/status_invoice/widgets/row_info/row_info.dart';
import 'package:sizer/sizer.dart';

import '../../../shared/components/default_button/default_button.dart';

class StatusInvoice extends StatelessWidget {
  final int invoiceID;
  final String amount;
  final int products;
  final String date;
  final String time;
  const StatusInvoice({super.key,required this.amount,required this.time,required this.invoiceID,required this.products,required this.date});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.sp)),
      elevation: 0,
      backgroundColor: Colors.white,
      contentPadding: EdgeInsets.symmetric(horizontal: 3.w),
      actionsPadding: const EdgeInsetsDirectional.only(top: 0),
      actionsOverflowButtonSpacing: 0,
      content: Container(
          height: 46.h,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 3.h,),
              Text(
                   "Invoice $invoiceID",
                  style: GoogleFonts.poppins(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600)),
              SizedBox(height: 0.5.h,),
              Text(
                   "This Information To Invoice",
                  style: GoogleFonts.inter(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500)),
              SizedBox(
                height: 4.h,
              ),
              RowInfo(title: "Date", subTitle:date),

              SizedBox(
                height: 2.h,
              ),
              RowInfo(title: "Time", subTitle: time),
              SizedBox(
                height: 2.h,
              ),
              RowInfo(title: "Total Products", subTitle: "${products}"),
              SizedBox(
                height: 2.h,
              ),
              RowInfo(title: "Total", subTitle: "${amount} SR"),
              SizedBox(
                height: 2.h,
              ),
              RowInfo(title: "Status", subTitle: "Payment Completed"),
              SizedBox(
                height: 3.h,
              ),
              DefaultButton(
                  text: "OK",
                  onTap: () {
                   Navigator.pop(context);
                    // showDialog(context: context, builder: (context)=>DefaultDialog(height: 40,
                    //     title: "Done", subTitle: "Your Appointment With \n Dr.Koura Was Successfully Booked"));
                  },
                  ),

            ],
          )),
    );
  }
}
