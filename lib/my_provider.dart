import 'dart:async';
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:provider_shop/product.dart';

class MyProvider extends ChangeNotifier {
  List<Product> _list = [];
  List<Product> get list => _list;

  final List<Product> _cart = [];
  List<Product> get cart => _cart;

  Future<dynamic> _callApiRequest() async {
    final response = await http.get(
      Uri.parse("https://fakestoreapi.com/products"),
    );
    return response.body;
  }

  Future<List<Product>> getProducts() async {
    final responseBody = await _callApiRequest();
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    _list = parsed.map<Product>((json) => Product.fromJson(json)).toList();
    return _list;
  }

  void addProductToCart(Product product) {
    _cart.add(product);
  }

  void buy() {
    _cart.clear();
    notifyListeners();
  }

  String countFullPrice() {
    double price = 0;
    for (var product in _cart) {
      price += product.price;
    }
    return price.toStringAsFixed(2);
  }
}
