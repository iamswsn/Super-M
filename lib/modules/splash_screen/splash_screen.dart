import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';
import '../../shared/styles/colors.dart';
import '../login_screen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 4), (() {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
            (route) => false,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height:double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/background.png"),fit: BoxFit.cover)
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SizedBox(
          width: double.infinity,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/logo.png",height: 30.h,),
                SizedBox(
                  height: 0.5.h,
                ),
                Text("In your pocket",style:GoogleFonts.poppins(
                    color:Colors.blueGrey,fontWeight:FontWeight.w300,fontSize:9.sp))
              ]),
        ),
      ),
    );
  }
}
