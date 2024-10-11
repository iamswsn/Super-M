import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_checker/app_cubit/cubit.dart';
import 'package:self_checker/shared/network/bloc_observer.dart';
import 'package:self_checker/shared/network/local/local.dart';
import 'package:self_checker/shared/network/remote/remote.dart';
import 'package:sizer/sizer.dart';

import 'modules/splash_screen/splash_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  Sizer(builder: (context, orientation, devicetype){
      return MultiBlocProvider(
        providers: [
          BlocProvider<AppCubit>(create: (BuildContext context) => AppCubit()),
        ],
        child: MaterialApp(
          title: 'SUPER-M',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            // This is the theme of your application.
            //
            // TRY THIS: Try running your application with "flutter run". You'll see
            // the application has a purple toolbar. Then, without quitting the app,
            // try changing the seedColor in the colorScheme below to Colors.green
            // and then invoke "hot reload" (save your changes or press the "hot
            // reload" button in a Flutter-supported IDE, or press "r" if you used
            // the command line to start the app).
            //
            // Notice that the counter didn't reset back to zero; the application
            // state is not lost during the reload. To reset the state, use hot
            // restart instead.
            //
            // This works for code too, not just values: Most code changes can be
            // tested with just a hot reload.
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const SplashScreen(),
        ),
      );}
    );
  }
}


