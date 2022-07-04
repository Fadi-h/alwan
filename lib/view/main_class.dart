import 'package:alwan/controller/main_class_controller.dart';
import 'package:alwan/helper/app.dart';
import 'package:alwan/helper/myTheme.dart';
import 'package:alwan/view/home.dart';
import 'package:alwan/view/notification.dart';
import 'package:alwan/view/order.dart';
import 'package:alwan/view/profile.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MainClass extends StatelessWidget {

  MainClassController mainClassController = Get.put(MainClassController());

  @override
  Widget build(BuildContext context) {
    return Obx((){
      return Scaffold(
        bottomNavigationBar: BottomNavyBar(
          backgroundColor: MyTheme.isDarkTheme.value ? App.darkGrey : Colors.white,
          selectedIndex: mainClassController.selectedIndex.value,
          showElevation: true, // use this to remove appBar's elevation
          onItemSelected: (index) {
            mainClassController.selectedIndex.value = index;
            mainClassController.pageController.animateToPage(index,
                duration: const Duration(milliseconds: 700), curve: Curves.fastOutSlowIn);
          },
          items: [
            BottomNavyBarItem(
              icon: Container(
                width: 30,
                height: 30,
                child: SvgPicture.asset(
                    'assets/icons/home.svg',
                  color: mainClassController.selectedIndex.value == 0
                      ? MyTheme.isDarkTheme.value ? Colors.white : App.pink : App.grey,
                ),
              ),
              title: Text(
                  'Home',
                style: TextStyle(
                  color: mainClassController.selectedIndex.value == 0
                    ? MyTheme.isDarkTheme.value ? Colors.white : App.pink : App.grey,),
              ),
              activeColor: App.pink,
              textAlign: TextAlign.center
            ),
            BottomNavyBarItem(
              icon: Container(
                width: 30,
                height: 30,
                child: SvgPicture.asset(
                    'assets/icons/order.svg',
                  color: mainClassController.selectedIndex.value == 1
                      ? MyTheme.isDarkTheme.value ? Colors.white : App.pink : App.grey,
                ),
              ),
                title: Text(
                  'Orders',
                  style: TextStyle(
                    color: mainClassController.selectedIndex.value == 1
                        ? MyTheme.isDarkTheme.value ? Colors.white : App.pink : App.grey,),
                ),
              activeColor: App.pink,
                textAlign: TextAlign.center
            ),
            BottomNavyBarItem(
              icon: Container(
                width: 30,
                height: 30,
                child: SvgPicture.asset(
                    'assets/icons/profile.svg',
                  color: mainClassController.selectedIndex.value == 2
                      ? MyTheme.isDarkTheme.value ? Colors.white : App.pink : App.grey,
                ),
              ),
                title: Text(
                  'Profile',
                  style: TextStyle(
                    color: mainClassController.selectedIndex.value == 2
                        ? MyTheme.isDarkTheme.value ? Colors.white : App.pink : App.grey,),
                ),
              activeColor: App.pink,
                textAlign: TextAlign.center

            ),
            BottomNavyBarItem(
              icon: Icon(
                  Icons.settings,
                color: mainClassController.selectedIndex.value == 3
                    ? MyTheme.isDarkTheme.value ? Colors.white : App.pink : App.grey,
              ),
                title: Text(
                  'Settings',
                  style: TextStyle(
                    color: mainClassController.selectedIndex.value == 3
                        ? MyTheme.isDarkTheme.value ? Colors.white : App.pink : App.grey,),
                ),
              activeColor: App.pink,
                textAlign: TextAlign.center

            ),
          ],
        ),
        body: SafeArea(
          child: PageView(
            controller: mainClassController.pageController,
            onPageChanged: (index){
              //mainClassController.selectedIndex.value = index;
            },
            physics: NeverScrollableScrollPhysics(),
            children: [
              Home(),
              OrderPage(),
              NotificationPage(),
              Profile(),
            ],
          ),
        ),
      );
    });
  }
}
