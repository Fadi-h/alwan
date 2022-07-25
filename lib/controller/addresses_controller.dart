import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {

  TextEditingController address1 = TextEditingController();
  TextEditingController address2 = TextEditingController();
  TextEditingController emirate = TextEditingController();
  TextEditingController apartment = TextEditingController();
  TextEditingController phone = TextEditingController();

  List<String> emirateList = ['Dubai','Abo Dhabi','Ajman','Ras Al Khaimah','Sharjah','Umm Al Quwin','Dubai Eye'];


}