import 'package:finalproject/provider/product.dart';
import 'package:finalproject/screens/yourproducts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddProductScreen extends StatefulWidget {
  static const routeName = '/add_product_screen';
  AddProductScreen({Key? key}) : super(key: key);

  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  bool _isFirst = true;
  var _args;
  var _titleController = TextEditingController();
  var _priceController = TextEditingController();
  var _descController = TextEditingController();
  var _urlController = TextEditingController();

// @override
//   void initState() {

//     super.initState();
//   }

  @override
  void didChangeDependencies() {
    if (_isFirst) {
      _args = ModalRoute.of(context)!.settings.arguments;
      print(_args);
      _isFirst = false;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Product? product;
    if (_args != null) {
      product = Provider.of<Products>(context).findById(_args['id']);
      _titleController.text = product.title;
      _priceController.text = (product.price) as String;
      _descController.text = product.description;
      _urlController.text = product.imgUrl;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(_args == null ? 'Add Product' : 'Edit Product'),


    
              // style: TextStyle(
              //     color: Colors.black,
              //     fontFamily: 'Raleway',
              //     fontWeight: FontWeight.w800,
              //     fontSize: 40.0,
              //     letterSpacing: 1.5)),


          // actions: <Widget>[
          
          //     IconButton(
          //         icon: Icon(
          //           Icons.save_alt_outlined,
          //           color: Colors.blueGrey,
          //         ),
          //         onPressed: () =>
          //             // Navigator.pushNamed(context, yourProduct.routeName)
          //              Navigator.push(
          //               context,
          //               MaterialPageRoute(
          //                 builder: (context) => (yourProduct.routeName),

        // // // actions: <Widget>[
        // // //   IconButton(
        // // //     icon: Icon(
        // // //       Icons.save_outlined,
        // // //       color: Colors.blueGrey,
        // // //     ),
        // // //     onPressed: () =>
        // // //         Navigator.pushNamed(context, yourProduct.routeName)
        // // //         ,
        // // //   )
        // // //   //  :null,
        // // // ]),

        // appBar: AppBar(
        //  backgroundColor: Theme.of(context).primaryColor,

        // ),

        // title: Text(_pages[currentIndex]['title'],
        // // title: Text('Add Product'),
        // actions: <Widget>[
        // IconButton(
        //     icon: Icon(
        //       Icons.store,
        //       color: Colors.blueGrey,
        //     ),
        //     onPressed: () => Navigator.push(
        //           context,
        //           MaterialPageRoute<void>(
        //             builder: (BuildContext context) => const yourProduct(),
        //           ),
        //     ),
        // ),
        //  ] ),
        // //),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Title'),
            ),
            SizedBox(
              height: 25,
            ),
            TextField(
              controller: _priceController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Price'),
            ),
            SizedBox(
              height: 25,
            ),
            TextField(
              controller: _descController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Description'),
            ),
            SizedBox(
              height: 25,
            ),
            TextField(
              controller: _urlController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Image Url'),
            ),
            ElevatedButton(
                onPressed: () {
                  _args == null
                      ? Provider.of<Products>(context, listen: false)
                          .addProduct(
                              _titleController.text,
                              _descController.text,
                              _urlController.text,
                              double.parse(_priceController.text),
                              false)
                      : Provider.of<Products>(context, listen: false)
                          .updateProduct(
                              _args['id'],
                              _titleController.text,
                              _descController.text,
                              _urlController.text,
                              double.parse(_priceController.text),
                              false);
                  Navigator.pop(context);
                },
                child: Text(_args == null ? 'Add Product' : 'Edit Product'))
          ],
        ),
      ),
    );
  }
}

                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
//                   ;
//                   Navigator.pop(context);
//                 },
//                 child: Text(_args == null ? 'Add Product' : 'Edit Product'))
//           ]),
//         ));
//   }
// }
