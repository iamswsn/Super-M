

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:self_checker/modules/admin_super_market/home_admin_super_market/home_admin_super_market.dart';
import 'package:self_checker/modules/admin_super_market/show_product_details/cubit/states.dart';
import 'package:self_checker/shared/constants/constants.dart';
import 'package:sizer/sizer.dart';

import '../../../shared/components/default_button/default_button.dart';
import '../../../shared/components/default_text_form_field/default_text_form_field.dart';
import '../../../shared/styles/colors.dart';
import 'cubit/cubit.dart';

class ShowProductDetailsScreen extends StatelessWidget {
  final String companyName;
  final String productName;
  final String price;
  final String serialNumber;
  final String productType;
  final String productPhoto;
  final int ProductID;
   ShowProductDetailsScreen({super.key,required this.price,required this.ProductID,required this.productPhoto,required this.productName,required this.serialNumber,required this.companyName,required this.productType});



  List <String> items=["Seasonings","Gluten-free","Sodium-free"];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>ShowProductDetailsCubit()..showProductDetails(companyName: companyName, productName: productName, productType: productType, productPrice: price, serialNumber: serialNumber),
      child: BlocConsumer<ShowProductDetailsCubit,ShowProductDetailsStates>(
        listener:(context,state){
          if(state is UpdateProductSuccessState||state is DeleteProductSuccessState){
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomeAdminSuperMarketScreen()), (route) => false,);
          }
        },
        builder:(context,state)=> Container(
          height:double.infinity,
          width: double.infinity,
          decoration:const BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/background.png"),fit: BoxFit.cover)
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
                elevation: 0,
                toolbarHeight: 7.h,
                title: Text(productName,
                    style: GoogleFonts.poppins(fontSize: 11.sp, color: primaryColor)),
                centerTitle: true,
                backgroundColor: Colors.transparent,
                leading: Container()),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding:
                    EdgeInsetsDirectional.only(top: 4.h, end: 4.w, start:4.w),
                    child: Column(
                      children: [
                      Container(
                        height: 25.h,
                        width: 50.w,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0),
                            image: DecorationImage(fit: BoxFit.cover,
                                image: NetworkImage(
                                  imageLink+productPhoto
                                )))),


                        SizedBox(
                          height: 3.h,
                        ),

                        defaultTextFormField(
                            context: context,
                            type: TextInputType.text,
                            controller: ShowProductDetailsCubit.productNameController,
                            validate: (value) {},
                            label: "Product Name"),
                        SizedBox(
                          height: 1.5.h,
                        ),
                        defaultTextFormField(
                            context: context,
                            type: TextInputType.text,
                            controller: ShowProductDetailsCubit.companyNameController,
                            validate: (value) {},
                            label: "Company Name"),
                        SizedBox(
                          height: 1.5.h,
                        ),
                        defaultTextFormField(
                            context: context,
                            type: TextInputType.text,
                            controller: ShowProductDetailsCubit.priceController,
                            validate: (value) {},
                            label: "Price"),
                        SizedBox(
                          height: 1.5.h,
                        ),
                        defaultTextFormField(
                            context: context,
                            type: TextInputType.text,
                            controller: ShowProductDetailsCubit.serialNumberController,
                            validate: (value) {},
                            label: "Serial Number"),
                        SizedBox(height: 1.5.h,),
                        StatefulBuilder(
                            builder: (context,state) {
                              return Container(
                                height: 5.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(10.sp),border: Border.all(color:Colors.grey)),
                                child: DropdownButton(
                                  underline: Text(" "),
                                  isExpanded: true,
                                  elevation: 10,
                                  iconDisabledColor: Colors.grey,
                                  iconEnabledColor: primaryColor,
                                  icon: Padding(
                                    padding:
                                    EdgeInsetsDirectional.only(end: 5.w),
                                    child: const Icon(
                                        Icons.arrow_circle_down_sharp),
                                  ),
                                  borderRadius: BorderRadius.circular(10.sp),
                                  hint: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 2.w, vertical: 1.h),
                                    child: Text(
                                      ShowProductDetailsCubit.type ?? " ",
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize: 11.sp),
                                    ),
                                  ),
                                  items: items
                                      .map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      alignment: Alignment.center,
                                      child: Material(
                                        elevation: 5,
                                        shadowColor: Colors.grey[400],
                                        child: Container(
                                            width: double.infinity,
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 2.w,
                                                  vertical: 1.h),
                                              child: Text(value,
                                                  textAlign: TextAlign.start),
                                            )),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    state((){
                                      ShowProductDetailsCubit.type=newValue!;
                                    });
                                  },
                                ),
                              );
                            }
                        ),

                        SizedBox(
                          height: 6.h,
                        ),
                        ConditionalBuilder(
                          condition: state is! UpdateProductLoadingState,
                          fallback: (context)=>Center(child: CircularProgressIndicator(),),
                          builder:(context)=> DefaultButton(
                            text: 'Edit',
                            onTap: () {
                              ShowProductDetailsCubit.get(context).updateProduct(productID: ProductID,linkImage: productPhoto);
                            },
                          ),
                        ),
        SizedBox(height:2.h),
                        ConditionalBuilder(
                          condition: state is! DeleteProductLoadingState,
                          fallback: (context)=>Center(child: CircularProgressIndicator(),),
                          builder:(context)=> DefaultButton(
                            text: 'Delete',
                            color: Colors.red,
                            onTap: () {
                              ShowProductDetailsCubit.get(context).deleteProduct(productID: ProductID);

                            },
                          ),
                        ),

                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );

  }
}
