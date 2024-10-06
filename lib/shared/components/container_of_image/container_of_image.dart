import 'package:flutter/material.dart';
import 'package:self_checker/shared/styles/colors.dart';
import 'package:sizer/sizer.dart';

class ContainerOfImage extends StatelessWidget {
  final String image;
  const ContainerOfImage({super.key,required this.image});

  @override
  Widget build(BuildContext context) {
    return                     Container(
      height: 8.h,
      width: 25.w,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(9.sp),
          //border: Border.all(color: primaryColor),
          image:  DecorationImage(
              image: NetworkImage(
                  image))),
    );
  }
}
