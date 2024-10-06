import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_checker/modules/cashier/home_cashier/cubit/states.dart';

import '../../status_invoice/status_invoice.dart';


class CashierHomeCubit extends Cubit<CashierHomeStates> {
  CashierHomeCubit() : super(HomeInitialState());

  static CashierHomeCubit get(context) => BlocProvider.of(context);
  String result = "no thing";

  Future<void> scanQrCode({required context}) async {
    try {
      FlutterBarcodeScanner.scanBarcode('#201937', 'cancel', true, ScanMode.QR)
          .then((value) {
        result = value.toString();
        print("iii" + result);
         showDialog(context: context, builder: (context)=>StatusInvoice());
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) =>
        //             InformationPlace(
        //                 isScan: true,placeId: int.parse(result.toString()))));
        emit(ScanQrCodeSuccessState());
      });
    } catch (e) {
      result = "unable to Scan";
      emit(ScanQrCodeErrorState());
    }
  }
  
}
