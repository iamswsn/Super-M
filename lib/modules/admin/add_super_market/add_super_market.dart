import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:self_checker/modules/admin/add_super_market/cubit/cubit.dart';
import 'package:self_checker/modules/admin/add_super_market/cubit/states.dart';
import 'package:self_checker/modules/admin/home_admin_screen/home_admin_screen.dart';
import 'package:self_checker/modules/admin/home_for_add_person/home_for_add_person.dart';
import 'package:sizer/sizer.dart';
import '../../../app_cubit/cubit.dart';
import '../../../app_cubit/states.dart';
import '../../../shared/components/add_main_photo/add_main_photo.dart';
import '../../../shared/components/default_button/default_button.dart';
import '../../../shared/components/default_text_form_field/default_text_form_field.dart';
import '../../../shared/components/profile_picture/profile_picture.dart';
import '../../../shared/styles/colors.dart';

class AddSuperMarketScreen extends StatelessWidget {
  AddSuperMarketScreen({super.key});

  var supermarketNameController = TextEditingController();
  var descriptionController = TextEditingController();
  static var addSuperMarketKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>AddSuperMarketCubit(),
      child: BlocConsumer<AddSuperMarketCubit,AddSuperMarketStates>(
        listener: (context,state){
          if(state is AddSuperMarketSuccessState){
            if(state.statusCode==201||state.statusCode==200){
              AppCubit.image=null;
              Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=>HomeAdminScreen()), (route) => false,);
            }
          }
          if(state is AddSuperMarketErrorState){

          }
        },
        builder:(context,state)=> Container(
          height:double.infinity,
          width: double.infinity,
          decoration:const  BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/background.png"),fit: BoxFit.cover)
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
                elevation: 0,
                toolbarHeight: 7.h,
                title: Text("Add Super-Market",
                    style: GoogleFonts.poppins(fontSize: 11.sp, color: primaryColor)),
                centerTitle: true,
                backgroundColor: Colors.transparent,
                leading: Container()),
            body: Form(
              key: addSuperMarketKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.only(top: 4.h, end: 4.w, start: 4.w),
                      child: Column(
                        children: [
                          BlocBuilder<AppCubit, AppStates>(
                            builder: (context, state) => AppCubit.image == null
                                ? Center(
                                    child: AddMainPhoto(
                                      morePhoto: false,
                                      colorContainer: HexColor("#ECECEC"),
                                      icon: Icons.add_circle,
                                      text: 'Add a main photo',
                                      colorText: primaryColor,
                                      coloricon: primaryColor,
                                      text1: 'this photo show for users',
                                    ),
                                  )
                                : profilePicture(
                                    profile: CircleAvatar(
                                        radius: 50,
                                        backgroundImage:
                                            Image.file(AppCubit.image!).image),
                                    context: context,
                                    cameraUpload: () {
                                      Navigator.pop(context);
                                      AppCubit.get(context).uploadImage(
                                          isProfile: true,
                                          context: context,
                                          source: ImageSource.camera,
                                          isMultiImage: false);
                                    },
                                    galleryUpload: () {
                                      Navigator.pop(context);
                                      AppCubit.get(context).uploadImage(
                                          isProfile: true,
                                          context: context,
                                          source: ImageSource.gallery,
                                          isMultiImage: false);
                                    }),
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          defaultTextFormField(
                              context: context,
                              type: TextInputType.text,
                              controller: supermarketNameController,
                              validate: (value) {
                                if(value!.isEmpty){
                                  return 'Super-Market Name is required';
                                }
                              },
                              label: "Super-Market Name"),
                          SizedBox(
                            height: 1.5.h,
                          ),
                          defaultTextFormField(
                              context: context,
                              type: TextInputType.text,
                              controller: descriptionController,
                              validate: (value) {
                                if(value!.isEmpty){
                                  return 'Super-Market Description is required';
                                }
                              },
                              label: "Description"),
                          SizedBox(
                            height: 15.h,
                          ),
                          ConditionalBuilder(
                            condition: state is! AddSuperMarketLoadingState,
                            fallback: (context)=>const Center(child: CircularProgressIndicator(),),
                            builder:(context)=> DefaultButton(
                              text: 'Save',
                              onTap: () {
                                if(addSuperMarketKey.currentState!.validate()&&AppCubit.image!=null){
                                AddSuperMarketCubit.get(context).AddSuperMarket(name: supermarketNameController.text,
                                    description: descriptionController.text);
                              }},
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
