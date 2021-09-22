import 'package:finalproject/provider/product.dart';
import 'package:flutter/material.dart';

import 'package:finalproject/widget/productwidget.dart';


//provider
import 'package:provider/provider.dart';

class FavouriteScreen extends StatelessWidget {
  // final List<product> _products;
  // final List<product> _products;

  const FavouriteScreen({Key? key}) : super(key: key);
   final bool isFav=true;
  @override
  // _products[index].isFav =true;
  
  Widget build(BuildContext context) {
    var _products= Provider.of<Products>(context).filterProducts(status:Status.favourite);
    return Scaffold(
        body:GridView.builder(
            itemCount: _products.length,
            // padding: EdgeInsets.symmetric(horizontal: 4),
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
           
            itemBuilder: (ctx, index) => ProductWidget(
                _products[index].id,
                _products[index].title,
                _products[index].description,
                _products[index].imgUrl,
                _products[index].price,
                _products[index].isFav,
                _products[index].status,
                )));
  }









  
}





















// body: SingleChildScrollView(
//        padding: EdgeInsets.only(left: 0, right: 0, top: 20, bottom: 20),
//        child: Center(
          
//          /** Card Widget **/
//          child: Column(
//            children: [
//              //Card 1
//              Card(
//              ...
//        ),//Card 1
//     SizedBox(
//                height: 20,
//              ),
//              Card(
//              ...
//       ),//Card
//      ), //Center
//    ), //Scaffold