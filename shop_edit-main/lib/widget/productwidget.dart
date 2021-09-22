import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:provider/provider.dart';

import '../provider/product.dart';

// Screen
import '../screens/addproductscreen.dart';

class ProductWidget extends StatelessWidget {
  final String id, title, description, imgUrl;
  final double price;
  final bool isFav;
  final Status? status;
  ProductWidget(this.id, this.title, this.description, this.imgUrl, this.price,
      this.isFav, this.status,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context)!.settings.arguments;
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: Container(
        color: Colors.white,
        child: ListTile(
            title: Text(title),
            leading: CircleAvatar(
              radius: 30,
              // backgroundImage: NetworkImage(imgUrl),
              // new: Image.network
              // child: FittedBox(
              //     child: Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child:Text( imgUrl)
              // Text(title),
            )),
      ),

      // leading: CircleAvatar(
      //   child: Text('$date'),
      // ),

      actions: [
        IconSlideAction(
          caption: 'Edit',
          color: Colors.yellow,
          icon: Icons.edit,
          onTap: () => Navigator.of(context)
              .pushNamed(AddProductScreen.routeName, arguments: {
            'id': id,
          }),
        )
      ],
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () =>
              Provider.of<Product>(context, listen: false).removeProduct(id),
        ),
      ],
    );
  }
}












































































// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:provider/provider.dart';
// import '../screens/addProductScreen.dart';
// //provider
// import '../provider/product.dart';

// class ProductWidget extends StatelessWidget {
//   final String id, title, description, imgUrl;
//   final double price;
//   final bool isFav;
//   final Status? status;

//   ProductWidget(this.id, this.title, this.description, this.imgUrl, this.price,
//       this.isFav, this.status,
//       {Key? key})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var args = ModalRoute.of(context)!.settings.arguments;
//     return Slidable(
//       actionPane: SlidableDrawerActionPane(),
//       actionExtentRatio: 0.25,
//       child: Container(
//           color: Colors.white,
//           child: Container(
//               padding: const EdgeInsets.all(5.0),
//               // margin: EdgeInsets.all(15.0),
//               child: GridTile(
//                 //decoration:BoxDecoration(borderRadius:BorderRadius.circular (506)),
//                 header: Container(
//                     height: 43.0,
//                     color: Colors.white60,
//                     child: Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: <Widget>[
//                           // if(status!=Status.favourite)
//                           IconButton(
//                             icon: Icon(
//                               Icons.favorite_outline,
//                               color: Colors.red,
//                             ),
//                             onPressed: () =>
//                                 Provider.of<Products>(context, listen: false)
//                                     .changeStatus(id, Status.favourite),

//                             // // //  FavoriteButton(
//                             // // //               isFavorite: false,
//                             // // //               // iconDisabledColor: Colors.white,
//                             // // //               valueChanged: (_isFavorite) {
//                             // // //                 print('Is Favorite : $_isFavorite');

//                             // // //               },
//                             // // //             ),

//                             // //   if(status==Status.favourite)
//                             // // IconButton(
//                             // //   icon:_products[index].isFav
//                             // //   ? Icon(Icons.favorite_outline_rounded,color: Colors.red)
//                             // //   : Icon(Icons.favorite_rounded, color: Colors.red,)
//                             // //   // Icon(Icons.favorite_outline,color: Colors.red,)
//                             // //   ,  onPressed: () =>Provider.of<Products>(context,listen:false ).changeStatus(id,Status.favourite,
//                             // //       setState(() => _isFav[index] = !_isFav[index])
//                             // //   )
//                             // //   ),

//                             // // //    IconButton(
//                             // // //   icon: Icon(
//                             // // //     Icons.favorite,
//                             // // //     color: Colors.blueGrey,
//                             // // //   ),
//                             // // //   onPressed: () {
//                             // // //     FavouriteScreen();
//                             // // //     color:Colors.yellow;
//                             // // //     // addProductScreen();
//                             // // //     // do something
//                             // // //     // yourproduct(_products, onChange);
//                             // // //   },
//                             // // // )

//                             // IconSlideAction(
//                             //   caption: 'Favourite',
//                             //   color: Colors.yellow,
//                             //   icon: Icons.favorite_outline,
//                             //   onTap: () => onChange(id, Status.favourite),
//                             // ),

//                             // // // // child: ListTile(
//                             // // // //   leading: Icon(
//                             // // // //     Icons.favorite_outline,
//                             // // // //     color: Colors.blueGrey,
//                             // // // //   ),
//                             //             onPressed: (_products.isFav=true) {
//                             //   // do something
//                             //   // yourproduct(_products, onChange);
//                             // },

//                             //  leading( icon: Icon(Icons.star),
//                             //   label: 'Product',)
//                           )
//                         ])),
//                 footer: Container(
//                     height: 37.0,
//                     color: Colors.white60,
//                     child: ListTile(
//                       leading: Text(
//                         title,
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold, fontSize: 15.5),
//                       ),
//                       //title :Text(price.toString(),style:TextStyle(color:Colors.red,fontWeight: FontWeight.w800))
//                     )),

//                 child: Image.network(imgUrl,
//                     fit: BoxFit.cover, width: 160.0, height: 100.0),
//                 // Image.network('https://rukminim1.flixcart.com/image/332/398/kngd0nk0/shirt/b/e/1/xl-shirts-sahi-hai-original-imag24khxshsg8yy.jpeg?q=50', scale: 1, fit: BoxFit.cover),
//                 // Image.network('https://www.versace.com/dw/image/v2/ABAO_PRD/on/demandware.static/-/Sites-ver-master-catalog/default/dw94384b51/original/90_1002113-1A01644_1R330_10_LaGrecaAccentShirt-Shirts-versace-online-store_0_1.jpg?sw=450&sh=632&sm=fit&sfrm=jpg'),
//               ))),

              
//       actions: [
//         IconSlideAction(
//           caption: 'Edit',
//           color: Colors.cyan,
//           icon: Icons.edit,
//           onTap: () => Navigator.of(context)
//               .pushNamed(AddProductScreen.routeName, arguments: {'id': id}),
//         )
//       ],
//       secondaryActions: <Widget>[
//         IconSlideAction(
//           caption: 'Delete',
//           color: Colors.red,
//           icon: Icons.delete_rounded,
//           onTap: () =>
//               Provider.of<Product>(context, listen: false).removeProduct(id),
//         ),

//         //  if (status != Status.InProgress)
//         //   IconSlideAction(
//         //     caption: 'In Progress',
//         //     color: Colors.black45,
//         //     icon: Icons.archive_outlined,
//         //     onTap: () => Provider.of<Product>(context, listen: false)
//         //         .changeStatus(id, Status.favourite),

//         // if (status != Status.Completed)
//         //   IconSlideAction(
//         //     caption: 'Completed',
//         //     color: Colors.blue,
//         //     icon: Icons.done_all,
//         //     onTap: () => Provider.of<Tasks>(context, listen: false)
//         //         .changeStatus(id, Status.Completed),
//         //   ),
//       ],
//     );
//   }
// }

     
    
 
