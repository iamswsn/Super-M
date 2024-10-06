import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:self_checker/modules/customer/invoice_qr/invoice_qr.dart';
import 'package:self_checker/shared/components/container_of_image/container_of_image.dart';
import 'package:self_checker/shared/components/default_button/default_button.dart';
import 'package:sizer/sizer.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

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
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            "Payment",
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w600,
              fontSize: 14.sp,
            ),
          ),
          leading: Icon(
            Icons.arrow_back_ios,
            size: 16.sp,
            color: Colors.black,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "Quantity",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w700,
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                ListView.separated(
                  physics:const NeverScrollableScrollPhysics(),
                   shrinkWrap: true,
                  itemCount:3,
                  separatorBuilder: (context, index) => SizedBox(
                    height: 3.h,
                  ),
                  itemBuilder: (context, index) => Row(
                    children: [
                      ContainerOfImage(
                          image:
                              "https://media.istockphoto.com/id/544807136/photo/various-fresh-dairy-products.jpg?s=612x612&w=0&k=20&c=U5T70bi24itoTDive1CVonJbJ97ChyL2Pz1I2kOoSRo="),
                      SizedBox(
                        width: 2.w,
                      ),
                      Text(
                        " Italian seasoning",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700,
                          fontSize: 14.sp,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "x9",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  "Add payment method",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w700,
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  children: [
                    ContainerOfImage(image: "https://brand.mastercard.com/content/dam/mccom/brandcenter/thumbnails/mc_dla_symbol_92.png"),
                 SizedBox(width: 6.w,),
                    ContainerOfImage(image: "https://flyclipart.com/thumb2/apple-pay-pay-payment-icon-png-and-vector-for-free-download-508510.png"),

                    SizedBox(width: 6.w,),

                    ContainerOfImage(
                        image:
                            "https://cdn4.iconfinder.com/data/icons/logos-and-brands/512/250_Paypal_logo-512.png"),
                  ],
                ),
                SizedBox(height: 4.h,),
                Center(child: DefaultButton(text: "Receipt split  ", onTap: (){})),
                SizedBox(height: 6.h,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Text(
                      "Total:",
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w700,
                        fontSize: 13.sp,
                      ),
                    ),
                    SizedBox(width:4.w),
                    Text(
                      "SAR 122.81",
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w700,
                        fontSize: 22.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(height:2.h),
            Center(child: DefaultButton(text: "Confirm Payment", onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>QRInvoiceScreen()));
            })),
                SizedBox(height:3.h),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
