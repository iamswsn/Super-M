

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:self_checker/modules/admin_super_market/add_product/add_product.dart';
import 'package:self_checker/modules/admin_super_market/show_products/show_products.dart';
import 'package:sizer/sizer.dart';

import '../../../shared/components/container_row_item/container_row_item.dart';
import '../../../shared/styles/colors.dart';
import '../../profile/profile.dart';

class HomeAdminSuperMarketScreen extends StatelessWidget {
  const HomeAdminSuperMarketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height:double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/background.png"),fit: BoxFit.cover)
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 9.h,),
              Row(
                //    mainAxisAlignment: MainAxisAlignment.start,
                //  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Home" ,
                    style: GoogleFonts.poppins(
                      color: primaryColor,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Spacer(),
                  InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));
                      },
                      child: Icon(Icons.person_sharp,size: 25.sp,color: Colors.blueGrey,))
                ],
              ),
              SizedBox(
                height: 1.5.h,
              ),
              Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    " ",
                    style: GoogleFonts.inter(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 13.sp),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),

                  InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>AddProductScreen()));
                      },
                      child: const ContainerRowItem(text: " Add Product", icon: Icons.add_shopping_cart)),
                  SizedBox(height: 3.h,),
                  InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ShowProductsScreen()));
                      },
                      child: const ContainerRowItem(text: " Show Products", icon: Icons.shopping_bag_outlined)),
                  SizedBox(height: 8.h,),
                ],
              )
            ],
          ),
        ),

      ),
    );
  }
}
