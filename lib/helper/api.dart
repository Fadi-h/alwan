import 'dart:convert';

import 'package:alwan/model/order.dart';
import 'package:alwan/model/product.dart';
import 'package:alwan/model/product_list.dart';
import 'package:alwan/model/start_up.dart';
import 'package:alwan/model/user.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;


class Api {

  static var url = "https://phpstack-548447-2725613.cloudwaysapps.com/";

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

  static Future<List<ProductList>> getSearchResult(String query) async {
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse(url + 'api/product/search'));
    request.body = json.encode({
      "query": query
    });
    request.headers.addAll(headers);

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


  static Future<User> login(String username, String password) async{
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse(url + 'api/customer-login'));
    request.body = json.encode({
      "username": username,
      "password": password
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var jsonData = await response.stream.bytesToString();
      if(jsonData.length < 3){
        /// alert (username and password is wrong)
        return User(id: -1, quickBookId: "", name: "", token: "",
            financialState: "", username: "", password:"", address1: "", address2: "", emirate: "", apartment: "", phone: "") ;
      }else{
        jsonData = jsonData.replaceRange(0,1, '');
        jsonData = jsonData.replaceRange(jsonData.length -1 ,jsonData.length ,'');
        print(jsonData);
        User user = User.fromMap(jsonDecode(jsonData));
        print(user.name);
        return user;
      }
    } else {
      /// alert (something went wrong)
      return User(id: -2, quickBookId: "", name: "", token: "",
          financialState: "", username: "", password:"", address1: "", address2: "", emirate: "", apartment: "", phone: "") ;
    }

  }

  static Future<List<Order>> getCustomerOrder(String userId) async {
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse(url + 'api/customer-order'));
    request.body = json.encode({
      "id": userId
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String data = await response.stream.bytesToString();
      var list = jsonDecode(data) as List;
      List<Order> orders = <Order>[];
      for(var o in list){
        orders.add(Order.fromMap(o));
      }
      return orders;
    }
    else {
      return [];
    }

  }

  static Future setCustomerAddress(String address1, String address2, String emirate, String apartment, String phone, String userId) async {
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse(url + 'api/customer-address'));
    request.body = json.encode({
      "address1": address1,
      "address2": address2,
      "emirate": emirate,
      "apartment" : apartment,
      "phone": phone,
      "id": userId
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      return true;
    }
    else {
      print(response.reasonPhrase);
      return false;
    }

  }

  static Future sendUserToken(token, userId) async {
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse(url + 'api/customer/token'));
    request.body = json.encode({
      "token": token,
      "id": userId
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      return true;
    }
    else {
      print(response.reasonPhrase);
      return false;
    }

  }

}