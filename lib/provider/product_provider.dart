import 'package:flutter/material.dart';
import 'package:state_managment_session/model/product_model.dart';

class ProductProvider extends ChangeNotifier {
  List<ProductModel> products = [
    ProductModel(
      name: "Iphone 20",
      price: "30000",
      rating: "5",
      brand: "Apple",
    ),
    ProductModel(
      name: "Iphone 100",
      price: "30000",
      rating: "5",
      brand: "Apple",
    ),
    ProductModel(
      name: "Iphone 1",
      price: "30000",
      rating: "5",
      brand: "Apple",
    ),
  ];

  Set<ProductModel> favorite = {};

  void addToFavorite(ProductModel product) {
    // if (favorite.contains(product)) {
    // } else {
      favorite.add(product);
      
    // }
    notifyListeners();
  }

  void remove(ProductModel product) {
    favorite.remove(product);
    notifyListeners();
  }
}
