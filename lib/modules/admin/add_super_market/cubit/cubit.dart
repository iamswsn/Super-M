import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_parser/http_parser.dart';
import 'package:self_checker/modules/admin/add_super_market/cubit/states.dart';

import '../../../../app_cubit/cubit.dart';
import '../../../../shared/network/end_points/end_points.dart';
import '../../../../shared/network/remote/remote.dart';



class AddSuperMarketCubit extends Cubit<AddSuperMarketStates> {
  AddSuperMarketCubit() : super(AddSuperMarketInitialState());

  static AddSuperMarketCubit get(context) => BlocProvider.of(context);


  AddSuperMarket(
      { required String name,required String description}
      ) async {
    emit(AddSuperMarketLoadingState());
    FormData formData = FormData.fromMap({
      'name': name,
      'description': description,
      "photo": await MultipartFile.fromFile(
        File(AppCubit.image!.path).path,
        filename: "done.png",
        contentType: MediaType(
          "image",
          "png",
        ),
      ),
    });
    DioHelper.postDataWithImage(url: ADDSUPERMARKET, data: formData, length: 1)
        .then((value) {
      print(value.statusCode.toString());
      print(value.toString());
      emit(AddSuperMarketSuccessState(value.statusCode!));
    }).catchError((error) {
      print(error.toString());
      emit(AddSuperMarketErrorState(error.toString()));
    });
  }






}
