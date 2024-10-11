import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:self_checker/models/get_all_products_model.dart';
import 'package:self_checker/models/view_cart_model.dart';
import 'package:self_checker/modules/customer/checkout_screen/cubit/cubit.dart';
import 'package:self_checker/modules/customer/checkout_screen/cubit/states.dart';
import 'package:self_checker/modules/customer/invoice_qr/invoice_qr.dart';
import 'package:self_checker/shared/components/container_of_image/container_of_image.dart';
import 'package:self_checker/shared/components/default_button/default_button.dart';
import 'package:self_checker/shared/constants/constants.dart';
import 'package:sizer/sizer.dart';

class CheckoutScreen extends StatelessWidget {
  final List<CartDataModel>products;
final String totalPrice;

  const  CheckoutScreen({super.key,required this.products,required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>CheckOutCubit(),
      child: BlocConsumer<CheckOutCubit,CheckOutStates>(
        listener: (context,state){
          if(state is CheckOutSuccessState){
            var data=CheckOutCubit.get(context).checkOutModel.message!.id!;
            Navigator.push(context, MaterialPageRoute(builder: (context)=>QRInvoiceScreen(
              data: data,
            )));
          }
        },
        builder: (context,state) {
          return Container(
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
                  "Payment",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                  ),
                ),
                leading: Icon(
                  Icons.arrow_back_ios,
                  size: 16.sp,
                  color: Colors.black,
                ),
              ),
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        "Quantity",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700,
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      ListView.separated(
                        physics:const NeverScrollableScrollPhysics(),
                         shrinkWrap: true,
                        itemCount:products.length,
                        separatorBuilder: (context, index) => SizedBox(
                          height: 3.h,
                        ),
                        itemBuilder: (context, index) => Row(
                          children: [
                            ContainerOfImage(
                                image:imageLink+products[index].product!.photo!),
                            SizedBox(
                              width: 2.w,
                            ),
                            Text(
                              products[index].product!.name!,
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w700,
                                fontSize: 14.sp,
                              ),
                            ),
                           const Spacer(),
                            Text(
                              "x${products[index].total.toString()}",
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w700,
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        "Add payment method",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700,
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Row(
                        children: [
                        const   ContainerOfImage(image: "https://brand.mastercard.com/content/dam/mccom/brandcenter/thumbnails/mc_dla_symbol_92.png"),
                       SizedBox(width: 6.w,),
                          const ContainerOfImage(image: "https://flyclipart.com/thumb2/apple-pay-pay-payment-icon-png-and-vector-for-free-download-508510.png"),

                          SizedBox(width: 6.w,),

                        const   ContainerOfImage(
                              image:
                                  "https://cdn4.iconfinder.com/data/icons/logos-and-brands/512/250_Paypal_logo-512.png"),
                        ],
                      ),
                      SizedBox(height: 4.h,),
                      Center(child: DefaultButton(text: "Receipt split  ", onTap: (){})),
                      SizedBox(height: 6.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Total:",
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w700,
                              fontSize: 13.sp,
                            ),
                          ),
                          SizedBox(width:4.w),
                          Text(
                            "SAR ${totalPrice}",
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w700,
                              fontSize: 22.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height:2.h),
                  Center(child: DefaultButton(text: "Confirm Payment", onTap: (){
CheckOutCubit.get(context).getCheckOut();
                  })),
                      SizedBox(height:3.h),

                    ],
                  ),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
