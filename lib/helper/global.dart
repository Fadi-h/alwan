import 'package:alwan/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Global {

  static String langCode = "en";

  static saveLanguage(BuildContext context , String lang){
    SharedPreferences.getInstance().then((prefs){
      prefs.setString("language", lang);
      langCode = lang;
      MyApp.set_local(context, Locale(lang));
      Get.updateLocale(Locale(lang));
    });
  }

  static Future<String> loadLanguage()async{
    try{
      SharedPreferences prefs= await SharedPreferences.getInstance();
      String lang = prefs.getString("language")??'def';
      if(lang!="def"){
        langCode = lang;
      }else{
        langCode="en";
      }
      Get.updateLocale(Locale(langCode));
      return langCode;
    }catch(e){
      return "en";
    }
  }
}