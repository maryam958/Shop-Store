import 'package:finalproject/provider/product.dart';
import 'package:finalproject/screens/details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'addProductScreen.dart';
import 'package:finalproject/widget/productwidget.dart';

//provider
import 'package:provider/provider.dart';
import '../provider/product.dart';

class yourProduct extends StatelessWidget {
  static const routeName = '/products';

  const yourProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //  int _currentIndex = 2;
    var _products = Provider.of<Products>(context).filterProducts();
    // (status: Status.yourproducts);

    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
                backgroundColor: Theme.of(context).primaryColor,
                title: Text('Your Products'),
// appBar: AppBar(
                actions: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.add,
                      color: Colors.blueGrey,
                    ),
                    onPressed: () => Navigator.pushNamed(
                        context, AddProductScreen.routeName),
                  )

                  //  :null,
                ]),
            body: ListView.separated(
              itemCount: _products.length,
                itemBuilder: (ctx, index) => ProductWidget(
                      _products[index].id,
                      _products[index].title,
                      _products[index].description,
                      _products[index].imgUrl,
                      _products[index].price,
                      _products[index].isFav,
                      _products[index].status,
                    ),
                separatorBuilder: (ctx, index) => Divider(
                      thickness: 2,
                      height: 0,
                    ),
                ),
                
                // return listTile()
                
                //   onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) =>
                //           DetailScreen(product: _products[index]),
                //     ));
                
                
                  ));

//hnaa

    // body: ListView.builder(
    //     itemCount: _products.length,
    //     itemBuilder: (context, index) {
    //       return ListTile(
    //           title: Text(_products[index].title),
    //           // leading:CircleAvatar(
    //           //       backgroundImage: NetworkImage(_products[index].imgUrl),

    //           onTap: () {
    //             Navigator.push(
    //                 context,
    //                 MaterialPageRoute(
    //                   builder: (context) =>
    //                       DetailScreen(product: _products[index]),
    //                 ));

    // secondaryActions:<Widget>[
    // IconSlideAction(
    //     caption: 'Edit',
    //     color:Colors.blue[400],
    //     icon:Icons.edit,
    //     onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context))
    //       return updateproduct(id);

    //  body: GridView.builder(
    //           itemCount: _products.length,
    //           // padding: EdgeInsets.symmetric(horizontal: 4),
    //           gridDelegate:
    //               SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    //           itemBuilder: (ctx, index) => ProductWidget(
    //                 _products[index].id,
    //                 _products[index].title,
    //                 _products[index].description,
    //                 _products[index].imgUrl,
    //                 _products[index].price,
    //                 _products[index].isFav,
    //                 _products[index].status,
    //               )));
    // }

//  return ListView.separated(
//         itemBuilder: (ctx, index) => ProductWidget(
//                  _products[index].id,
//                 _products[index].title,
//                 _products[index].description,
//                 _products[index].imgUrl,
//                 _products[index].price,
//                 _products[index].isFav,
//                 _products[index].status,
//             ),
//         separatorBuilder: (ctx, index) => Divider(
//               thickness: 2,
//               height: 0,
//             ),
//         itemCount: _products.length);
//   }
// }

    //   leading: CircleAvatar(
    //     backgroundColor: Colors.indigoAccent,
    //     child: _products[index].imgUrl,
    //     foregroundColor: Colors.white,
    //   ),
    //   title: Text(_products[index].title),
    // //   subtitle: Text('SlidableDrawerDelegate'),

    // children: <Products>[
    //     ProductWidget(
    //        _products[index].imgUrl,
    //       _products[index].title,

    //     )

    // children: List.generate(_products.length, (index) {
    // return Center(
    //   child: Text(
    //     'Item $index',
    //     style: Theme.of(context).textTheme.headline5,

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
  }
}
