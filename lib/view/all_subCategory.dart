import 'package:alwan/controller/all_subCategory_controller.dart';
import 'package:alwan/controller/intro_controller.dart';
import 'package:alwan/helper/app.dart';
import 'package:alwan/view/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class AllSubCategory extends StatelessWidget {

  IntroController introController = Get.find();
  AllSubCategoryController allSubCategoryController = Get.put(AllSubCategoryController());

  @override
  Widget build(BuildContext context) {
    return Obx((){
      return Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              // Container(
              //     width: MediaQuery.of(context).size.width,
              //     height: MediaQuery.of(context).size.height,
              //     decoration: const BoxDecoration(
              //         image: DecorationImage(
              //             fit: BoxFit.cover,
              //             image: AssetImage('assets/image/background.png')
              //         )
              //     )
              // ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    SingleChildScrollView(
                      child: Container(
                        margin: const EdgeInsets.only(top: 200),
                        child: _gridBody(context, allSubCategoryController.categoryIndex.value),
                      ),
                    ),
                    _header(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  _header(context){
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 190,//MediaQuery.of(context).size.height * 0.25,
      padding: const EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).dividerColor.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 10,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.13,
                  height: MediaQuery.of(context).size.width * 0.13,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/icons/logo2.png')
                      )
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.65,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: TextField(
                    style: Theme.of(context).textTheme.headline4,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search, color: Theme.of(context).dividerColor,),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: 'Search',
                        hintStyle: const TextStyle(fontSize: 14)
                    ),
                  ),
                ),
                Container(
                  color: Colors.transparent,
                  width: MediaQuery.of(context).size.width * 0.07,
                  height: MediaQuery.of(context).size.width * 0.07,
                  child: SvgPicture.asset(
                      'assets/icons/filter_icon.svg',
                    color: Theme.of(context).disabledColor,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          _categoryBar(context),
        ],
      ),
    );
  }

  _categoryBar(context){
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      //height: 90,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Category', style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold, color: Theme.of(context).disabledColor)),
          Container(
            height: 40,
            child: ScrollablePositionedList.builder(
              scrollDirection: Axis.horizontal,
              itemScrollController: allSubCategoryController.itemScrollController,
              itemCount: introController.categoriesList.length,
              itemBuilder: (BuildContext context, index){
                return Row(
                  children: [
                    Obx((){
                      return  GestureDetector(
                        onTap: () async {
                          allSubCategoryController.categoryIndex.value = index;
                          if(MediaQuery.of(context).size.shortestSide < 600){
                            await allSubCategoryController.scrollToItem(index,introController.categoriesList.length);
                          }
                        },
                        child: Container(
                            color: Colors.transparent,
                            child: Center(
                              child: Text(
                                introController.categoriesList[index].title,
                                style: allSubCategoryController.categoryIndex.value == index
                                    ? Theme.of(context).textTheme.headline2
                                    : TextStyle(
                                  fontSize: 16,
                                  fontWeight:  allSubCategoryController.categoryIndex.value == index ? FontWeight.bold : null,
                                  color:  allSubCategoryController.categoryIndex.value == index ? Colors.black : App.grey,
                                ),
                              ),
                            )
                        ),
                      );
                    }),
                    const SizedBox(width: 20)
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  _gridBody(context,categoryIndex){
    int listLength = introController.categoriesList[categoryIndex].subCategories.length;
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: MediaQuery.of(context).size.shortestSide < 600 ? MediaQuery.of(context).size.width * 0.5 : MediaQuery.of(context).size.width * 0.3,
          childAspectRatio: 3 / 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: listLength,
        itemBuilder: (context, index){
          return  _subCategory(context, index, categoryIndex);
        },
      ),
    );
  }

  _subCategory(context,index ,categoryIndex){
    return GestureDetector(
      onTap: (){
        Get.to(()=>ProductDetails(introController.categoriesList[categoryIndex].subCategories[index]));
      },
      child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 6,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Hero(
                    transitionOnUserGestures: true,
                    tag: introController.categoriesList[categoryIndex].subCategories[index],
                    child: Image.network(
                        introController.categoriesList[categoryIndex].subCategories[index].image,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        }
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                introController.categoriesList[categoryIndex].subCategories[index].title,
                style: Theme.of(context).textTheme.headline1,
              ),
            )
          ],
        ),
      ),
    );
  }





}
