
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_checker/modules/admin_super_market/show_product_details/cubit/states.dart';
import 'package:self_checker/shared/constants/constants.dart';
import '../../../../shared/network/remote/remote.dart';

class ShowProductDetailsCubit extends Cubit<ShowProductDetailsStates> {
  ShowProductDetailsCubit() : super(ShowProductDetailsInitialState());

  static ShowProductDetailsCubit get(context) => BlocProvider.of(context);
static  var companyNameController;
static var  productNameController;
static  var priceController;
static var   serialNumberController;
  static String type="";
  showProductDetails({required String companyName,required String productName,required String productType,required String productPrice,required String serialNumber}){
      companyNameController = TextEditingController(text:companyName);
     productNameController = TextEditingController(text:productName);
     priceController = TextEditingController(text:productPrice);
      serialNumberController = TextEditingController(text: serialNumber);
       type= productType;
      emit(ShowProductDetailsSuccessState());
  }
  updateProduct({required int productID,required String linkImage}) async {

    emit(UpdateProductLoadingState());
    FormData formData = FormData.fromMap({
      'name': productNameController.text,
      'description': "",
      'price': priceController.text,
      "company_name":companyNameController.text,
      'serial_number':serialNumberController.text,
      'type':type,
      "supermarket_id":supermarketID,
      "photo": linkImage
    });
    DioHelper.postDataWithImage(url: "products/$productID", data: formData, length: 1)
        .then((value) {
      print(value.statusCode.toString());
      print(value.toString());
      emit(UpdateProductSuccessState(value.statusCode!));
    }).catchError((error) {
      print(error.toString());
      emit(UpdateProductErrorState(error.toString()));
    });
  }

  deleteProduct({required int productID}){
    emit(DeleteProductLoadingState());
    DioHelper.deleteData(url: "products/$productID",token: token.toString())
    .then((value){
      emit(DeleteProductSuccessState(value.statusCode!));
    })
    .catchError((error){
      print(error.toString());
      emit(DeleteProductErrorState(error.toString()));
    });
  }

}