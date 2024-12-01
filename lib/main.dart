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
import 'package:flutter_localizations/flutter_localizations.dart';
import 'firebase_options.dart';
import 'presentaion/cart_padge/cubit/cubit.dart';
import 'presentaion/home_badge/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await SecureStorage.init();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    EasyLocalization(
      supportedLocales: S.delegate.supportedLocales,
      path: 'assets/translations', // Ensure this path matches your setup
      fallbackLocale: const Locale('en'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final routerDelegate = BeamerDelegate(
      locationBuilder: BeamerLocationBuilder(
        beamLocations: [HomeLocation()],
      ),
      notFoundRedirectNamed: '/',
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeCubit>(
          create: (context) => HomeCubit()..appLanguage(LanguageEventEnums.initiallanguage),
        ),
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => CartCubit()),
      ],
      child: BlocBuilder<HomeCubit, MainHomeState>(
        builder: (context, langState) {
          Locale? locale;
          if (langState is ChangeLanguage) {
            locale = Locale(langState.languageCode);
          }

          return MaterialApp.router(
            routerDelegate: routerDelegate,
            routeInformationParser: BeamerParser(),
            locale: locale,
            supportedLocales: S.delegate.supportedLocales,
            localizationsDelegates: [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            localeResolutionCallback: (deviceLocale, supportedLocales) {
              for (var locale in supportedLocales) {
                if (deviceLocale != null &&
                    deviceLocale.languageCode == locale.languageCode) {
                  return deviceLocale;
                }
              }
              return supportedLocales.first;
            },
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
          );
        },
      ),
    );
  }
}
