

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';

import 'package:sizer/sizer.dart';

import '../../../app_cubit/cubit.dart';
import '../../styles/colors.dart';
import '../open_camera_gallery/open_camera_gallery.dart';

class AddMainPhoto extends StatelessWidget {
  IconData icon;
  String text;
  String text1;
  dynamic colorText;
  dynamic coloricon;
  dynamic colorContainer;
  bool morePhoto;
  AddMainPhoto({
    required this.icon, required this.morePhoto,required this.text,required this.colorText,required this.coloricon, required this.text1, required this.colorContainer});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25.h,
      width: 50.w,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0), color:colorContainer),
      child:Column(
        children: [
          InkWell(
            onTap: (){
              if(morePhoto==false){    showModalBottomSheet(
                  context: context,
                  elevation: 5,
                  builder: (BuildContext contextz) =>
                  const   OpenCameraOrGallerySheet());}
            },
            child: Padding(
              padding: EdgeInsetsDirectional.only(top: 4.h),
              child: Icon(icon, color:coloricon,size: 22.sp,),
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          Text(
              text, style: GoogleFonts.poppins(color: primaryColor,fontSize: 12.sp)),
          SizedBox(
            height: 3.h,
          ),
          Padding(
            padding:  EdgeInsetsDirectional.only(start: 2.5.w),
            child: Text(
              text1, maxLines: 2, style: TextStyle(fontSize: 11.sp),),
          ),

        ],
      ),
    );
  }
}
