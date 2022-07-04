import 'package:alwan/controller/intro_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class HomeController extends GetxController{


  RxInt categoryIndex = 0.obs;
  ItemScrollController itemScrollController = ItemScrollController();



 Future scrollToItem(index, lastIndex) async{
    itemScrollController.scrollTo(
        index: index,
      alignment: index == 0 ? 0 : index == lastIndex - 1 ? 0.5 : 0.4,
      curve: Curves.fastOutSlowIn,
      duration: const Duration(milliseconds: 1000)
    );
  }





}