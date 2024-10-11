import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_checker/models/checkout_model.dart';
import 'package:self_checker/modules/customer/checkout_screen/cubit/states.dart';
import 'package:self_checker/shared/network/remote/remote.dart';

import '../../../../shared/constants/constants.dart';

class CheckOutCubit extends Cubit<CheckOutStates> {
  CheckOutCubit() : super(CheckOutInitialState());

  static CheckOutCubit get(context) => BlocProvider.of(context);

  late CheckOutModel checkOutModel;

  getCheckOut(){
    emit(CheckOutLoadingState());
    DioHelper.putDataWithBearearToken(url: "cart/$id", token: token.toString())
    .then((value){
      checkOutModel=CheckOutModel.fromJson(value.data);
      emit(CheckOutSuccessState(value.statusCode!));
    }).catchError((error){
      print(error.toString());
      emit(CheckOutErrorState(error.toString()));
    });
  }

}