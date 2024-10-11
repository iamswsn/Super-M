import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:self_checker/modules/customer/cart/cart_screen.dart';
import 'package:self_checker/modules/customer/customer_home_screen/cubit/cubit.dart';
import 'package:self_checker/modules/customer/customer_home_screen/cubit/states.dart';
import 'package:self_checker/modules/profile/profile.dart';
import 'package:sizer/sizer.dart';
import '../../../shared/components/container_row_item/container_row_item.dart';
import '../../../shared/styles/colors.dart';

class CustomerHomeScreen extends StatelessWidget {
  const CustomerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(BuildContext context)=>CustomerHomeCubit()..getProducts(),
      child: BlocConsumer<CustomerHomeCubit,CustomerHomeStates>(
        listener: (context,state){},
        builder:(context,state)=> Container(
          height:double.infinity,
          width: double.infinity,
          decoration:const  BoxDecoration(
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
                            CustomerHomeCubit.get(context).scanQrCode(context: context);                    },
                          child: const ContainerRowItem(text: " Scan BarCode", icon: Icons.qr_code_scanner)),
                      SizedBox(height: 2.h,),
                      InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>const CartScreen()));
                          },
                          child: const ContainerRowItem(text: " View Cart", icon: Icons.shopping_cart)),
                      SizedBox(height: 6.h,),
                    ],
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
