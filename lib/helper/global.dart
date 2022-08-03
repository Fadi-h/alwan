import 'package:alwan/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Global {

  static String langCode = "en";
  static String token = '';
  static int userId = -1;
  static String name = '';
  static String address1 = '';
  static String address2 = '';
  static String emirate = '';
  static String apartment = '';
  static String phone = '';

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

  static storeUserInformation(id, userName, username, address1, address2, emirate, apartment, phone) async {
    userId = id;
       await SharedPreferences.getInstance().then((prefs){
        prefs.setInt("id", id );
        prefs.setString("name", userName);
        prefs.setString("username", username);
        prefs.setString("address1", address1);
        prefs.setString("address2", address2);
        prefs.setString("emirate", emirate);
        prefs.setString("apartment", apartment);
        prefs.setString("phone", phone);
      });

  }

  static getUserInformation() async {
    try{
      SharedPreferences prefs= await SharedPreferences.getInstance();
      userId = prefs.getInt("id") ?? -1;
      name = prefs.getString('name') ?? "";
      address1 = prefs.getString('address1') ?? "";
      address2 = prefs.getString('address2') ?? "";
      emirate = prefs.getString('emirate') ?? "";
      apartment = prefs.getString('apartment') ?? "";
      phone = prefs.getString('phone') ?? "";
    }catch (e){

    }
  }

  static getUserToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token') ?? "";
  }

  static setUserToken (userToken) async {
    token = userToken;
    await SharedPreferences.getInstance().then((prefs){
      prefs.setString('token', token);
    });
  }



}