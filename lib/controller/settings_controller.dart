import 'package:alwan/helper/global.dart';
import 'package:alwan/helper/myTheme.dart';
import 'package:alwan/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {

  Rx<MyTheme> myTheme = MyTheme().obs;
  var selectedLanguage = 0.obs;
  String languageValue = "non";
  List languages = [
    { "name" : "English", "id" : "en" },
    { "name" : "العربية", "id" : "ar" }
  ].obs;


  changeMode(BuildContext context){
    myTheme.value.toggleTheme();
    MyApp.setTheme(context);
  }
}