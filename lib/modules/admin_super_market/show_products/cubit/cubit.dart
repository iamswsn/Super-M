


import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_parser/http_parser.dart';
import 'package:self_checker/models/get_all_products_model.dart';
import 'package:self_checker/modules/admin_super_market/show_products/cubit/states.dart';
import 'package:self_checker/shared/constants/constants.dart';

import '../../../../app_cubit/cubit.dart';
import '../../../../shared/network/end_points/end_points.dart';
import '../../../../shared/network/remote/remote.dart';

class GetProductCubit extends Cubit<GetProductStates> {
  GetProductCubit() : super(GetProductInitialState());

  static GetProductCubit get(context) => BlocProvider.of(context);
late GetAllProductsModel getAllProductsModel;
bool getAllProductsDone=false;
List<ProductDataModel>products=[];
  getProducts()  {
    getAllProductsDone=false;
    emit(GetProductLoadingState());

    DioHelper.getDataWithBearerToken(url: ADDPRODUCT, token: token.toString())
        .then((value) {
      print(value.data.toString());
getAllProductsModel=GetAllProductsModel.fromJson(value.data);
products=getAllProductsModel.data.where((product)=>product.supermarket_id.toString()==supermarketID).toList();
getAllProductsDone=true;
      emit(GetProductSuccessState(value.statusCode!));
    }).catchError((error) {
      print(error.toString());
      emit(GetProductErrorState(error.toString()));
    });
  }
}