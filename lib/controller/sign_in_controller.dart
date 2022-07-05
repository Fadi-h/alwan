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

  openWhatApp(BuildContext context,String msg,int index,IntroController introController) async{
    try {
      var whatsapp = introController.customerServiceList[index].phone;
      var whatsappURl_android = "whatsapp://send?phone="+whatsapp+"&text=$msg";
      var whatappURL_ios ="https://wa.me/$whatsapp?text=${Uri.parse(msg)}";
      if(Platform.isIOS){
        // for iOS phone only
        if( await canLaunch(whatappURL_ios)){
          await launch(whatappURL_ios, forceSafariVC: false);
        }else{
          showTopSnackBar(
            context,
            CustomSnackBar.error(message: "whatsapp no installed"),
          );
        }
      }else{
        // android , web
        if( await canLaunch(whatsappURl_android)){
          await launch(whatsappURl_android);
        }else{
          showTopSnackBar(
            context,
            CustomSnackBar.error(message: "whatsapp no installed"),
          );
        }
      }
    } catch(e) {
      print(e.toString());
    }
  }
  openPhone(IntroController introController,int index) async{
    if(Platform.isAndroid){
      final Uri launchUri = Uri(
        scheme: 'tel',
        path: introController.customerServiceList[index].phone,
      );
      // print(introController.customerServiceList[index].phone);
      await launch(launchUri.toString());
    }else if (Platform.isIOS){
      launch("tel://${introController.customerServiceList[index].phone}");
      // print(introController.customerServiceList[index].phone);
    }
  }

}