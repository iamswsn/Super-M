import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:self_checker/modules/admin/add_super_market/add_super_market.dart';
import 'package:self_checker/modules/admin/home_for_add_person/home_for_add_person.dart';
import 'package:self_checker/modules/admin/show_persons/show_persons.dart';
import 'package:self_checker/shared/components/container_item/container_item.dart';
import 'package:sizer/sizer.dart';

import '../../../shared/components/container_row_item/container_row_item.dart';
import '../../../shared/styles/colors.dart';
import '../../profile/profile.dart';

class HomeAdminScreen extends StatelessWidget {
  const HomeAdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height:double.infinity,
      width: double.infinity,
      decoration:const BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/background.png"),fit: BoxFit.cover)
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 2.h,),
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
      SizedBox(height: 20.h,),
              Row(
                children: [
                  Expanded(
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddSuperMarketScreen()));
                        },
                        child: const ContainerItem(
                            text: "Add Super Market", icon: Icons.add_circle),
                      )),
                  SizedBox(
                    width: 3.w,
                  ),
                  Expanded(
                      child: InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomeForAddPersonScreen()));
                          },
                          child: const ContainerItem(text: "Add Person", icon: Icons.add))),
                ],
              ),
              SizedBox(height:2.h),
              InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const ShowPersonsScreen()));
                  },
                  child: const ContainerRowItem(text: "Show Persons",icon: Icons.remove_red_eye,)),
              SizedBox(
                height: 6.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
