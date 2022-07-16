

import 'package:alwan/helper/api.dart';
import 'package:alwan/model/start_up.dart';
import 'package:alwan/view/sign_in.dart';
import 'package:get/get.dart';

class IntroController extends GetxController{

  RxList<Category> categoriesList = <Category>[].obs;
  RxList<SubCategories> tempCategoriesList = <SubCategories>[].obs;
  RxList<CustomerService> customerServiceList = <CustomerService>[].obs;
  RxList<MyBanner> bannerList = <MyBanner>[].obs;
  RxList<SuggestionSearch> searchSuggestionList = <SuggestionSearch>[].obs;
  RxInt contactIndex = 0.obs;


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
      Future.delayed(const Duration(milliseconds: 2000 )).then((value){
        Get.offAll(()=>SignIn());
      });
    });
    //Get.to(()=>SignIn());
  }

  search(String query,index){
    List<SubCategories> dummySearchList = <SubCategories>[];
    dummySearchList.addAll(categoriesList[index].subCategories);
    if(query.isNotEmpty) {
      List<SubCategories> dummyListData = <SubCategories>[];
      for (var product in dummySearchList) {
        if(product.title.toLowerCase().contains(query)) {
          dummyListData.add(product);
        }
      }
      tempCategoriesList.clear();
      tempCategoriesList.addAll(dummyListData);
      print('----------------');
      print(tempCategoriesList.length);
      return;
    } else {
      tempCategoriesList.clear();
      tempCategoriesList.addAll(categoriesList[index].subCategories);
      print('----------------+');
      print(tempCategoriesList.length);

    }
  }




}