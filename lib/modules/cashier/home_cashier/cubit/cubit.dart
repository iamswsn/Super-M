import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_checker/models/invoice_model.dart';
import 'package:self_checker/modules/cashier/home_cashier/cubit/states.dart';
import 'package:self_checker/shared/network/remote/remote.dart';
import 'package:intl/intl.dart';
import '../../../../shared/constants/constants.dart';
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
        getInvoiceInfo(invoiceID: int.parse(result.toString()), context: context);
        emit(ScanQrCodeSuccessState());
      });
    } catch (e) {
      result = "unable to Scan";
      emit(ScanQrCodeErrorState());
    }
  }
  late InvoiceModel invoiceModel;
  getInvoiceInfo({required int invoiceID,required context}){
    emit(GetInvoiceInfoLoadingState());
    DioHelper.getDataWithBearerToken(url: "cart/invoice/$invoiceID",token: token.toString())
    .then((value){
      print(value.data.toString());
      invoiceModel=InvoiceModel.fromJson(value.data);
      showDialog(context: context, builder: (context)=>StatusInvoice(
        amount: invoiceModel.data!.amount.toString(),
        time:DateFormat.jm().format(DateTime.parse(invoiceModel.data!.created_at!).add(Duration(hours: 3))).toString(),
        invoiceID: invoiceID,
        date:DateFormat.yMd().format(DateTime.parse(invoiceModel.data!.created_at!).add(Duration(hours: 3))).toString(),
        products: invoiceModel.data!.products.length,
      ));
      emit(GetInvoiceInfoSuccessState());
    })
    .catchError((error){
      print(error.toString());
      emit(GetInvoiceInfoErrorState(error.toString()));
    });
  }
}
