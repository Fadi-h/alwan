

import 'package:alwan/controller/home_controller.dart';
import 'package:alwan/helper/api.dart';
import 'package:alwan/model/product_list.dart';
import 'package:get/get.dart';

class ProductListController extends GetxController{

 RxList<ProductList> productsList = <ProductList>[].obs;
 HomeController homeController = Get.find();
 RxInt productId = (-1).obs;
 
 @override
  void onInit() {
    super.onInit();
    getData();
  }

  
  getData() async {
    await Api.getProductList(homeController.productIndex.value).then((value){
     if(value.isNotEmpty){
       print('Not empty');
        productsList.addAll(value);
     }else{
       print('empty');
      }
   });
  }
  

}