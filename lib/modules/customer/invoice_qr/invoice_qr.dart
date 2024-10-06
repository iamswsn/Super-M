

import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class QRInvoiceScreen extends StatelessWidget {
  const QRInvoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height:double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
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
                          data: "1",
                    barcode: Barcode
                        .qrCode()),
              ),

            ],),
        ),
      ),
    );
  }
}
