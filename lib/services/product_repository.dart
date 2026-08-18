import '../database/database_helper.dart';
import '../models/products_model.dart';
import 'products_service.dart';

class ProductRepository {
  final ProductService productService = ProductService();
  final DatabaseHelper databaseHelper = DatabaseHelper();

  Future<List<Product>> getProducts() async {
    // First check local database
    final localProducts = await databaseHelper.getProducts();

    // If data already exists in database
    if (localProducts.isNotEmpty) {
      return localProducts;
    }

    // If database is empty, get data from API
    final products = await productService.getProducts();

    // Save API data into local database
    await databaseHelper.insertProducts(products);

    // Get products from database
    return await databaseHelper.getProducts();
  }
}