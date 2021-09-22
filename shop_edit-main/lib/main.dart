import 'package:finalproject/provider/product.dart';
import 'package:finalproject/screens/yourproducts.dart';
import 'package:flutter/material.dart';
import './screens/addproductscreen.dart';
import 'package:firebase_core/firebase_core.dart';
//screen
import './screens/homescreen.dart';

//provider
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());


}



class MyApp extends StatelessWidget {

  
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return ChangeNotifierProvider.value(
      value: Products(),
      child: MaterialApp(
          // title: "ZARA",
          theme: ThemeData(
              brightness: Brightness.light,
              // canvasColor: Colors.white,
              primaryColor: Colors.black,
              fontFamily: "Montserrat",
              ),
          // home: HomeScreen(),
          routes: {
            '/': (_) => HomeScreen(),
            //yourProduct.routeName: (ctx) => yourProduct(),
            AddProductScreen.routeName: (ctx) => AddProductScreen(),
          }),
    );

   
  }
}
