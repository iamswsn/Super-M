

import 'package:flutter/material.dart';

import '../../styles/colors.dart';

Widget profilePicture({required Widget profile,
  required context,
  required Function cameraUpload,
  required Function galleryUpload}) =>
    Padding(
      padding: const EdgeInsetsDirectional.only(top: 5),
      child: Center(
          child: Stack(alignment: Alignment.bottomLeft, children: [
            profile,
            CircleAvatar(
              radius: 17,
              child: IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        elevation: 5,
                        builder: (BuildContext contextz) =>
                            Directionality(
                              textDirection: TextDirection.rtl,
                              child: Container(
                                height: 120,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ListTile(
                                      onTap: () {
                                        cameraUpload();
                                      },
                                      leading: Icon(Icons.camera),
                                      title: Text( 'Camera'),
                                    ),
                                    ListTile(
                                      onTap: () {
                                        galleryUpload();
                                      },
                                      leading:
                                      Icon(Icons.picture_in_picture_rounded),
                                      title: Text( 'Gallery'),
                                    ),
                                  ],
                                ),
                              ),
                            ));
                  },
                  icon: Center(
                    child: Icon(
                      Icons.camera_alt_outlined,
                      size: 17,
                      color: Colors.grey[200],
                    ),
                  )),
              backgroundColor: primaryColor,
            )
          ])),
    );