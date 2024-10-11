import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_parser/http_parser.dart';
import 'package:self_checker/models/get_all_super_markets_model.dart';
import 'package:self_checker/modules/admin/add_person/cubit/states.dart';
import 'package:self_checker/shared/constants/constants.dart';
import 'package:self_checker/shared/network/end_points/end_points.dart';
import '../../../../app_cubit/cubit.dart';
import '../../../../shared/network/remote/remote.dart';



class AddPersonCubit extends Cubit<AddPersonStates> {
  AddPersonCubit() : super(AddPersonInitialState());

  static AddPersonCubit get(context) => BlocProvider.of(context);


  AddPerson(
      { required String name,required String email,required String password,required String phone,required String Type}) async {

    emit(AddPersonLoadingState());
    FormData formData = FormData.fromMap({
      'name': name,
      'email': email,
      'password': password,
      "password_confirmation":password,
      'phone':phone,
      'user_type':Type,
      "supermarket_id":superMarketid
    });
    DioHelper.postDataWithImage(url: REGISTER, data: formData, length: 1)
        .then((value) {
      print(value.statusCode.toString());
      print(value.toString());
      emit(AddPersonSuccessState(value.statusCode!));
    }).catchError((error) {
      print(error.toString());
      emit(AddPersonErrorState(error.toString()));
    });
  }


late GetAllSuperMarketsModel getAllSuperMarketsModel;
  bool getSuperMarketsDone = false;
  Map<int, String> SuperMarketsWithid = {};
  List<String> items=[];
  Map<String, int> SuperMarketsWithString = {};
  int ?superMarketid;
  String? superMarket;
   getAllSuperMarkets(){
  getSuperMarketsDone=false;
    emit(GetAllSuperMarketsLoadingState());
    DioHelper.getData(url: ADDSUPERMARKET,token: token.toString())
    .then((value){
      getAllSuperMarketsModel=GetAllSuperMarketsModel.fromJson(value.data);
      getAllSuperMarketsModel.data.forEach((element) {
        SuperMarketsWithid.addAll({element.id!: element.name!});
      });
      getAllSuperMarketsModel.data.forEach((element) {
        SuperMarketsWithString.addAll({element.name!: element.id!});
      });
      for(int i=0;i<getAllSuperMarketsModel.data.length;i++){
        items.add(getAllSuperMarketsModel.data[i].name!);
      }
      superMarket=getAllSuperMarketsModel.data[0].name;
      superMarketid=SuperMarketsWithString[getAllSuperMarketsModel.data[0].name];
      getSuperMarketsDone=true;
      emit(GetAllSuperMarketsSuccessState(value.statusCode!));
    }).catchError((error){
      emit(GetAllSuperMarketsErrorState(error.toString()));
    });
}

  changeSuperMarket({required String newSuperMarket}){
    superMarket=newSuperMarket;
    superMarketid=SuperMarketsWithString[superMarket];
    print(superMarketid);
    emit(ChangeSuperMarketState());
  }


}
