import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:products/models/product.dart';

class Api {
  Future<List<Product>> getProducts() async {
    final response = await http.get(
      Uri.parse('https://dummyjson.com/products'),
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final List<dynamic> list = data['products'];
      return list.map((item) => Product.fromJson(item)).toList();
    }
    throw Exception('Error');
  }
}
