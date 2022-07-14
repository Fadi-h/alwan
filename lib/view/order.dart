import 'dart:ui';

import 'package:alwan/app_localization.dart';
import 'package:alwan/controller/intro_controller.dart';
import 'package:alwan/helper/myTheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderPage extends StatelessWidget {

  IntroController introController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            _orderList(context),
            _header(context),
          ],
        ),
      ),
    );
  }

  _header(context){
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: BoxDecoration(
        color: MyTheme.isDarkTheme.value ?  Colors.transparent : Colors.white,
      ),
      child: Center(
        child: Text(App_Localization.of(context).translate("orders"),
          style: TextStyle(color: MyTheme.isDarkTheme.value ? Colors.white : Colors.black,fontSize: 24),
        ),
      ),
    );
  }

  _orderList(context){
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.08),
      height: MediaQuery.of(context).size.height,
      color: !MyTheme.isDarkTheme.value ?  Colors.white : Colors.transparent,
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index){
          return Column(
            children: [
              const SizedBox(height: 30),
              Container(
                width: MediaQuery.of(context).size.width * 0.95,
                child: Text("Sep 23, 2022",
                  style: TextStyle(color: MyTheme.isDarkTheme.value ? Colors.white : Colors.black,fontSize: 16),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.18,
                decoration: BoxDecoration(
                  color: MyTheme.isDarkTheme.value ?
                  Colors.white.withOpacity(0.05) :
                  Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: MyTheme.isDarkTheme.value ?
                        Colors.transparent :
                        Colors.grey.withOpacity(0.5),
                        blurRadius: 3,
                        offset: const Offset(1, 1),
                      ),
                    ],
                ),
                child: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                              margin: EdgeInsets.symmetric(
                                vertical: 10, //MediaQuery.of(context).size.height * 0.02
                              ),
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("123435345353",
                                    style: TextStyle(color: MyTheme.isDarkTheme.value ? Colors.white : Colors.black,fontSize: 18),
                                  ),
                                  Text("\$4500",
                                    style: TextStyle(color: MyTheme.isDarkTheme.value ? Colors.white : Colors.black,fontSize: 16),
                                  ),
                                  SizedBox(height: 5,),
                                  Row(
                                    children: [
                                      Container(
                                        width: 15,
                                        height: 15,
                                        decoration: BoxDecoration(
                                          color: Colors.yellow,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      SizedBox(width: 10,),
                                      Text(App_Localization.of(context).translate("pending"),
                                        style: TextStyle(color: MyTheme.isDarkTheme.value ? Colors.white : Colors.black,fontSize: 16),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: MediaQuery.of(context).size.height * 0.02
                              ),                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage("https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/1-index-work-bags-ysl-fendi-everlane-1652465394.jpg?crop=0.381xw:0.763xh;0.609xw,0.138xh&resize=640:*")
                                  )
                              )
                          )
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }


}
