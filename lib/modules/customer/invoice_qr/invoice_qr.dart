

import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:self_checker/modules/customer/customer_home_screen/customer_home_screen.dart';
import 'package:self_checker/shared/components/default_button/default_button.dart';
import 'package:sizer/sizer.dart';

class QRInvoiceScreen extends StatelessWidget {
  final int data;
  const QRInvoiceScreen({super.key,required this.data});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height:double.infinity,
      width: double.infinity,
      decoration:const  BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/background.png"),fit: BoxFit.cover)
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 30.h,
                width: 80.w,
                color: Colors.transparent,
                child: BarcodeWidget(
                    width: 50.w,
                    height: 10.h,
                          data: data.toString(),
                    barcode: Barcode
                        .qrCode()),
              ),
SizedBox(height: 2.h,),
              DefaultButton(text: "Back to Home", onTap: (){
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const CustomerHomeScreen()), (route) => false,);
              })
            ],),
        ),
      ),
    );
  }
}
