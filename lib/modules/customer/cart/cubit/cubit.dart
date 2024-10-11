import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_checker/modules/customer/cart/cubit/states.dart';
import 'package:self_checker/shared/constants/constants.dart';
import '../../../../models/view_cart_model.dart';
import '../../../../shared/network/remote/remote.dart';

class ViewCartCubit extends Cubit<ViewCartStates> {
  ViewCartCubit() : super(ViewCartInitialState());

  static ViewCartCubit get(context) => BlocProvider.of(context);
late ViewCartModel viewCartModel;
List<CartDataModel> cartProducts=[];
bool getCartDone=false;

  viewCart(){
    getCartDone=false;
    emit(ViewCartLoadingState());
    DioHelper.getDataWithBearerToken(url: "cart/$id",token: token.toString())
    .then((value){
      viewCartModel=ViewCartModel.fromJson(value.data);
      cartProducts=viewCartModel.data.toList();
      viewProductTotalPrice();
      getCartDone=true;
      emit(ViewCartSuccessState(value.statusCode!));
    }).catchError((error){
      print(error.toString());
      emit(ViewCartErrorState(error.toString()));
    });
  }

  deleteCartFromCart({required int cartID}){
    emit(DeleteCartLoadingState());
    DioHelper.deleteData(url: "cart/$cartID",token: token.toString())
        .then((value){
          print(value.data.toString());
          print(cartID);
      cartProducts.removeWhere((element)=>
        element.id==cartID
      );
      print(cartProducts.length.toString());
      viewProductTotalPrice();
      emit(DeleteCartSuccessState(value.statusCode!));
    })
        .catchError((error){
      print(error.toString());
      emit(DeleteCartErrorState(error.toString()));
    });
  }

  double cartTotal = 0.0;
  viewProductTotalPrice(){
    cartTotal=0.0;
   for(int i=0;i<cartProducts.length;i++){
     cartTotal=(double.parse(cartProducts[i].total.toString())*double.parse(cartProducts[i].product!.price.toString()))+cartTotal;
   }
   print(cartTotal.toString());
   emit(ViewCartSuccessState(200));
  }

}