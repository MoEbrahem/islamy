import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islamy/home/hadeth/hadeth_details.dart';
import 'package:islamy/home/homeScreen.dart';
import 'package:islamy/home/quran/quran_details.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:islamy/my_theme_Data.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamy/provider/app_config_provider.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  
  runApp(
    ChangeNotifierProvider(
    create: (context) => AppConfigProvider(),
    
    child: MyApp(
    
    ),
  ));
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      title: 'Islami',
      localizationsDelegates: const [
      AppLocalizations.delegate, // Add this line  
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
      supportedLocales: const [
      Locale('en'), // English
      Locale('ar'), // Spanish
    ],
      routes: {
        '/' : (context)=>HomeScreen(),
        Quran_details.route_Name  : (context) => Quran_details(),
        Hadeth_Details.route_Name : (context) => Hadeth_Details(),
      },
      theme: myLightTheme,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      locale: Locale(provider.LanguageCode),

    );
  }
}

