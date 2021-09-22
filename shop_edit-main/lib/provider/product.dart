import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

enum Status { yourproducts, favourite }

class Product {
  String id, title, description, imgUrl;
  double price;
  bool isFav;
  Status? status;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.imgUrl,
    required this.price,
    required this.isFav,
    this.status,
  });

  changeStatus(String id) {}

  removeProduct(String id) {}
}

class Products with ChangeNotifier {
  List<Product> _products = [];

  // product(
  //   id: '1',
  //   title: 'Striped shirt',
  //   price: 150,
  //   description: 'Any Description',
  //   imgUrl:
  //       'https://rukminim1.flixcart.com/image/332/398/kngd0nk0/shirt/b/e/1/xl-shirts-sahi-hai-original-imag24khxshsg8yy.jpeg?q=50',
  //   isFav: false,
  // ),
  // product(
  //   id: '2',
  //   title: 'Product 2',
  //   price: 100,
  //   description: 'Any Description',
  //   imgUrl: 'https://m.media-amazon.com/images/I/61FLgJzwR3L._UL1024_.jpg',
  //   isFav: true,
  // ),
  // product(
  //   id: '3',
  //   title: 'Babyblue shirt',
  //   price: 150,
  //   description: 'Any Description',
  //   imgUrl:
  //       'https://www.dunhill.com/product_image/12574727np/f/w750_be4e4e4.jpg',
  //   isFav: false,
  // ),
  // product(
  //   id: '4',
  //   title: 'Product 4',
  //   price: 150,
  //   description: 'Any Description',
  //   imgUrl: 'https://m.media-amazon.com/images/I/71qVMnSWfAL._UL1024_.jpg',
  //   isFav: false,
  // ),
  // product(
  //   id: '5',
  //   title: 'Sport shirt',
  //   price: 150,
  //   description: 'Any Description',
  //   imgUrl:
  //       'https://12ax7web.s3.amazonaws.com/accounts/1/products/1986199879943/Ramen-Panda-tahiti-blue-light-t-shirt-teeturtle-full-21-1000x1000.jpg',
  //   isFav: false,
  // ),

  Product findById(String id) =>
      _products.firstWhere((element) => element.id == id);

  List<Product> filterProducts({Status? status}) {
    return _products.where((element) => element.status == status).toList();
  }

  Future<void> getData() async {
    var dbRef = FirebaseDatabase().reference().child('products');
    // var name = dbRef.key;
    var response = await dbRef.get();
    // print(response.key);
    // print(response.value);
    print(response);

    // var url = Uri.parse(
    //     'https://shop-store-4695b-default-rtdb.firebaseio.com/products.json');
    // var response = await http.get(url);
    var extractedData = response.value;

    print(extractedData);
    _products = [];
    if (extractedData == null) {
      return;
    }

    extractedData.forEach((id, data) {
      print(data);
      _products.add(
        Product(
          id: id,
          title: data['title'],
          description: data['description'],
          imgUrl: data['imgUrl'],
          price: double.parse(data['price'].toString()),
          isFav: false,
          status: data['status'],

//  bool b = 'tRuE'.parseBool();
          // status: convertToStatus(
          //   data['status'],
        ),
      );
    });
  }

  Future<void> addProduct(
    String title,
    description,
    imgUrl,
    double price,
    bool isFav,
  ) async {
    var dbRef = FirebaseDatabase().reference().child('products').push();
    await dbRef.set(
      {
        'title': title,
        'description': description,
        'imgUrl': imgUrl,
        'price': price,
        'isFav': isFav,
      },
    );

    notifyListeners();
  }

  Future<void> updateProduct(
    String id,
    title,
    description,
    imgUrl,
    double price,
    bool isFav,
  ) async {
    var dbRef = FirebaseDatabase().reference().child('products').child(id);
    await dbRef.update({
      'title': title,
      'description': description,
      'imgUrl': imgUrl,
      'price': price,
      'isFav': isFav,
      'status': null,
    });
    notifyListeners();
  }

  Future<void> removeProduct(String id) async {
    // var url = Uri.parse(
    //     'https://shop-store-4695b-default-rtdb.firebaseio.com/products/$id.json');
    // await http.delete(url);
    // _products.removeWhere((element) => element.id == id);
    // print(_products.length);

    var dbRef = FirebaseDatabase().reference().child('products').child(id);
    await dbRef.remove();
    notifyListeners();
  }

  Future<void> changeStatus(String id, Status status) async {
    // var url = Uri.parse(
    //     'https://shop-store-4695b-default-rtdb.firebaseio.com/products/$id.json');
    // await http.put(url,
    //     body: json.encode({
    //       'status': ConvertFromStatus(status),
    //     }));
    // _products.firstWhere((element) => element.id == id).status = status;
    var dbRef = FirebaseDatabase().reference().child('products').child(id);
    dbRef.update({
      'status': status,

      // 'status': convertFromStatus(status),
    });
    notifyListeners();
  }
}

String convertFromStatus(Status status) {
  if (status == Status.favourite) {
    return 'Favourite';
  }
  return 'yourproducts';
}

Status? convertToStatus(String? status) {
  if (status == 'favourite') {
    return Status.favourite;
  } else if (status == 'yourproducts') {
    return Status.yourproducts;
  } else {
    return null;
  }
}




























// // String? convertFromStatus(Status status) {
// //   if (status == Status.favourite) {
// //     return 'favourite';
// //   } else if (status == Status.yourproducts) {
// //     return 'yourproducts';
// //   }

// //   return null;
// //   //  else {
// //   //   return 'addproductscreen';
// //   // }
// // }


// String convertFromStatus(Status status) {
//   // if (status == Status.favourite) {
//   //   return 'favourite';
//   // }

//   if(status == Status.yourproducts){
//   return 'yourproducts';
// }



// Status? convertToStatus(String? status) {
//   if (status == 'Favourite') {
//     return Status.favourite;
//   } else if (status == 'yourproducts') {
//     return Status.yourproducts;
//   }

//   //  else if (status == 'addproductscreen')
//   // {
//   //   return Status.addproductscreen;
//   // }
//   return null;
// }


































// //to handle dynamic list
//     factory product.fromJson(Map<String, dynamic> parsedJson){
//     return product(
//         id: parsedJson['id'],
//         title : parsedJson['title'],
//         description : parsedJson ['description'],
//         imgUrl : parsedJson ['imgUrl'],
//         price : parsedJson ['price'],
//         isFav : parsedJson ['isFav']
//     );
//   }
// }

//   Map<String, dynamic> toMap() {
//     return {
//       "id": id,
//       "title": title,
//       "description": description,
//       "imgUrl": imgUrl,
//       "price": price,
//       "isFav": isFav,
//     };
//   }

//   // map(Container Function(String value) param0) {}
// }


