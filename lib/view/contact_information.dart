import 'package:alwan/controller/intro_controller.dart';
import 'package:alwan/controller/sign_in_controller.dart';
import 'package:alwan/helper/myTheme.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';



class ContactInformation extends StatelessWidget {

  IntroController introController = Get.find();
  SignInController signInController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: CarouselSlider.builder(
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height,
            viewportFraction: 1,
          ),
          itemCount: introController.customerServiceList.length,
          itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex){
            return Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: FancyShimmerImage(
                    imageUrl: introController.customerServiceList[itemIndex].image,
                    shimmerBaseColor: Colors.grey,
                    shimmerHighlightColor: Colors.white,
                    shimmerBackColor: Colors.grey,
                  )
                ),
                GestureDetector(
                  onTap: (){
                    Get.back();
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top,left: 15),
                    child: const Icon(Icons.arrow_back_ios_outlined,color: Colors.white,size: 30,),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.45,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image:  MyTheme.isDarkTheme.value ?
                              AssetImage('assets/icons/black_design.png') :
                              AssetImage('assets/icons/white_design.png')

                            ),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.3,
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                introController.customerServiceList[itemIndex].name,
                                style: TextStyle(
                                    fontSize: 30,
                                    color:  MyTheme.isDarkTheme.value ?
                                    Colors.white : Colors.black,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Communicate with" + " " + introController.customerServiceList[itemIndex].name + " " + "in" + " " +
                                    introController.customerServiceList[itemIndex].language,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: MyTheme.isDarkTheme.value ?
                                  Colors.white : Colors.black,
                                ),
                              ),
                              SizedBox(height: 25),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    AnimatedSmoothIndicator(
                                      activeIndex: itemIndex,
                                      count: introController.customerServiceList.length,
                                      effect: SlideEffect(
                                          dotWidth: 15,
                                          dotHeight: 15,
                                          activeDotColor: MyTheme.isDarkTheme.value ?
                                          Colors.white : Colors.black,
                                          dotColor: Colors.grey
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: (){
                                        // signInController.openWhatApp(context, "We Need Some Information", itemIndex, introController);
                                        // print(itemIndex);
                                        // print(introController.customerServiceList[itemIndex].phone);
                                      },
                                      child: Container(
                                        width: 60,
                                        height: 60,
                                        decoration: BoxDecoration(
                                            color: MyTheme.isDarkTheme.value ?
                                            Colors.white : Colors.black,
                                            shape: BoxShape.circle
                                        ),
                                        child: Center(child: SvgPicture.asset('assets/icons/whatsapp-green.svg',width: 35,height: 35,)),
                                      ),
                                      /// filter list if call or whatsapp
                                      // GestureDetector(
                                      //   onTap: () {
                                      //     //signInController.openPhone(introController, itemIndex);
                                      //   },
                                      //   child: Container(
                                      //     width: 70,
                                      //     height: 70,
                                      //     decoration: BoxDecoration(
                                      //         color: MyTheme.isDarkTheme.value ?
                                      //          Colors.black : Colors.white,
                                      //         shape: BoxShape.circle
                                      //     ),
                                      //     child: Center(
                                      //       child: Icon(Icons.phone,size: 35,
                                      //           color: MyTheme.isDarkTheme.value ?
                                      //           Colors.white : Colors.black,
                                      //       ),
                                      //     ),
                                      //   ),
                                      // ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
