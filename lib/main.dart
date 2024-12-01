import 'package:beamer/beamer.dart';
import 'package:camerastore/generated/l10n.dart';
import 'package:camerastore/presentaion/auth/cubit/cubit.dart';
import 'package:camerastore/presentaion/home_badge/cubit/cubit.dart';
import 'package:camerastore/presentaion/home_badge/cubit/state.dart';
import 'package:camerastore/presentaion/home_badge/model/model.dart';
  import 'package:camerastore/utils/route/route.dart';
import 'package:camerastore/utils/seq/seq.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';
import 'presentaion/cart_padge/cubit/cubit.dart';
import 'presentaion/home_badge/home_screen.dart';
// pass Shehab@842000
void main() async{

  await WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await SecureStorage.init();
  // CachedVariables.lang = await SecureStorage.getData(
  //   key: CachedKeys.lang,
  // );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
      MyApp()
    // EasyLocalization(
      // supportedLocales: [Locale('en'), Locale('ar')],
      // path: 'assets/lang', // <-- change the path of the translation files
      // fallbackLocale: Locale('en'),
      // saveLocale: true,
      // useOnlyLangCode: true,
      // child:MyApp())
  );
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
        BlocProvider<HomeCubit>(
          create: (context) =>
    HomeCubit()..appLanguage(LanguageEventEnums.initiallanguage),
        ),
        BlocProvider(create: (context)=>LoginCubit()),
        BlocProvider(create: (context)=>CartCubit()),
        BlocProvider(create: (context)=>HomeCubit()),
      ],

    // child: MaterialApp.router(
    //   localeListResolutionCallback: (allLocales, supportedLocales) {
    //     final locale = allLocales?.first.languageCode;
    //     if (locale == 'en') {
    //       CachedVariables.lang = locale;
    //       return const Locale('en');
    //     } else {
    //       CachedVariables.lang = locale;
    //       // lang='ar';
    //     }
    //     if (CachedVariables.lang == null) {
    //       SecureStorage.saveData(key: CachedKeys.lang, value: locale!)
    //           .then((value) async {
    //         CachedVariables.lang = await SecureStorage.getData(
    //           key: CachedKeys.lang,
    //         );
    //       });
    //     }
    //     return null;
    //   },
    //   localizationsDelegates: context.localizationDelegates,
    //   supportedLocales: context.supportedLocales,
    //   locale: context.locale,
    //   routerDelegate: routerDelegate,
    //   routeInformationParser: BeamerParser(),
    //   debugShowCheckedModeBanner: false,
    //   backButtonDispatcher:
    //   BeamerBackButtonDispatcher(delegate: routerDelegate),
    // ),);
    child: MaterialApp(
      // localeListResolutionCallback: (allLocales, supportedLocales) {
      //   final locale = allLocales?.first.languageCode;
      //   if (locale == 'en') {
      //     CachedVariables.lang = locale;
      //     return const Locale('en');
      //   } else {
      //     CachedVariables.lang = locale;
      //     // lang='ar';
      //   }
      //   if (CachedVariables.lang == null) {
      //     SecureStorage.saveData(key: CachedKeys.lang, value: locale!)
      //         .then((value) async {
      //       CachedVariables.lang = await SecureStorage.getData(
      //         key: CachedKeys.lang,
      //       );
      //     });
      //   }
      //   return null;
      // },
      // localizationsDelegates: context.localizationDelegates,
      // supportedLocales: context.supportedLocales,
      // locale: context.locale,
    child: BlocBuilder<HomeCubit, MainHomeState>(
    builder: (context, langState) {
    Locale? locale;
    if (langState is ChangeLanguage) {
    locale = Locale(langState.languageCode);
    }
    return MaterialApp(
    locale: locale,
    supportedLocales: S.delegate.supportedLocales,
    localizationsDelegates: const [
    S.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    ],
    localeResolutionCallback: (deviceLocale, supportedLocales) {
    for (var locale in supportedLocales) {
    if (deviceLocale != null) {
    if (deviceLocale.languageCode == locale.languageCode) {
    return deviceLocale;
    }
    }
    }
    return supportedLocales.first;
    },

      home:const HomeScreen(),
    ) );
  }
}