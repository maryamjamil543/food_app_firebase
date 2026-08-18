import 'package:flutter/material.dart';
import '../models/products_model.dart';
//import '../services/products_service.dart';
import 'product_detail_screen.dart';
//import '../services/product_repository.dart';
import '../database/database_helper.dart';

class ProductsScreen extends StatefulWidget {
   const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();

}

class _ProductsScreenState extends State<ProductsScreen> {
  final DatabaseHelper databaseHelper = DatabaseHelper();
  //final ProductRepository productRepository = ProductRepository();


  List<Product> products = [];
 // bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadProducts();
    //fetchProducts();
  }

  Future<void> loadProducts() async {
    try {
      final data = await databaseHelper.getProducts();

      setState(() {
        products = data;
       // isLoading = false;
      });
    } catch (e) {
      setState(() {
       // isLoading = false;
      });

      print('Error: $e');
    }
  }

  // Future<void> fetchProducts() async {
  //   try {
  //     //final data = await productService.getProducts();
  //     final data = await productRepository.getProducts();
  //
  //     setState(() {
  //       products = data;
  //       isLoading = false;
  //     });
  //   } catch (e) {
  //     setState(() {
  //       isLoading = false;
  //     });
  //
  //     print('Error: $e');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),

      body
          //: isLoading
          //? const Center(
        //child: CircularProgressIndicator(),
     // )
          : ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];

          return Card(
            margin: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 6,
            ),
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailScreen(
                      product: product,
                    ),
                  ),
                );
              },

              leading: Image.network(
                product.thumbnail,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),

              title: Text(
                product.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),

              subtitle: Text(
                '\$${product.price}',
              ),

              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 16,
              ),
            ),
          );
        },
      ),
    );
  }
}