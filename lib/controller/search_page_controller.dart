

import 'package:alwan/helper/api.dart';
import 'package:alwan/model/product_list.dart';
import 'package:get/get.dart';

class SearchPageController extends GetxController{

  RxList<ProductList> searchResultList = <ProductList>[].obs;
  RxBool loading = false.obs;

  getData(query) async {
    loading.value = true;
    Api.getSearchResult(query).then((value){
      searchResultList.addAll(value);
      loading.value = false;
    });
  }


}