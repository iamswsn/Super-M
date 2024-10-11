import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:self_checker/models/view_cart_model.dart';
import 'package:self_checker/modules/customer/cart/cubit/states.dart';
import 'package:self_checker/modules/customer/checkout_screen/checkout_screen.dart';
import 'package:self_checker/shared/components/default_button/default_button.dart';
import 'package:self_checker/shared/constants/constants.dart';
import 'package:sizer/sizer.dart';

import '../../../shared/components/container_of_image/container_of_image.dart';
import '../../../shared/styles/colors.dart';
import 'cubit/cubit.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>ViewCartCubit()..viewCart(),
      child: BlocBuilder<ViewCartCubit,ViewCartStates>(
        builder:(context,state)=> Container(
          height:double.infinity,
          width: double.infinity,
          decoration:const  BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/background.png"),fit: BoxFit.cover)
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              centerTitle: true,
              title: Text(
                "My cart",
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                ),
              ),
              leading: InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 16.sp,
                  color: Colors.black,
                ),
              ),
            ),
            body: ConditionalBuilder(
              condition:  ViewCartCubit.get(context).getCartDone,
              fallback: (context)=>const Center(child:CircularProgressIndicator()),
              builder:(context)=> Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 5.h,
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(start: 6.w,end:0.w),
                      child: ListView.separated(
                        // shrinkWrap: true,
                        itemCount: ViewCartCubit.get(context).cartProducts.length,
                        separatorBuilder: (context, index) =>
                            SizedBox(
                              height: 3.h,
                            ),
                        itemBuilder: (context, index) =>
                            Row(
                              children: [
                                ContainerOfImage(
                                    image:
                                    imageLink+ViewCartCubit.get(context).cartProducts[index].product!.photo!),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      ViewCartCubit.get(context).cartProducts[index].product!.name!,
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 11.sp,
                                      ),
                                    ),
                                    SizedBox(height: 0.4.h,),
                                    Text(
                                      " quantity :  ${ViewCartCubit.get(context).cartProducts[index].total}",
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 8.sp,
                                      ),
                                    ),
                                    SizedBox(height: 1.h,),
                                    Text(
                                      "SAR ${double.parse(ViewCartCubit.get(context).cartProducts[index].total.toString())*double.parse(ViewCartCubit.get(context).cartProducts[index].product!.price.toString())}",
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12.sp,
                                      ),),
                                  ],
                                ),
                                  const  Spacer(),
                                InkWell(
                                  onTap: (){
                                    ViewCartCubit.get(context).deleteCartFromCart(cartID: ViewCartCubit.get(context).cartProducts[index].id!);
                                  },
                                  child: Container(
                                      height: 4.h,
                                      width: 25.w,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle, color: primaryColor),
                                      child: Icon(
                                        Icons.delete_outline_outlined, color: Colors.white,
                                        size: 15.sp,)),
                                )
                              ],
                            ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  //Spacer(),
                  Expanded(
                      child:
                      Container(
                        height: 15.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: HexColor("#DEE9FF"),
                            borderRadius: BorderRadiusDirectional.only(
                                topEnd: Radius.circular(15.sp),
                                topStart: Radius.circular(15.sp))
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 2.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Total items: ${ViewCartCubit.get(context).cartProducts.length}",
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14.sp,
                                ),
                              ),
                              SizedBox(height: 4.h,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      "SAR ${ViewCartCubit.get(context).cartTotal.toString()}",
                                      style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18.sp,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 6.w),
                                  Expanded(child: DefaultButton(text: "Checkout", onTap: () {
                                    List<CartDataModel> products=ViewCartCubit.get(context).cartProducts;
                                    String totalPrice=ViewCartCubit.get(context).cartTotal.toString();
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> CheckoutScreen(
                                      products: products,
                                      totalPrice: totalPrice,
                                    )));
                                  }))
                                ],
                              ),
                            ],
                          ),
                        ),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
