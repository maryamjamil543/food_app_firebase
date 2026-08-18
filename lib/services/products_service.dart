import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/products_model.dart';

class ProductService {
  Future<List<Product>> getProducts() async {
    final url = Uri.parse(
      'https://dummyjson.com/products?limit=0',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      final List products = data['products'];

      print('API products count: ${products.length}');

      return products
          .map((product) => Product.fromJson(product))
          .toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}