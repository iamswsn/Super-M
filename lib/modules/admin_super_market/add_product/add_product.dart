import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:self_checker/modules/admin_super_market/add_product/cubit/cubit.dart';
import 'package:self_checker/modules/admin_super_market/add_product/cubit/states.dart';
import 'package:self_checker/modules/admin_super_market/show_barcode_product/show_barcode_product.dart';
import 'package:sizer/sizer.dart';
import '../../../app_cubit/cubit.dart';
import '../../../app_cubit/states.dart';
import '../../../shared/components/add_main_photo/add_main_photo.dart';
import '../../../shared/components/default_button/default_button.dart';
import '../../../shared/components/default_text_form_field/default_text_form_field.dart';
import '../../../shared/components/profile_picture/profile_picture.dart';
import '../../../shared/styles/colors.dart';

class AddProductScreen extends StatelessWidget {
  AddProductScreen({super.key});

  var companyNameController = TextEditingController();
  var productNameController = TextEditingController();
  var priceController = TextEditingController();
  var serialNumberController = TextEditingController();
String type= "Please Choose from here";
List <String> items=["Seasonings","Gluten-free","Sodium-free"];
  static var addProductKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>AddProductCubit(),
      child: BlocConsumer<AddProductCubit,AddProductStates>(
        listener: (context,state){
          if(state is AddProductSuccessState){
            if(state.statusCode==201||state.statusCode==200){
              AppCubit.image=null;
              productNameController.clear();
              priceController.clear();
              serialNumberController.clear();
              companyNameController.clear();
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ShowBarCodeProduct(serialNumberProduct: serialNumberController.text,productName: productNameController.text,)));
          }
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
                title: Text("Add New Product",
                    style: GoogleFonts.poppins(fontSize: 11.sp, color: primaryColor)),
                centerTitle: true,
                backgroundColor: Colors.transparent,
                leading: Container()),
            body: Form(
              key: addProductKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.only(top: 4.h, end: 4.w, start:4.w),
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
                              controller: productNameController,
                              validate: (value) {
                                if(value!.isEmpty){
                                  return 'Product Name is required';
                                }
                              },
                              label: "Product Name"),
                          SizedBox(
                            height: 1.5.h,
                          ),
                          defaultTextFormField(
                              context: context,
                              type: TextInputType.text,
                              controller: companyNameController,
                              validate: (value) {
                                if(value!.isEmpty){
                                  return 'Company Name is required';
                                }
                              },
                              label: "Company Name"),
                          SizedBox(
                            height: 1.5.h,
                          ),
                          defaultTextFormField(
                              context: context,
                              type: TextInputType.number,
                              controller: priceController,
                              validate: (value) {
                                if(value!.isEmpty){
                                  return 'Price is required';
                                }
                              },
                              label: "Price"),
                          SizedBox(
                            height: 1.5.h,
                          ),
                          defaultTextFormField(
                              context: context,
                              type: TextInputType.number,
                              controller: serialNumberController,
                              validate: (value) {
                                if(value!.isEmpty){
                                  return 'Serial Number is required';
                                }
                              },
                              label: "Serial Number"),
                          SizedBox(height: 1.5.h,),
                          StatefulBuilder(
                            builder: (context,state) {
                              return Container(
                                height: 5.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(10.sp),border: Border.all(color:Colors.grey)),
                                child: DropdownButton(
                                  underline: Text(" "),
                                  isExpanded: true,
                                  elevation: 10,
                                  iconDisabledColor: Colors.grey,
                                  iconEnabledColor: primaryColor,
                                  icon: Padding(
                                    padding:
                                    EdgeInsetsDirectional.only(end: 5.w),
                                    child: const Icon(
                                        Icons.arrow_circle_down_sharp),
                                  ),
                                  borderRadius: BorderRadius.circular(10.sp),
                                  hint: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 2.w, vertical: 1.h),
                                    child: Text(
                                      type ?? " ",
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize: 11.sp),
                                    ),
                                  ),
                                  items: items
                                      .map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      alignment: Alignment.center,
                                      child: Material(
                                        elevation: 5,
                                        shadowColor: Colors.grey[400],
                                        child: Container(
                                            width: double.infinity,
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 2.w,
                                                  vertical: 1.h),
                                              child: Text(value,
                                                  textAlign: TextAlign.start),
                                            )),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    state((){
                                      type=newValue!;
                                    });
                                  },
                                ),
                              );
                            }
                          ),

                          SizedBox(
                            height: 8.h,
                          ),
                          ConditionalBuilder(
                            condition: state is! AddProductLoadingState,
                            fallback: (context)=>const Center(child: CircularProgressIndicator(),),
                            builder:(context)=> DefaultButton(
                              text: 'Save',
                              onTap: () {
                                if(addProductKey.currentState!.validate()&&AppCubit.image!=null&&type!="Please Choose from here"){
                                AddProductCubit.get(context).AddProduct(name: productNameController.text,
                             price: priceController.text,  companyName: companyNameController.text, serialNumber: serialNumberController.text,
                                    productType: type);
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
