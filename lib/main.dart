import 'package:alwan/helper/myTheme.dart';
import 'package:alwan/view/intro.dart';
import 'package:alwan/view/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  // static void setTheme(BuildContext context){
  //   _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
  //   state!.setDark();
  // }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  void setDark(){
    setState(() {
      myTheme.value.myTheme;
    });
  }

  Rx<MyTheme> myTheme = MyTheme().obs;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: myTheme.value.myTheme,
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      home: Intro()
    );
  }
}
