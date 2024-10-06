
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DividerBottomSheet extends StatelessWidget {
  const DividerBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 0.5.h,
          color: Colors.grey[400],
          width: 38.w,
        ),
      ],
    );
  }
}
