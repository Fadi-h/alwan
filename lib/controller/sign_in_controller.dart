import 'dart:io';
import 'package:alwan/controller/intro_controller.dart';
import 'package:alwan/helper/api.dart';
import 'package:alwan/helper/myTheme.dart';
import 'package:alwan/view/main_class.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';


class SignInController extends GetxController{


  RxBool signUpOption = false.obs;
  RxBool showPassword = false.obs;
  RxBool showWhatsAppList = false.obs;
  RxBool showPhoneList = false.obs;
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  RxBool loading = false.obs;

  openWhatApp(BuildContext context,String msg,String phone) async{
    try {
      var whatsapp = phone;
      var whatsappURl_android = "whatsapp://send?phone="+whatsapp+"&text=$msg";
      var whatappURL_ios ="https://wa.me/$whatsapp?text=${Uri.parse(msg)}";
      if(Platform.isIOS){
        // for iOS phone only
        if( await canLaunch(whatappURL_ios)){
          await launch(whatappURL_ios, forceSafariVC: false);
        }else{
          showTopSnackBar(
            context,
            const CustomSnackBar.error(message: "whatsapp no installed"),
          );
        }
      }else{
        // android , web
        if( await canLaunch(whatsappURl_android)){
          await launch(whatsappURl_android);
        }else{
          showTopSnackBar(
            context,
            const CustomSnackBar.error(message: "whatsapp no installed"),
          );
        }
      }
    } catch(e) {
      print(e.toString());
    }
  }
  openPhone(String phone) async{
    if(Platform.isAndroid){
      final Uri launchUri = Uri(
        scheme: 'tel',
        path: phone,
      );
      // print(introController.customerServiceList[index].phone);
      await launch(launchUri.toString());
    }else if (Platform.isIOS){
      launch("tel://$phone");
      // print(introController.customerServiceList[index].phone);
    }
  }

  login(){


    if(username.text.isNotEmpty){
      if(password.text.isNotEmpty){
        loading.value = true;
        Api.login(username.text, password.text).then((value){
          print(username.text);
          print(password.text);
          if(value.id == -1){
            // email or password is wrong
            mySnackBar('Wrong Email or password', 'Please try again');
            loading.value = false;
          }else if (value.id == -2){
            // something went wrong
            mySnackBar('Something is wrong', 'Please try again');
            loading.value = false;
          }else{
            /// todo
            // fetch data
            Get.snackbar(
                'Successfully login',
              'Welcome to alwan app',
                margin: EdgeInsets.only(top: 30,left: 25,right: 25),
              backgroundColor: MyTheme.isDarkTheme.value ? Colors.grey.withOpacity(0.5) : Colors.black.withOpacity(0.5),
              colorText: Colors.white
            );
            loading.value = false;
            Get.to(()=>MainClass());
          }
        });
      }else{
        /// password empty
        mySnackBar('Password is empty', 'Please enter your password');
      }
    }else{
      /// username empty
      mySnackBar('Email is empty', 'Please enter your email');
    }
  }

  mySnackBar(title, description){
    return Get.snackbar(
        title,
        description,
        margin: EdgeInsets.only(top: 30,left: 25,right: 25),
        colorText: Colors.white,
    );
  }

}