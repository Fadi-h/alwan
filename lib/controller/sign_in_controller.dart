import 'dart:io';
import 'package:alwan/controller/intro_controller.dart';
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

}