
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../styles/colors.dart';

Widget defaultTextFormField({
  required context,
  String? labelText,
  TextEditingController? controller,
  required TextInputType type,
  String? Function(String? val)? onsubmit,
  String? Function(String val)? onchange,
  bool isPassword = false,
  bool isLocation = false,
  Function? onEdition,
  required String? Function(String? val)? validate,
  required String label,
  IconData? prefixIcon,
  Function? prefixPressed,
  IconData? suffix,
  Function? suffixPressed,
  bool isImage = false,
  Function?onClick,
  // Function? ontap,
  // bool ?autofocus,
}) {
  return TextFormField(
    controller: controller,
    obscureText: isPassword,
    //textAlign: TextAlign.end,
    keyboardType: type,
    onFieldSubmitted: onsubmit,
    onChanged: onchange,
    //onEditingComplete: (){onEdition!();},
    autocorrect: true,

    validator: validate,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    readOnly: isLocation ? true : false,
    onTap: (){
      isLocation?onClick!():null;
    },
    decoration: InputDecoration(
        filled: true,
        fillColor:Colors.white,
        //labelText: labelText != null ? labelText : null,
        labelStyle: TextStyle(color: isLocation?Colors.black:Colors.grey[500]),
        hintText: label,
        hintStyle:GoogleFonts.poppins(color: isLocation?Colors.black:Color(0xFFD7DEEB),fontSize: 10.sp),
        hintMaxLines: isLocation ? 3 : 1,
        enabledBorder: OutlineInputBorder(
          borderSide:  BorderSide(width: 0.8.sp, color: Colors.grey),
          borderRadius: BorderRadius.circular(15),
        ),
        // borderSide: const BorderSide(color: Colors.white54),
        // borderRadius: BorderRadius.circular(50.0)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),

        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(color:primaryColor),
          // borderRadius: BorderRadius.circular(50.0),
        ),
        // suffixIcon: isImage
        //     ? Padding(
        //   padding: const EdgeInsetsDirectional.only(end: 5),
        //   child: Image(
        //     image: AssetImage("images/phoneIcon.png"),
        //     height: 10,
        //     width: 10,
        //   ),
        // )
        //     : IconButton(
        //     icon: Icon(prefixIcon),
        //     onPressed: () {
        //       prefixPressed!();
        //     }),
        prefixIconColor: Colors.grey[400],
        focusColor: primaryColor,
        iconColor: primaryColor,
        isDense: true,
        // Added this
        contentPadding: EdgeInsetsDirectional.only(start: 5.w,top:1.h,bottom:2.h)
    ),
  );
}