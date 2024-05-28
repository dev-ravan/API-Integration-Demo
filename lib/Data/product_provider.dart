import 'package:demo/Model/products_mod.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductProvider extends ChangeNotifier {
  final client = http.Client();
  List<Product> productList = [];

  Future<ProductsModel> fetchProduct() async {
    final response = await client.get(
      Uri.parse("https://dummyjson.com/products"),
    );

    return productsModelFromJson(response.body);
  }

  void listOfProducts() {
    fetchProduct().then((value) {
      if (value.products.isNotEmpty) {
        productList = value.products;
        notifyListeners();
      } else {
        productList = [];
      }
    });
  }

  final titleController = TextEditingController();

  Future addProduct() async {
    final response = client.post(
      Uri.parse("https://dummyjson.com/products/add"),
      body: <String, dynamic>{
        "title": titleController.text.trim(),
      },
    );
    return response;
  }
}
