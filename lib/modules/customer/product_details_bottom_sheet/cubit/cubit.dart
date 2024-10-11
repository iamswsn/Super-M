import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_checker/modules/customer/product_details_bottom_sheet/cubit/states.dart';
import 'package:self_checker/shared/network/end_points/end_points.dart';
import 'package:self_checker/shared/network/remote/remote.dart';

import '../../../../shared/constants/constants.dart';

class AddToCartCubit extends Cubit<AddToCartStates> {
  AddToCartCubit() : super(AddToCartInitialState());

  static AddToCartCubit get(context) => BlocProvider.of(context);

  int quanity=1;
  double totalprice=0.0;
  double actualPrice=0.0;

  first({required double price}){
    totalprice=price;
    actualPrice=price;
    emit(ShowPriceState());
  }

  changeQuantity({required bool increase}){
    if(increase){
      quanity++;
    }
    if(!increase){
      quanity--;
    }
    calculatePrice(increase: increase);
    emit(ChangeQuantityState());
  }

  calculatePrice({required bool increase}){
    if(increase){
      totalprice=totalprice+actualPrice;
    }
    if(!increase){
      totalprice=totalprice-actualPrice;    }

emit(CalculatePriceState());
}

addToCart({required int productID,}){
    emit(AddToCartLoadingState());
    DioHelper.postDataWithBearearToken(url: ADDTOCART, data: {

        "product_id":productID,
        "user_id":id,
        "total":quanity,
        "type":"cart" // 'cart','paid','invoiced'

    },token: token.toString())
    .then((value){
      print(value.data.toString());
      emit(AddToCartSuccessState());
    })
    .catchError((error){
      print(error.toString());
      emit(AddToCartErrorState(error.toString()));
    });
}

}