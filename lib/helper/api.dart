import 'dart:convert';

import 'package:alwan/model/start_up.dart';
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

}