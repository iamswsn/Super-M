import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

import '../../../app_cubit/cubit.dart';

class OpenCameraOrGallerySheet extends StatelessWidget {
  const OpenCameraOrGallerySheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            onTap: () {
              Navigator.pop(context);
              AppCubit.get(context).uploadImage(
                  isProfile: true,
                  context: context,
                  source: ImageSource.camera,
                  isMultiImage: false);
            },
            leading: Icon(Icons.camera),
            title: Text('Camera'),
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
              AppCubit.get(context).uploadImage(
                  isProfile: true,
                  context: context,
                  source: ImageSource.gallery,
                  isMultiImage: false);
            },
            leading: Icon(Icons.picture_in_picture_rounded),
            title: Text('Gallery'),
          ),
        ],
      ),
    );
  }
}
