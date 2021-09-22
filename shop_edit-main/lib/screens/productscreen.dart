import 'package:finalproject/screens/details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widget/productwidget.dart';

// Model
import '../provider/product.dart';

class ProductScreen extends StatelessWidget {
  static const routeName = '/product_screen';
  const ProductScreen({Key? key}) : super(key: key);

  @override
  // final Product product;
  Widget build(BuildContext context) {
    var _products = Provider.of<Products>(context).filterProducts();
// //     return GridView.builder(
// //         itemCount: _products.length,
// //         gridDelegate:
// //             SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
// //         itemBuilder: (ctx, index) => ProductWidget(
// //               _products[index].id,
// //               _products[index].title,
// //               _products[index].description,
// //               _products[index].imgUrl,
// //               _products[index].price,
// //               _products[index].isFav,
// //               _products[index].status,
// //             ));
// //   }
// // }

//     return GridView.builder(
//         itemCount: _products.length,
//          gridDelegate:
//              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),

//         itemBuilder: (BuildContext context, int index) {
//           return new Column(children: <Widget>[
//             Column(
//              children:[
//               GridTile(

//                footer: Container(
//                     height: 37.0,
//                     color: Colors.white60,
//                     child: ListTile(
//                       leading: Text(
//                        _products[index].title,
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold, fontSize: 15.5),
//                       ),
//                       //title :Text(price.toString(),style:TextStyle(color:Colors.red,fontWeight: FontWeight.w800))
//                     )),

//                 child: Image.network( _products[index].imgUrl,
//                     fit: BoxFit.cover, width: 160.0, height: 100.0),

//                )

//               ]
//               )
//               ]
//               );

//         });
//   }
// }

    return Scaffold(
        body: GridView.builder(
            itemCount: _products.length,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index) {
              return ListTile(
                  title: Text(_products[index].title),
                  //  Product: _products[index] 

                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DetailScreen(product: _products[index])));
                  });
            }));
  }
}

// return Scaffold(
//         body: GridView.count(
//           crossAxisCount:2,

//               return ListTile(
//                   title: Text(_products[index].title),

//                   onTap: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) =>
//                                 DetailScreen(product: _products[index])));
//                   });
//             }));
//   }
// }

//  return  ListView.builder(
//                 itemCount: _products.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                       title: Text(_products[index].title),
//                       leading:CircleAvatar(
//                             backgroundImage: NetworkImage(_products[index].imgUrl),
//                       ),
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) =>
//                                   DetailScreen(product: _products[index]),
//                             ));

//  return Center(
//   child: Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: <Widget>[
//       Image.network(
//         'https://images.pexels.com/photos/462118/pexels-photo-462118.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
//         width: 100,
//         height: 100,
//       ),
//       Image.network(
//         'https://firebasestorage.googleapis.com/v0/b/jetsea.appspot.com/o/jets%2Fjetski.png?alt=media&token=f93b2680-6f03-4ba1-b1f5-17beb0df6648',
//         width: 100,
//         height: 100,
//       ),
//       Image.network(
//         'https://github.com/flutter/plugins/raw/master/packages/video_player/video_player/doc/demo_ipod.gif?raw=true',
//         width: 100,
//         height: 100,
//       ),
//     ],
//   ),
// );

//     return new Expanded(
//         child: new GridView.count(
//             crossAxisCount: 2,
//             padding: const EdgeInsets.fromLTRB(16.0, 25.0, 16.0, 4.0),
//             children: <Widget>[
//           // new MaterialButton(
//           //   onPressed: () {
//           //     Navigator.of(context).pushNamed('/biliardo');
//           //   },
//           new Column(
//             children: <Widget>[
//               // new Image(
//               //   //parte importante, definire gli asset per trovarli più velocemnte
//               //   //si inseriscono nel pubspec.yaml
//               //  Image.network(imgUrl,
//               //   height: 100.0,
//               //   width: 100.0,
//               // ),
//               new Text(
//                 _products[index].title,
//                 style: new TextStyle(
//                     //color: (darkTheme) ? Colors.blue : Colors.black,
//                     ),
//               )
//             ],
//           )
//         ]));
//   }
// }

//     return new Expanded(
//         child: new GridView.count(
//             crossAxisCount: 2,
//             padding: const EdgeInsets.fromLTRB(16.0, 25.0, 16.0, 4.0),
//             children: <Widget>[
//           new MaterialButton(onPressed: () {
//             Navigator.of(context).pushNamed('/biliardo');
//           }),
//         ]));
//   }
// }

// child: new Column(
//   children: <Widget>[
//     new Image(
//       //parte importante, definire gli asset per trovarli più velocemnte
//       //si inseriscono nel pubspec.yaml
//       // image: new AssetImage('/images/p8.png'),
//       image:NetworkImage(_products[index].imgUrl),            ,
//       height: 100.0,
//       width: 100.0,
//     ),
//     new Text(
//       _products[index].title,
//                   style: new TextStyle(
//                       // color: (darkTheme) ? Colors.blue : Colors.black,
//                       ),
//                 )
//               ],
//             ),
//           )
//         ]));
//   }
// }

//     return new GridView.count(
//         primary: false,
//         padding: const EdgeInsets.all(20.0),
//         crossAxisSpacing: 10.0,
//         crossAxisCount: 2,
//         children: <Widget>[

//           Text(_products[index].imgUrl),
//           Text((_products[index].price).toString(),
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                   backgroundColor: Colors.blueGrey[100],
//                   fontWeight: FontWeight.bold,
//                   fontSize: 20.0)),
//           Text(_products[index].description,
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                   backgroundColor: Colors.blueGrey[100],
//                   fontWeight: FontWeight.bold,
//                   fontSize: 20.0))
//         ]);
//   }
// }

// const Text('He'd have you all unravel at the'),
// const Text('Heed not the rabble'),
// const Text('Sound of screams but the'),
// const Text('Who scream'),
// const Text('Revolution is coming...'),
// const Text('Revolution, they...');]);););

//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Theme.of(context).primaryColor,

//         ),
//         body: Padding(
//             padding: const EdgeInsets.all(30.0),
//             child: Center(
//                 child: ListView(children: [
//               Text(_products[index].imgUrl),
//               Text((_products[index].price).toString(),
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                       backgroundColor: Colors.blueGrey[100],
//                       fontWeight: FontWeight.bold,
//                       fontSize: 20.0)),
//               Text(_products[index].description,
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                       backgroundColor: Colors.blueGrey[100],
//                       fontWeight: FontWeight.bold,
//                       fontSize: 20.0))
//             ]))));
//   }
// }
