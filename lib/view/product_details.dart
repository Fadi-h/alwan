import 'package:alwan/model/start_up.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {

  SubCategories product;
  ProductDetails(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
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
            ],
          ),
        ),
      ),
    );
  }
}
