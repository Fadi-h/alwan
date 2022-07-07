import 'package:alwan/app_localization.dart';
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
          Container(
            height: MediaQuery.of(context).size.height - MediaQuery.of(context).viewPadding.bottom,
            child: Column(
              children: [
               _image(context),
               _description(context),
              ],
            ),
          ),
          _contactOption(context),
        ],
      ),
    );
  }


  _image(context) {
    return  Stack(
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
          onTap: () {
            Get.back();
          },
          child: Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top,left: 15,right: 15),
            height: MediaQuery.of(context).size.height * 0.1,
            child: Icon(Icons.arrow_back_ios_outlined,color: Colors.black,size: 30,),
          ),
        ),
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
          Text(App_Localization.of(context).translate("title"),
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: MyTheme.isDarkTheme.value ? Colors.white : Colors.black
          ),),
          SizedBox(height: 5,),
          Text(product.title,style: TextStyle(
              fontSize: 16,
              color: MyTheme.isDarkTheme.value ? Colors.white.withOpacity(0.5) : App.grey)
            ,textAlign: TextAlign.justify,),
          SizedBox(height: 5,),
          Divider(height: 20,color: Theme.of(context).dividerColor,),
          SizedBox(height: 5,),
          Text(App_Localization.of(context).translate("description"),
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: MyTheme.isDarkTheme.value ? Colors.white : Colors.black
            ),
          ),
          SizedBox(height: 5,),
          Container(
            height: MediaQuery.of(context).size.height * 0.34,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry'+"'"+'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                style: TextStyle(fontSize: 16,
                    color: MyTheme.isDarkTheme.value ? Colors.white.withOpacity(0.5) : App.grey),
                textAlign: TextAlign.justify,),
            ),
          )
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
                      color: MyTheme.isDarkTheme.value ? Colors.white : App.darkGrey,
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
                              child:  SvgPicture.asset('assets/icons/whatsapp-green.svg'),
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
                    color: MyTheme.isDarkTheme.value ? Colors.white : App.darkGrey,
                    shape: BoxShape.circle
                ),
                child: Center(
                  child: Icon(Icons.phone,size: 35,
                    color: MyTheme.isDarkTheme.value ? Colors.black : Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

}
