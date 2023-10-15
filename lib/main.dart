import 'package:flora/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'Localization/demo_localization.dart';
import 'Localization/localization_constants.dart';
import 'elements/colors.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  //SystemChrome.setEnabledSystemUIOverlays(<SystemUiOverlay>[]);
  runApp(const MyApp());
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Constants.primaryColor()
    ..backgroundColor = Colors.white
    ..indicatorColor = Constants.primaryColor()
    ..textColor = Constants.primaryColor()
    ..maskColor = Colors.transparent
    ..userInteractions = true
    ..dismissOnTap = false;
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static void setLocale(BuildContext context, Locale locale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state!.setLocale(locale);
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      setState(() {
        _locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    if (_locale == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return MaterialApp(
        title: 'خمسين وردة',
        builder: EasyLoading.init(),
        debugShowCheckedModeBanner: false,
        initialRoute: '/Splash',
        onGenerateRoute: RouteGenerator.generateRoute,
        theme: ThemeData(
          primarySwatch: Colors.pink,
          fontFamily:'GE',
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        locale: _locale,
        supportedLocales: const [Locale('en', 'US'), Locale('ar', 'EG')],
        localizationsDelegates: const [
          DemoLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        localeResolutionCallback: (deviceLocale, supportedLocales) {
          for (var locale in supportedLocales) {
            if (locale.languageCode == deviceLocale!.languageCode &&
                locale.countryCode == deviceLocale.countryCode) {
              return deviceLocale;
            }
          }
          return supportedLocales.first;
        },
        //home: TestShareApp(),
      );
    }
  }
}

