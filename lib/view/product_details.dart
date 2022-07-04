import 'package:alwan/helper/app.dart';
import 'package:alwan/helper/myTheme.dart';
import 'package:alwan/model/start_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProductDetails extends StatelessWidget {

  SubCategories product;
  ProductDetails(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height - MediaQuery.of(context).viewPadding.bottom,
              child: Column(
                children: [
                 _image(context),
                 _description(context),
                ],
              ),
            ),
          ),
          _contactOption(context),
        ],
      ),
    );
  }


  _image(context){
    return  Stack(
      alignment: Alignment.topLeft,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.4,
          child: Hero(
            transitionOnUserGestures: true,
            tag: product,
            child: Image.network(product.image,fit: BoxFit.cover,),
          ),
        ),
        GestureDetector(
          onTap: (){
            Get.back();
          },
          child: Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top,left: 15),
            child: const Icon(Icons.arrow_back_ios_outlined,color: Colors.black,size: 30,),
          ),
        )
      ],
    );
  }

  _description(context){
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: MediaQuery.of(context).size.width * 0.9,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Title',style: Theme.of(context).textTheme.bodyText1,),
          Text(product.title,style: TextStyle(fontSize: 16,color: MyTheme.isDarkTheme.value ? Colors.white : Colors.black),textAlign: TextAlign.justify,),
          Divider(height: 20,color: Theme.of(context).dividerColor,),
          Text('Description',style: Theme.of(context).textTheme.bodyText1,),
          Text('productproductproductproductproductproduct productproductproductproductproductproduct p r o d uctpr oduct productpr oduct productproduct productproductproduc tprod uctprodu ctpro ductprodu ctproductproduc tproductproductproduct',style: TextStyle(fontSize: 16,color: MyTheme.isDarkTheme.value ? Colors.white : Colors.black),textAlign: TextAlign.justify,)
        ],
      ),
    );
  }

  _contactOption(context){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: (){
                //  signInController.showWhatsAppList.value = !signInController.showWhatsAppList.value;
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      color: App.darkGrey,
                      //shape: BoxShape.circle
                      borderRadius: BorderRadius.circular(30)
                  ),
                  child: Center(
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 400),
                        child: SizedBox(
                            width: 35,
                            height: 35,
                            child: AnimatedSwitcher(
                              duration: const Duration(milliseconds: 400),
                              child:  SvgPicture.asset('assets/icons/whatsapp.svg'),
                            )
                        ),
                      )
                  ),
                ),
              ),
              Container(
                width: 60,
                height: 60,
                //   margin: const EdgeInsets.only(bottom: 50),
                decoration: BoxDecoration(
                    color: App.darkGrey,
                    shape: BoxShape.circle
                ),
                child: Center(
                  child: Icon(Icons.phone,size: 35,color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

}
