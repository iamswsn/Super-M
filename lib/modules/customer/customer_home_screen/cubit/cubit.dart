import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_checker/modules/customer/customer_home_screen/cubit/states.dart';
import 'package:sizer/sizer.dart';

import '../../product_details_bottom_sheet/bottomsheet_product_details.dart';


class CustomerHomeCubit extends Cubit<CustomerHomeStates> {
  CustomerHomeCubit() : super(HomeInitialState());

  static CustomerHomeCubit get(context) => BlocProvider.of(context);
  String result = "no thing";

  Future<void> scanQrCode({required context}) async {
    try {
      FlutterBarcodeScanner.scanBarcode('#201937', 'cancel', true, ScanMode.QR)
          .then((value) {
        result = value.toString();
        print("iii" + result);
        showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => BottomsheetProductDetails(),
            shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadiusDirectional.vertical(
                    top: Radius.circular(30.sp))));
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
