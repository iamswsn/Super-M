import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:self_checker/modules/customer/product_details_bottom_sheet/cubit/cubit.dart';
import 'package:self_checker/modules/customer/product_details_bottom_sheet/cubit/states.dart';
import 'package:self_checker/shared/styles/colors.dart';
import 'package:sizer/sizer.dart';

import '../../../shared/components/divider_bottom_sheet/divider_bottom_sheet.dart';

class BottomsheetProductDetails extends StatelessWidget {
  final String productName;
  final String productType;
  final String price;
  final int productID;
  const BottomsheetProductDetails({super.key,required  this.productID,required this.productName,required this.productType,required this.price});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>AddToCartCubit()..first(price: double.parse(price.toString())),
      child: BlocConsumer<AddToCartCubit,AddToCartStates>(
        listener: (context,state){
          if(state is AddToCartSuccessState){
            Navigator.pop(context);
          }
        },
        builder:(context,state)=> SizedBox(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 3.h,
              ),
              const DividerBottomSheet(),
              SizedBox(
                height: 4.h,
              ),
              Padding(
                  padding: EdgeInsetsDirectional.only(start: 8.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                       productName,
                        style: GoogleFonts.poppins(
                            fontSize: 18.sp, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 0.6.h,
                      ),
                      // Text(
                      //   "Badia",
                      //   style: GoogleFonts.poppins(
                      //       fontWeight: FontWeight.w600,
                      //       fontSize: 14.sp,
                      //       color: Colors.grey[400]),
                      // ),
                      SizedBox(
                        height: 0.6.h,
                      ),
                      Container(
                        height: 6.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.sp),
                          color: HexColor("#BCCDF1")
                        ),
                        child: Center(
                          child: Text(productType,
                            style: GoogleFonts.poppins(fontSize: 12.5.sp,fontWeight: FontWeight.w600),),

                        ),
                      ),
                      SizedBox(height: 2.h,),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "SAR ${AddToCartCubit.get(context).totalprice.toString()}",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 22.sp),
                            ),
                          ),
                          SizedBox(width: 6.w,),
                          Expanded(child:
                          Row(
                            children: [
                              InkWell(
                                 onTap:(){
                                   AddToCartCubit.get(context).quanity<=1 ?  null :AddToCartCubit.get(context).changeQuantity(increase: false);
                          },
                                child: Container(
                                    height: 3.7.h,
                                    width: 8.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(3.sp),
                                        color: AddToCartCubit.get(context).quanity<=1 ? Colors.grey:primaryColor
                                    ),
                                    child: Icon(Icons.remove,color: Colors.white,size: 20.sp,)),
                              ),
                              SizedBox(width: 5.w,),
                              Container(
                                  height: 3.7.h,
                                  width: 8.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3.sp),
                                      color: primaryColor
                                  ),child: Center(child: Text("${AddToCartCubit.get(context).quanity}",
                                style: GoogleFonts.inter(color: Colors.white,fontSize: 15.sp,
                                    fontWeight: FontWeight.w600),))),
                              SizedBox(width: 5.w,),
                              InkWell(
                                  onTap: (){
                                    AddToCartCubit.get(context).changeQuantity(increase: true);
                                  },
                                  child: Icon(Icons.add_box,color: primaryColor,size: 32.sp,)),

                            ],
                          ))
                        ],
                      ),
                      SizedBox(height: 3.h,),
                      ConditionalBuilder(
                        condition: state is! AddToCartLoadingState,
                        fallback: (builder)=>const Center(child: CircularProgressIndicator(),),
                        builder:(context)=> Center(
                          child: InkWell(
                                        onTap: (){

                                          AddToCartCubit.get(context).addToCart(productID: productID);
                                          },
                                child: Material(
                                  borderRadius:BorderRadius.circular(9.sp) ,
                                  shadowColor: Colors.grey,
                                  child: Container(
                                    height: 6.h,
                                    width: 60.w,
                                    decoration: BoxDecoration(color: HexColor("#CBDAF8"),
                                      borderRadius: BorderRadius.circular(9.sp),),
                                    child: Center(
                                      child: Text("Add to cart", style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,fontSize: 13.sp
                                      )),),),
                                ),
                              ),
                        ),
                      ),
                      SizedBox(height:2.h)

                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
