import 'package:beamer/beamer.dart';
import 'package:camerastore/presentaion/auth/cubit/cubit.dart';
import 'package:camerastore/presentaion/auth/login.dart';
import 'package:camerastore/presentaion/auth/sign_up.dart';
import 'package:camerastore/presentaion/cart_padge/cart_screen.dart';
import 'package:camerastore/presentaion/check_out/screen_check_out.dart';
import 'package:camerastore/presentaion/home_badge/cubit/cubit.dart';
import 'package:camerastore/presentaion/home_badge/home_screen.dart';
import 'package:camerastore/utils/route/route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';
import 'presentaion/cart_padge/cubit/cubit.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height);
    print(MediaQuery.of(context).size.width);
    final routerDelegate = BeamerDelegate(
      locationBuilder: BeamerLocationBuilder(
        beamLocations: [HomeLocation()],
      ),
      notFoundRedirectNamed: '/',
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>HomeCubit()),
        BlocProvider(create: (context)=>LoginCubit()),
        BlocProvider(create: (context)=>CartCubit()),
      ],
    // child: MaterialApp.router(
    //   routerDelegate: routerDelegate,
    //   routeInformationParser: BeamerParser(),
    //   debugShowCheckedModeBanner: false,
    //   backButtonDispatcher:
    //   BeamerBackButtonDispatcher(delegate: routerDelegate),
    //
    // ),);
    child: MaterialApp(
    home: CartScreen(),
    ) );
  }
}