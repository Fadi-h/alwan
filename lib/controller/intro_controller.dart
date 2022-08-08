

import 'package:alwan/helper/api.dart';
import 'package:alwan/helper/global.dart';
import 'package:alwan/helper/store.dart';
import 'package:alwan/model/start_up.dart';
import 'package:alwan/view/main_class.dart';
import 'package:alwan/view/sign_in.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class IntroController extends GetxController{

  RxList<Category> categoriesList = <Category>[].obs;
  RxList<SubCategories> tempCategoriesList = <SubCategories>[].obs;
  RxList<CustomerService> customerServiceList = <CustomerService>[].obs;
  RxList<MyBanner> bannerList = <MyBanner>[].obs;
  RxList<SuggestionSearch> searchSuggestionList = <SuggestionSearch>[].obs;
  RxInt contactIndex = 0.obs;


  @override
  void onInit() async{
    super.onInit();
   getData();
   //  Api.checkInternet();
    Global.getUserInformation();
    await fetchUserToken();
  }



  getData()async{
    /// todo
    /// no internet
    Api.checkInternet().then((value){
      if(value){
        print('internet-------------------');
        Api.getStartUpData().then((data){
          categoriesList.value = data.categories;
          customerServiceList.value = data.customerService;
          searchSuggestionList.value = data.suggestionSearch;
          bannerList.value = data.banners;
          Store.loadAddress();
          Global.getUserInformation().then((value) {
            if(Global.userId != -1){
              Api.login(Global.username, Global.password).then((value) {
                Get.offAll(()=>MainClass());
              });
            }else{
              Get.offAll(()=>SignIn());
            }

          });
          // Future.delayed(const Duration(milliseconds: 2000 )).then((value){
          //
          // });
        });
      }else{
        //todo no internet
        print('No internet +++++++++++++');
      }
    });
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

  fetchUserToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
    Global.setUserToken(token ?? "");
  }




}