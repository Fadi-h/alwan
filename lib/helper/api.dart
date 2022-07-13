import 'dart:convert';

import 'package:alwan/model/product.dart';
import 'package:alwan/model/product_list.dart';
import 'package:alwan/model/start_up.dart';
import 'package:alwan/model/product_list.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;


class Api {

  static var url = "http://phpstack-548447-2725613.cloudwaysapps.com/";


  static Future checkInternet() async {
    var result = await Connectivity().checkConnectivity();
    if(result == ConnectivityResult.mobile) {
      return true;
    }else if(result == ConnectivityResult.wifi) {
      return true;
    }else if(result == ConnectivityResult.ethernet){
      return true;
    }else if(result == ConnectivityResult.bluetooth){
      return true;
    }else if(result == ConnectivityResult.none){
      print("No internet connection");
      return false;
    }
  }

  static Future getStartUpData() async {
    var request = http.Request('GET', Uri.parse(url + 'api/new/start-up'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String data = await response.stream.bytesToString();
      return StartUp.fromMap(jsonDecode(data));
    }
    else {
     return StartUp(categories: [], customerService: [], banners: [],suggestionSearch: []);
    }

  }

  static Future<Product> getProductDetails(int productId) async {
    var request = http.MultipartRequest('GET', Uri.parse(url + 'api/product/$productId'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String data = await response.stream.bytesToString();
      return Product.fromJson(jsonDecode(data));
    }
    else {
      return Product(id: -1, subCategoryId: -1, title: "", subTitle: "", search: "", image: "", rate: 0, rateCount: 0, description: "", price: -1, images: [], reviews: []);
    }
  }

  static Future<List<ProductList>> getProductList(int subCategoryId) async {
    var request = http.Request('GET', Uri.parse(url + 'api/sub-category/$subCategoryId/product'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String data = await response.stream.bytesToString();
      var list = jsonDecode(data) as List;
      List<ProductList> products = <ProductList>[];
      for(var c in list){
        products.add(ProductList.fromMap(c));
      }
      return products;
    }
    else {
      return [];
    }

  }



}