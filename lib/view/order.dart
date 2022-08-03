import 'dart:async';
import 'dart:ui';
import 'package:alwan/app_localization.dart';
import 'package:alwan/controller/intro_controller.dart';
import 'package:alwan/controller/order_controller.dart';
import 'package:alwan/helper/myTheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderPage extends StatelessWidget {

  IntroController introController = Get.find();
  OrderController orderController = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    return Obx((){
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
    });
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
    return RefreshIndicator(
      onRefresh: () async {
        orderController.getOrderData();
      },
      child: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.08),
        height: MediaQuery.of(context).size.height,
        color: !MyTheme.isDarkTheme.value ?  Colors.white : Colors.transparent,
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: 600),
          child: orderController.loading.value
              ? Center(child: CircularProgressIndicator(),)
              : ListView.builder(
            itemCount: orderController.myOrders.length,
            itemBuilder: (context, index){
              var dateTime = orderController.calculateTime(index);
              orderController.setOrderState(index);
              return Column(
                children: [
                  const SizedBox(height: 20),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.95,
                    child: Text(orderController.convertTime(orderController.myOrders[index].deadline.toString()),
                      style: TextStyle(color: MyTheme.isDarkTheme.value ? Colors.white : Colors.black,fontSize: 14),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.19,
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
                                    Text(
                                      orderController.myOrders[index].title,
                                      maxLines: 2,
                                      style: TextStyle(color: MyTheme.isDarkTheme.value ? Colors.white : Colors.black,fontSize: 16),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        text: orderController.myOrders[index].price.toString(),
                                        style: TextStyle(color: MyTheme.isDarkTheme.value ? Colors.white : Colors.black,fontSize: 16),
                                        children: [
                                          TextSpan(text: ' AED', style: TextStyle(color: MyTheme.isDarkTheme.value ? Colors.white : Colors.black,fontSize: 14)),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width: 12,
                                          height: 12,
                                          decoration: BoxDecoration(
                                            color: Colors.yellow,
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          orderController.myOrders[index].orderState,
                                          style: TextStyle(color: MyTheme.isDarkTheme.value ? Colors.white : Colors.black,fontSize: 14),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                                flex: 2,
                                child: orderController.myOrders[index].ready.value == true
                                    ? Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    _buildTimeWidget(context, 'Months',dateTime[0]),
                                    SizedBox(width: 5),
                                    _buildTimeWidget(context, 'Days',dateTime[1]),
                                    SizedBox(width: 5),
                                    _buildTimeWidget(context, 'Hours', dateTime[2]),
                                  ],
                                )
                                    : Text('ready')
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
        ),
      ),
    );
  }

  _buildTimeWidget(context, title, text){
    return   Expanded(
      flex: 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.09 - 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Center(
              child: Text(
                '$text',
                style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),
              ),
            ),
          ),
          SizedBox(height: 6),
          Text(
              '$title',
            style: TextStyle(fontSize: 10, color: Colors.white),
          )
        ],
      ),
    );
  }
}
