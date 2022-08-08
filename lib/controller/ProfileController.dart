import 'package:alwan/app_localization.dart';
import 'package:alwan/helper/api.dart';
import 'package:alwan/helper/app.dart';
import 'package:alwan/helper/global.dart';
import 'package:alwan/view/sign_in.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {

    RxBool loading = false.obs;
    var note = TextEditingController();

    requsetLastStatment(BuildContext context){

      if(Global.userId==-1){
        Get.offAll(()=>SignIn());
      }else{
        loading.value = true;
        Api.requestStatement("note", Global.userId).then((value) {
          loading.value = false;
          note.clear();
          if(value){
            App.mySnackBar(App_Localization.of(context).translate("req_state_succ_t"), App_Localization.of(context).translate("req_state_succ_d"));
          }else{
            App.mySnackBar(App_Localization.of(context).translate("oops_t"), App_Localization.of(context).translate("oops_d"));
          }
        });
      }
    }
}