import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled7/BloC/CapUser/cap_user_bloc.dart';
import 'package:untitled7/Bloc/Event_Creation/event_bloc.dart';
import 'package:untitled7/Bloc/LogIn/log_in_bloc.dart';

import 'BloC/All_Event/all_event_bloc.dart';
import 'Repository/API/Event_Api.dart';


import 'UI/Register/log_in_page.dart';
import 'UI/View/splash_screen.dart';
import 'UI/s1.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => LogInBloc()),
            BlocProvider(create: (context) => EventBloc()),
            BlocProvider(create: (context) => AllEventBloc()),
            BlocProvider(create: (context) => CapUserBloc()),
          ],
          child: MaterialApp(
            title: 'Captain',
            theme:
            // ThemeData.dark(
            //     useMaterial3: true,
            //
            // ),
            ThemeData(

              colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey.shade900),
              useMaterial3: true,
              fontFamily: 'Montserrat',
            ),
            debugShowCheckedModeBanner: false,
            home: const SplashScreen(),
          ),
        );
      },
    );
  }
}
