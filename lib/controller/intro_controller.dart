

import 'package:alwan/helper/api.dart';
import 'package:alwan/model/start_up.dart';
import 'package:alwan/view/sign_in.dart';
import 'package:get/get.dart';

class IntroController extends GetxController{

  RxList<Category> categoriesList = <Category>[].obs;
  RxList<CustomerService> customerServiceList = <CustomerService>[].obs;
  RxList<MyBanner> bannerList = <MyBanner>[].obs;
  RxList<SuggestionSearch> searchSuggestionList = <SuggestionSearch>[].obs;

  @override
  void onInit(){
    super.onInit();
   getData();
   //  Api.checkInternet();
  }



  getData()async{
    Api.getStartUpData().then((data){
      categoriesList.value = data.categories;
      customerServiceList.value = data.customerService;
      searchSuggestionList.value = data.suggestionSearch;
      bannerList.value = data.banners;
      print(categoriesList.length);
      print(customerServiceList.length);
      print(searchSuggestionList.length);
      print(bannerList.length);
      Future.delayed(const Duration(milliseconds: 0 )).then((value){
        Get.to(()=>SignIn());
      });
    });
    //Get.to(()=>SignIn());
  }




}