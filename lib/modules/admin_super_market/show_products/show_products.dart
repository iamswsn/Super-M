import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:self_checker/modules/admin_super_market/show_product_details/show_product_details.dart';
import 'package:self_checker/modules/admin_super_market/show_products/cubit/cubit.dart';
import 'package:self_checker/modules/admin_super_market/show_products/cubit/states.dart';
import 'package:sizer/sizer.dart';

import '../../../shared/components/product_item/product_item.dart';
import '../../../shared/constants/constants.dart';
import '../../../shared/styles/colors.dart';

class ShowProductsScreen extends StatelessWidget {
  const ShowProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>GetProductCubit()..getProducts(),
      child: BlocBuilder<GetProductCubit,GetProductStates>(
        builder:(context,state)=> Container(
          height:double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/background.png"),fit: BoxFit.cover)
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
                elevation: 0,
                toolbarHeight: 7.h,
                title: Text("All Products",
                    style: GoogleFonts.poppins(fontSize: 11.sp, color: primaryColor)),
                centerTitle: true,
                backgroundColor: Colors.transparent,
                leading: Container()),
            body: ConditionalBuilder(
              condition: GetProductCubit.get(context).getAllProductsDone,
              fallback: (context)=>const Center(child: CircularProgressIndicator(),),
              builder:(context)=> GridView.count(
                crossAxisCount:
                    (MediaQuery.of(context).orientation == Orientation.landscape)
                        ? 4
                        : 2,
                crossAxisSpacing: 2.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 1 / 1.2,
                children: List.generate(
                  GetProductCubit.get(context).products.length,
                  (index) => Container(
                      //0000 height: 450,
                      child: ItemProduct(
                    ontap: () {
                      var productPhoto=GetProductCubit.get(context).products[index].photo!;
                      var productName=GetProductCubit.get(context).products[index].name!;
                      var companyName=GetProductCubit.get(context).products[index].company_name!;
                      var serialNumber=GetProductCubit.get(context).products[index].serial_number!;
                      var productType=GetProductCubit.get(context).products[index].type!;
                      var price=GetProductCubit.get(context).products[index].price!;
var productID=GetProductCubit.get(context).products[index].id!;
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ShowProductDetailsScreen(price: price, productPhoto: productPhoto, productName: productName, serialNumber: serialNumber,
                          ProductID: productID, companyName: companyName, productType: productType)
                      ));
                    },
                    productImage:imageLink+GetProductCubit.get(context).products[index].photo!,
                    price: GetProductCubit.get(context).products[index].price.toString(),
                    productName: GetProductCubit.get(context).products[index].name,
                  )),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
