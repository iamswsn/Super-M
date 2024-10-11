
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_parser/http_parser.dart';
import 'package:self_checker/modules/admin_super_market/add_product/cubit/states.dart';
import 'package:self_checker/shared/constants/constants.dart';

import '../../../../app_cubit/cubit.dart';
import '../../../../shared/network/end_points/end_points.dart';
import '../../../../shared/network/remote/remote.dart';

class AddProductCubit extends Cubit<AddProductStates> {
  AddProductCubit() : super(AddProductInitialState());

  static AddProductCubit get(context) => BlocProvider.of(context);


  AddProduct(
      { required String name,required String price,
        required String companyName,required String serialNumber,required String productType}) async {

    emit(AddProductLoadingState());
    FormData formData = FormData.fromMap({
      'name': name,
      'description': "",
      'price': price,
      "company_name":companyName,
      'serial_number':serialNumber,
      'type':productType,
      "supermarket_id":supermarketID,
      "photo": await MultipartFile.fromFile(
        File(AppCubit.image!.path).path,
        filename: "done.png",
        contentType: MediaType(
          "image",
          "png",
        ),
      ),
    });
    DioHelper.postDataWithImage(url: ADDPRODUCT, data: formData, length: 1)
        .then((value) {
      print(value.statusCode.toString());
      print(value.toString());
      emit(AddProductSuccessState(value.statusCode!));
    }).catchError((error) {
      print(error.toString());
      emit(AddProductErrorState(error.toString()));
    });
  }
}