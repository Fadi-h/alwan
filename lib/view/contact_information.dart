import 'package:alwan/controller/intro_controller.dart';
import 'package:alwan/helper/myTheme.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class ContactInformation extends StatelessWidget {

  IntroController introController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // color: Colors.red,
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
                  // decoration: BoxDecoration(
                  //     image: DecorationImage(
                  //       fit: BoxFit.cover,
                  //         image: NetworkImage(introController.customerServiceList[itemIndex].image)
                  //     )
                  // ),
                  child: Shimmer.fromColors(
                      baseColor: Colors.red,
                      highlightColor: Colors.yellow,
                      child: Image.network(introController.customerServiceList[itemIndex].image)),
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
                              image: !MyTheme.isDarkTheme.value ? AssetImage(
                                  'assets/icons/white_design.png'
                              )
                              :  AssetImage(
                                  'assets/icons/black_design.png'
                              ),
                            ),
                          ),
                          // child: Image.asset('assets/icons/white_design.png',fit: BoxFit.cover),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                                introController.customerServiceList[itemIndex].name,
                              style: TextStyle(
                                fontSize: 30,
                                color: MyTheme.isDarkTheme.value ? Colors.white : Colors.black,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            Text(
                                introController.customerServiceList[itemIndex].language,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: MyTheme.isDarkTheme.value ? Colors.white : Colors.black,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
