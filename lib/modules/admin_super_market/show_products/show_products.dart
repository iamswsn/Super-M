import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:self_checker/modules/admin_super_market/show_product_details/show_product_details.dart';
import 'package:sizer/sizer.dart';

import '../../../shared/components/product_item/product_item.dart';
import '../../../shared/styles/colors.dart';

class ShowProductsScreen extends StatelessWidget {
  const ShowProductsScreen({super.key});

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
        appBar: AppBar(
            elevation: 0,
            toolbarHeight: 7.h,
            title: Text("All Products",
                style: GoogleFonts.poppins(fontSize: 11.sp, color: primaryColor)),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            leading: Container()),
        body: GridView.count(
          crossAxisCount:
              (MediaQuery.of(context).orientation == Orientation.landscape)
                  ? 4
                  : 2,
          crossAxisSpacing: 2.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 1 / 1.2,
          children: List.generate(
            12,
            (index) => Container(
                //0000 height: 450,
                child: ItemProduct(
              ontap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ShowProductDetailsScreen()
                ));
              },
              productImage: "https://img.freepik.com/free-vector/fresh-milk-with-text-banner_1308-6819.jpg?size=626&ext=jpg&ga=GA1.1.2008272138.1726531200&semt=ais_hybrid",
              price: 20.0,
              productName: "Milk",
            )),
          ),
        ),
      ),
    );
  }
}
