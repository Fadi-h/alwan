import 'package:alwan/app_localization.dart';
import 'package:alwan/controller/ProfileController.dart';
import 'package:alwan/controller/intro_controller.dart';
import 'package:alwan/controller/main_class_controller.dart';
import 'package:alwan/helper/app.dart';
import 'package:alwan/helper/myTheme.dart';
import 'package:alwan/view/address.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {

  IntroController introController = Get.find();
  ProfileController profileController = Get.put(ProfileController());
  MainClassController mainClassController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            MyTheme.isDarkTheme.value ? Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/image/background.png')
                    )
                )
            ) : Text(''),
            SingleChildScrollView(
              child: Column(
                children: [
                  _header(context),
                  const SizedBox(height: 10),
                  _body(context)
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
  _header(BuildContext context){
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              mainClassController.selectedIndex.value = 0;
              mainClassController.pageController.animateToPage(0,
                  duration: const Duration(milliseconds: 700), curve: Curves.fastOutSlowIn);
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.17,
              height: MediaQuery.of(context).size.width * 0.17,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/icons/logo2.png')
                  )
              ),
            ),
          ),
        ],
      ),
    );
  }
  _body(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height * 0.7,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              _slider(context),
              const SizedBox(height: 30),
              _optionBar(context),
              const SizedBox(height: 25),
              _contactHelp(context),
            ],
          ),
          const SizedBox(height: 35),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _socialMedia(context),
              _terms(context),
            ],
          ),
        ],
      ),
    );
  }
  _slider(context){
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width * 0.45,
      color: App.grey,
      child:ImageSlideshow(
        width: double.infinity,
        height: MediaQuery.of(context).size.height*0.2,
        initialPage: 0,
        indicatorColor: Theme.of(context).primaryColor,
        indicatorBackgroundColor: App.grey,
        children:
        introController.bannerList.map((e) => Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: NetworkImage(e.image),
                  fit: BoxFit.cover
              )
          ),
        )).toList(),
        autoPlayInterval: 0,
        isLoop: true,
      ),
    );
  }
  _optionBar(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                mainClassController.selectedIndex.value = 1;
                mainClassController.pageController.animateToPage(1,
                    duration: const Duration(milliseconds: 700), curve: Curves.fastOutSlowIn);
                // Navigator.push(
                //   context,
                //   PageRouteBuilder(
                //     pageBuilder: (c, a1, a2) => InvoicePage(),
                //     transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                //     transitionDuration: Duration(milliseconds: 500),
                //   ),
                // );
              },
              child: Container(
                color: Colors.transparent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 25,
                      height: 25,
                      child: SvgPicture.asset("assets/icons/invoice.svg",
                          color: MyTheme.isDarkTheme.value ? Colors.white :
                          Colors.black
                      ),
                    ),
                    Center(child: Text(App_Localization.of(context).translate("my_invoice"),
                        style: TextStyle(
                          color: MyTheme.isDarkTheme.value ? Colors.white :
                          Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold
                        )
                    )

                    )
                  ],
                ),
              )
            ),
          ),
          VerticalDivider(
            color: MyTheme.isDarkTheme.value ? Colors.white :
            Colors.black,
            width: 1,
            thickness: 1,
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (c, a1, a2) => Addresses(),
                    transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                    transitionDuration: Duration(milliseconds: 500),
                  ),
                );
              },
              child: Container(
                color: Colors.transparent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      child: SvgPicture.asset("assets/icons/address.svg",
                          color: MyTheme.isDarkTheme.value ? Colors.white :
                          Colors.black
                      ),
                    ),
                    Center(child: Text(App_Localization.of(context).translate("my_address"),
                        style: TextStyle(
                            color: MyTheme.isDarkTheme.value ? Colors.white :
                            Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold
                        )
                    )
                    )
                  ],
                ),
              ),
            ),
          ),
          VerticalDivider(
            color: MyTheme.isDarkTheme.value ? Colors.white :
            Colors.black,
            width: 1,
            thickness: 1,
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                mainClassController.selectedIndex.value = 3;
                mainClassController.pageController.animateToPage(3,
                    duration: const Duration(milliseconds: 700), curve: Curves.fastOutSlowIn);
              },
              child: Container(
                color: Colors.transparent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      child: SvgPicture.asset("assets/icons/setting.svg",
                          color: MyTheme.isDarkTheme.value ? Colors.white :
                          Colors.black,
                      ),
                    ),
                    Center(child: Text(App_Localization.of(context).translate("settings"),
                        style: TextStyle(
                            color: MyTheme.isDarkTheme.value ? Colors.white :
                            Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                        )
                    )
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  _contactHelp(BuildContext context) {
    return Container(
     width: MediaQuery.of(context).size.width * 0.9,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              onTap: () {
                //todo
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.55,
                decoration: BoxDecoration(
                    color: Theme.of(context).disabledColor,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.call,
                      color: Theme.of(context).backgroundColor,
                    ),
                    const SizedBox(width: 10),
                    Center(child: Text(App_Localization.of(context).translate("connect_with_us"),
                        style: TextStyle(
                      fontSize: 15,
                      color: Theme.of(context).backgroundColor,
                      fontWeight: FontWeight.bold
                        )
                      )
                    )
                  ],
                ),
              )
          ),
          GestureDetector(
              onTap: () {
                //todo
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.3,
                decoration: BoxDecoration(
                    color: Theme.of(context).disabledColor,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 28,
                      height: 28,
                      child: SvgPicture.asset("assets/icons/help.svg",
                          color: Theme.of(context).backgroundColor
                      ),
                    ),
                    const SizedBox(width: 10),
                    Center(
                        child: Text(App_Localization.of(context).translate("help"),
                        style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).backgroundColor,
                        fontWeight: FontWeight.bold
                    )))
                  ],
                ),
              )
          ),
        ],
      ),
    );
  }
  _socialMedia(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.65,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              //todo
            },
            child: Container(
              width: 22,
              height: 22,
              child: SvgPicture.asset("assets/icons/instagram.svg",
                  color: MyTheme.isDarkTheme.value ? Colors.white :
                  Colors.black,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              //todo
            },
            child: Container(
              width: 22,
              height: 22,
              child: SvgPicture.asset("assets/icons/twitter.svg",
                  color: MyTheme.isDarkTheme.value ? Colors.white :
                  Colors.black,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              //todo
            },
            child: Container(
              width: 22,
              height: 22,
              child: SvgPicture.asset("assets/icons/facebook.svg",
                  color: MyTheme.isDarkTheme.value ? Colors.white :
                  Colors.black,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              //todo
            },
            child: Container(
              width: 22,
              height: 22,
              child: SvgPicture.asset("assets/icons/youtube.svg",
                  color: MyTheme.isDarkTheme.value ? Colors.white :
                  Colors.black,
              ),
            ),
          )
        ],
      ),
    );
  }
  _terms(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.7,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap:() {
                  //todo
                },
                child: Text(App_Localization.of(context).translate("privacy_policy"),
                  style: TextStyle(
                      color: MyTheme.isDarkTheme.value ? Colors.white :
                      Colors.black,
                      fontSize: 11,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Text(".",style: TextStyle(
                  color: MyTheme.isDarkTheme.value ? Colors.white :
                  Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.bold
              ),),
              GestureDetector(
                onTap:() {
                  //todo
                },
                child: Text(App_Localization.of(context).translate("terms_of_sale"),
                  style: TextStyle(
                      color: MyTheme.isDarkTheme.value ? Colors.white :
                      Colors.black,
                      fontSize: 11,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Text(".",style: TextStyle(
                  color: MyTheme.isDarkTheme.value ? Colors.white :
                  Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.bold
              ),),
              GestureDetector(
                onTap:() {
                  //todo
                },
                child: Text(App_Localization.of(context).translate("terms_of_use"),
                  style: TextStyle(
                      color: MyTheme.isDarkTheme.value ? Colors.white :
                      Colors.black,
                      fontSize: 11,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20,),
        Container(
          width: MediaQuery.of(context).size.width * 0.6,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap:() {
                  //todo
                },
                child: Text(App_Localization.of(context).translate("return_policy"),
                  style: TextStyle(
                      color: MyTheme.isDarkTheme.value ? Colors.white :
                      Colors.black,
                      fontSize: 11,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Text(".",style: TextStyle(
                  color: MyTheme.isDarkTheme.value ? Colors.white :
                  Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.bold
              ),),
              GestureDetector(
                onTap:() {
                  //todo
                },
                child: Text(App_Localization.of(context).translate("warranty_policy"),
                  style: TextStyle(
                      color: MyTheme.isDarkTheme.value ? Colors.white :
                      Colors.black,
                      fontSize: 11,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20,),
        Text("© 2018ALWAN. ALL RIGHTS RESERVED.",
          style: TextStyle(
              color: MyTheme.isDarkTheme.value ? Colors.white :
              Colors.black,
              fontSize: 11,
              fontWeight: FontWeight.bold
          ),
        ),
      ],
    );
  }


}
