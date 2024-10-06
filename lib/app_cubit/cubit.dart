
import 'dart:io';
import 'states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  late ImageSource imagesource;
  static File? image;
  static List<XFile>? multiImage;
  final imagePicker = ImagePicker();

  Future uploadImage(
      {required BuildContext context,
        bool isMultiImage = false,
        bool isProfile = false,
        required ImageSource source}) async {
    if (isMultiImage == false) {
      var pickedImage = await imagePicker.getImage(
          source: source, imageQuality: 50, maxHeight: 500, maxWidth: 500);
      if (pickedImage != null) {
        image = File(pickedImage.path);
        emit(GetSourceOfImageState());
      } else {}
    } else {
      var multiImagepicker = await imagePicker.pickMultiImage();
      if (multiImagepicker != null) {
        multiImage = multiImagepicker;
        /*multiImage.forEach((element) {
multiImagepicker.add(XFile(element.path));
       });*/
      } else {}
    }

    emit(GetSourceOfImageState());
  }}