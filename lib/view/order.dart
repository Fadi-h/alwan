import 'dart:ui';

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
      height: MediaQuery.of(context).size.height * 0.08,
      decoration: BoxDecoration(
        color: MyTheme.isDarkTheme.value ?  Colors.transparent : Colors.white,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).dividerColor.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 10,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Center(
        child: Text('Orders',
          style: TextStyle(color: MyTheme.isDarkTheme.value ? Colors.white : Colors.black,fontSize: 26),
        ),
      ),
    );
  }

  _orderList(context){
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.08),
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index){
          return Column(
            children: [
              const SizedBox(height: 30),
              Container(
               // padding: const EdgeInsets.symmetric(vertical: 20),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                ),
                child: Row(
                  children: [
                    Column(
                      children: [

                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

}
