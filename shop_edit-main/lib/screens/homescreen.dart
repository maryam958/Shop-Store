import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import './productscreen.dart';
import './favourite.dart';
import 'yourproducts.dart';
import 'addproductscreen.dart';
//provider
import '../provider/product.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  late List<Map<String, dynamic>> _pages;

  void _changePage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    _pages = [
      {
        'title': 'ZARA',
        'page': ProductScreen(),
      },
        {
        'title': 'Favourite',
        'page': FavouriteScreen(),
      },
       {
        'title': 'Your Products',
        'page': yourProduct(),
      },
    
     
      {
        'title': 'Add Products',
        'page': AddProductScreen(),
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(_pages[_currentIndex]['title'],
              style: TextStyle(
                
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w800,
                  fontSize: 40.0,
                  letterSpacing: 1.5)),


          actions: <Widget>[
            if (_currentIndex == 0)
              IconButton(
                  icon: Icon(
                    Icons.store,
                    color: Colors.blueGrey,
                  ),
                  onPressed: () =>
                      // Navigator.pushNamed(context, yourProduct.routeName)
                       Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => yourProduct(),

                  // onPressed: () => Navigator.push(
                  //   context,
                  //   MaterialPageRoute<void>(
                  //     builder: (BuildContext context) => const yourProduct(),
                  )
              ))]),

      // floatingActionButton: _currentIndex == 0
      //     ? FloatingActionButton(
      //         onPressed: () =>
      //             Navigator.pushNamed(context, AddProductScreen.routeName),
      //         child: Icon(Icons.add),
      //       )
      //     : null,

      // // context,
      // // MaterialPageRoute<void>(
      // //   builder: (BuildContext context) => const yourProduct(),

      body: FutureBuilder(
        future: Provider.of<Products>(context).getData(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return _pages[_currentIndex]['page'];
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _changePage,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.blueGrey,

        unselectedItemColor: Colors.blueGrey,
        // type: BottomNavigationBarType.shifting,

        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            label: 'Product',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline_rounded),
            label: 'Favourite',
          ),
        ],
      ),

      // floatingActionButton: _currentIndex == 0
      //     ? FloatingActionButton(

      //         onPressed: () =>
      //             Navigator.pushNamed(context, AddProductScreen.routeName),
      //         child: Icon(Icons.add),
      //       )
      //     : null,
    );
  }
}
