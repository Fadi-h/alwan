import 'package:alwan/app_localization.dart';
import 'package:alwan/controller/addresses_controller.dart';
import 'package:alwan/helper/myTheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Addresses extends StatelessWidget {

  AddressController addressController = Get.put(AddressController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            MyTheme.isDarkTheme.value ? Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/image/background.png')
                    )
                )
            ) : Text(''),
            SingleChildScrollView(
                child: Column(
                  children: [
                    _header(context),
                  ],
                ),
            ),
          ],
        ),
      ),
    ));
  }

  _header(context){
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: BoxDecoration(
        color: MyTheme.isDarkTheme.value ?  Colors.transparent : Colors.white,
      ),
      child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    Get.back();
                  },
                  child: Container(
                    child: Icon(Icons.arrow_back_ios_outlined,
                      color: MyTheme.isDarkTheme.value ? Colors.white : Colors.black,
                      size: 30,),
                  ),
                ),
                Text(App_Localization.of(context).translate("my_address"),
                  style: TextStyle(color: MyTheme.isDarkTheme.value ? Colors.white : Colors.black,fontSize: 26),
                ),
                Container(
                  child: const Icon(Icons.arrow_back_ios_outlined,color: Colors.transparent,size: 30,),
                ),
              ],
            ),
          )
      ),
    );
  }
}
