import 'package:alwan/app_localization.dart';
import 'package:alwan/helper/global.dart';
import 'package:alwan/helper/myTheme.dart';
import 'package:alwan/helper/store.dart';
import 'package:alwan/view/intro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

void main() {
  ///to fadi
  runApp( MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: MyTheme.isDarkTheme.value ? Colors.black : Colors.white,
  ));
}
class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  static void set_local(BuildContext context , Locale locale){
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state!.set_locale(locale);
  }

  static void setTheme(BuildContext context){
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state!.setDark();
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Locale? _locale;
  Rx<MyTheme> myTheme = MyTheme().obs;

  void set_locale(Locale locale){
    setState(() {
      _locale=locale;
    });
  }

  @override
  void initState() {
    Store.loadTheme().then((value) {
      MyTheme.isDarkTheme.value = !value;
    });
    Global.loadLanguage().then((language) {
      setState(() {
        _locale= Locale(language);
      });
    });
    super.initState();
  }

  void setDark(){
    setState(() {
      myTheme.value.myTheme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: myTheme.value.myTheme,
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
        locale: _locale,
        supportedLocales: [Locale('en', ''), Locale('ar', '')],
        localizationsDelegates: const [
          App_Localization.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        localeResolutionCallback: (local, supportedLocales) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == local!.languageCode) {
              Global.langCode = supportedLocale.languageCode;
              return supportedLocale;
            }
          }
          return supportedLocales.first;
        },
      home: Intro()
    );
  }
}
