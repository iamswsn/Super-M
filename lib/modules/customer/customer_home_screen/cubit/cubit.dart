import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_checker/modules/customer/customer_home_screen/cubit/states.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';
import 'package:sizer/sizer.dart';

import '../../../../models/get_all_products_model.dart';
import '../../../../shared/constants/constants.dart';
import '../../../../shared/network/end_points/end_points.dart';
import '../../../../shared/network/remote/remote.dart';
import '../../product_details_bottom_sheet/bottomsheet_product_details.dart';


class CustomerHomeCubit extends Cubit<CustomerHomeStates> {
  CustomerHomeCubit() : super(HomeInitialState());

  static CustomerHomeCubit get(context) => BlocProvider.of(context);
  String result = "no thing";



  Future<void> scanQrCode({required context}) async {
    try {
      FlutterBarcodeScanner.scanBarcode('#201937', 'cancel', true, ScanMode.DEFAULT).then((barcode) {
        result = barcode.substring(1,barcode.length-1).toString();
        print("iii" + result.substring(1,result.length-1));
        searchInProducts(context: context,serialNumber: result.toString());
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
  late GetAllProductsModel getAllProductsModel;
  bool getAllProductsDone=false;
  List<ProductDataModel>products=[];
  List<ProductDataModel>selectedProduct=[];
  getProducts()  {
    getAllProductsDone=false;
    emit(GetProductLoadingState());

    DioHelper.getDataWithBearerToken(url: ADDPRODUCT, token: token.toString())
        .then((value) {
      print(value.data.toString());
      getAllProductsModel=GetAllProductsModel.fromJson(value.data);
      products=getAllProductsModel.data.toList();
      getAllProductsDone=true;
      emit(GetProductSuccessState(value.statusCode!));
    }).catchError((error) {
      print(error.toString());
      emit(GetProductErrorState(error.toString()));
    });
  }

  searchInProducts({required String serialNumber,required context}){
    print("jj"+serialNumber);
    selectedProduct=products.where((element)=>element.serial_number==serialNumber.toString()).toList();
    print(selectedProduct[0].name.toString());

    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => BottomsheetProductDetails(
          productName: selectedProduct[0].name!,
          price: selectedProduct[0].price.toString(),
            productType: selectedProduct[0].type!,
          productID: selectedProduct[0].id!,
        ),
        shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadiusDirectional.vertical(
                top: Radius.circular(30.sp))));

    emit(SearchProductState());
  }
}
