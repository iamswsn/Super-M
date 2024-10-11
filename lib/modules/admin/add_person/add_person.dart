import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:self_checker/modules/admin/add_person/cubit/cubit.dart';
import 'package:self_checker/modules/admin/add_person/cubit/states.dart';
import 'package:sizer/sizer.dart';
import '../../../shared/components/default_button/default_button.dart';
import '../../../shared/components/default_text_form_field/default_text_form_field.dart';
import '../../../shared/styles/colors.dart';
import '../home_admin_screen/home_admin_screen.dart';

class AddPersonScreen extends StatelessWidget {
  final String type;
   AddPersonScreen({super.key,required this.type});
var personNameController=TextEditingController();
var personEmailController=TextEditingController();
var personPasswordController=TextEditingController();
  var personPhoneController=TextEditingController();
  static var addPersonKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>AddPersonCubit()..getAllSuperMarkets(),
      child: BlocConsumer<AddPersonCubit,AddPersonStates>(
        listener: (context,state){
          if(state is AddPersonSuccessState){
            Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=>HomeAdminScreen()), (route) => false,);
          }
        },
        builder:(context,state)=> Container(
          height:double.infinity,
          width: double.infinity,
          decoration:const BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/background.png"),fit: BoxFit.cover)
          ),
          child: ConditionalBuilder(
            condition: AddPersonCubit.get(context).getSuperMarketsDone,
            fallback: (context)=>const Center(child: CircularProgressIndicator(),),
            builder:(context)=> Scaffold(
              backgroundColor: Colors.transparent,
              body: Form(
                key: addPersonKey,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 15.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Add $type" ,
                          style: GoogleFonts.poppins(
                            color: primaryColor,
                            fontSize: 25.sp,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 1.5.h,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.sp),
                          ),
                          child: Padding(
                            padding:  EdgeInsetsDirectional.only(top: 4.h,start: 3.w,end: 3.w),
                            child: Column(
                              //mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Create an account for this $type",
                                  style: GoogleFonts.inter(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13.sp),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Text(
                                  "Enter his data to can sign in for this app", style: GoogleFonts.inter(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10.sp),
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),
                                defaultTextFormField(context: context,
                                    type: TextInputType.name,
                                    controller: personNameController,
                                    validate: (value) {
                                  if(value!.isEmpty){
                                    return 'person name is required';
                                  }
                                    },
                                    label: "Ahmed"),
                                SizedBox(height: 1.5.h,),
                                defaultTextFormField(context: context,
                                    type: TextInputType.name,
                                    controller: personPhoneController,
                                    validate: (value) {
                                      if(value!.isEmpty){
                                        return 'person phone is required';
                                      }
                                    },
                                    label: "+9666525221"),
                                SizedBox(height: 1.5.h,),
                                defaultTextFormField(context: context,
                                    controller: personEmailController,
                                    type: TextInputType.emailAddress,
                                    validate: (value) {
                if(!value!.contains("@")){
                  return 'please Enter valid email';
                }
                if(!value!.contains(".com")){
                  return 'Please enter valid email';
                }
                if(value!.isEmpty){
                  return 'Email Address is required';
                }
                                    },
                                    label: "email@domain.com"),

                                SizedBox(height: 1.5.h,),
                                defaultTextFormField(context: context,
                                    type: TextInputType.text,
                                    controller: personPasswordController,
                                    validate: (value) {
                                  if(value!.isEmpty){
                                    return 'person password is required';
                                  }
                                    },
                                    label: "Enter Password"),
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
                                              AddPersonCubit.get(context).superMarket ?? " ",
                                              textAlign: TextAlign.start,
                                              style: GoogleFonts.poppins(
                                                  color: Colors.black,
                                                  fontSize: 11.sp),
                                            ),
                                          ),
                                          items: AddPersonCubit.get(context).items
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
                                           AddPersonCubit.get(context).changeSuperMarket(newSuperMarket: newValue!);
                                            });
                                          },
                                        ),
                                      );
                                    }
                                ),
                                SizedBox(height: 3.h,),
                                ConditionalBuilder(
                                  condition: state is! AddPersonLoadingState,
                                  fallback: (context)=>const Center(child: CircularProgressIndicator(),),
                                    builder:(context)=> DefaultButton(text:"Save",onTap: (){
                                      if(addPersonKey.currentState!.validate()){
                                      print(type);
                                      AddPersonCubit.get(context).AddPerson(name: personNameController.text,
                                          email: personEmailController.text,
                                          Type: type,
                                          password: personPasswordController.text, phone: personPhoneController.text);
                                    }},)),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),

            ),
          ),
        ),
      ),
    );
  }
}
