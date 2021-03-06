import 'package:flutter/material.dart';


import '../provider/product.dart';



class DetailScreen extends StatelessWidget {

  const DetailScreen({Key? key, required this.product}) : super(key: key);

  
  final Product product;

  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(product.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
     child: Center(
        child: ListView(
          children: [
         Text(product.imgUrl),
         Text((product.price).toString(),textAlign:TextAlign.center,style:TextStyle(backgroundColor:Colors.blueGrey[100],fontWeight: FontWeight.bold,fontSize: 20.0)),
         Text(product.description,textAlign:TextAlign.center,style:TextStyle(backgroundColor:Colors.blueGrey[100],fontWeight: FontWeight.bold,fontSize: 20.0)
        )]))));
    
  }
}

































// import 'package:finalproject/provider/product.dart';
// import 'package:flutter/material.dart';

// class Details extends StatefulWidget {
  
//    final Product product;
//   Details({Key? key}) : super(key: key);

//   @override
//   _DetailsState createState() => _DetailsState();
// }

// class _DetailsState extends State<Details> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }


// // class ViewProductPage extends StatefulWidget {
// //   final Product product;

// //   ViewProductPage({Key key, this.product}) : super(key: key);

// //   @override
// //   _ViewProductPageState createState() => _ViewProductPageState(product);
// // }

// // class _ViewProductPageState extends State<ViewProductPage> {
// //   final Product product;

// //   _ViewProductPageState(this.product);

// //   final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

//   int active;

//   ///list of product colors
//   List<Widget> colors() {
//     List<Widget> list = [];
//     for (int i = 0; i < 5; i++) {
//       list.add(
//         InkWell(
//           onTap: () {
//             setState(() {
//               active = i;
//             });
//           },
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
//             child: Transform.scale(
//               scale: active == i ? 1.2 : 1,
//               child: Card(
//                 elevation: 3,
//                 color: Colors.primaries[i],
//                 child: SizedBox(
//                   height: 32,
//                   width: 32,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       );
//     }
//     return list;
//   }

//   @override
//   Widget build(BuildContext context) {
//     Widget description = Padding(
//       padding: const EdgeInsets.all(24.0),
//       child: Text(
//         _products[index].description,
//         maxLines: 5,
//         semanticsLabel: '...',
//         overflow: TextOverflow.ellipsis,
//         style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.6)),
//       ),
//     );

//     return Scaffold(
//         key: _scaffoldKey,
//         backgroundColor: yellow,
//         appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           elevation: 0.0,
//           iconTheme: IconThemeData(color: darkGrey),
//           actions: <Widget>[
//             IconButton(
//               icon: new SvgPicture.asset('assets/icons/search_icon.svg', fit: BoxFit.scaleDown,),
//               onPressed: () => Navigator.of(context)
//                   .push(MaterialPageRoute(builder: (_) => SearchPage())),
//             )
//           ],
//           title: Text(
//             'Headphones',
//             style: const TextStyle(
//                 color: darkGrey,
//                 fontWeight: FontWeight.w500,
//                 fontFamily: "Montserrat",
//                 fontSize: 18.0),
//           ),
//         ),
//         body: SingleChildScrollView(
//           child: Container(
//             width: MediaQuery.of(context).size.width,
//             child: Column(
//               children: <Widget>[
//                 ProductOption(
//                   _scaffoldKey,
//                   product: product,
//                 ),
//                 description,
//                 Padding(
//                   padding: const EdgeInsets.all(24.0),
//                   child: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
//                     Flexible(
//                       child: ColorList([
//                         Colors.red,
//                         Colors.blue,
//                         Colors.purple,
//                         Colors.green,
//                         Colors.yellow
//                       ]),
//                     ),
//                     RawMaterialButton(
//                       onPressed: () {
//                         showModalBottomSheet(
//                             context: context,
//                             builder: (context) {
//                               return RatingBottomSheet();
//                             },
//                             //elevation: 0,
//                             //backgroundColor: Colors.transparent
//                         );
//                       },
//                       constraints:
//                           const BoxConstraints(minWidth: 45, minHeight: 45),
//                       child: Icon(Icons.favorite,
//                           color: Color.fromRGBO(255, 137, 147, 1)),
//                       elevation: 0.0,
//                       shape: CircleBorder(),
//                       fillColor: Color.fromRGBO(255, 255, 255, 0.4),
//                     ),
//                   ]),
//                 ),
//                 MoreProducts()
//               ],
//             ),
//           ),
//         ));
//   }
// }





























// // import 'dart:html';

// // import 'package:finalproject/provider/product.dart';
// // import 'package:flutter/material.dart';
// // import 'homescreen.dart';
// // import 'yourproducts.dart';
// // import './';
// // // import 'package:flutter_svg/svg.dart';
// // import 'package:shop_app/constants.dart';
// // import 'package:shop_app/models/Product.dart';
// // import 'package:shop_app/screens/details/components/body.dart';

// // class DetailsScreen extends StatelessWidget {
// //   final Product product;
// //   const DetailsScreen({Key key, this.product}) : super(key: key);
  
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       // each product have a color
// //       backgroundColor: product.color,
// //       appBar: buildAppBar(context),
// //       body: Body(product: product),
// //     );
// //   }

// //   AppBar buildAppBar(BuildContext context) {
// //     return AppBar(
// //       backgroundColor: product.color,
// //       elevation: 0,
// //       leading: IconButton(
// //         icon: SvgPicture.asset(
// //           'assets/icons/back.svg',
// //           color: Colors.white,
// //         ),
// //         onPressed: () => Navigator.pop(context),
// //       ),
// //       actions: <Widget>[
// //         IconButton(
// //           icon: SvgPicture.asset("assets/icons/search.svg"),
// //           onPressed: () {},
// //         ),
// //         IconButton(
// //           icon: SvgPicture.asset("assets/icons/cart.svg"),
// //           onPressed: () {},
// //         ),
// //         SizedBox(width: kDefaultPaddin / 2)
// //       ],
// //     );
// //   }
// // }