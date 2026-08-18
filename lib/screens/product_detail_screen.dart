import 'package:flutter/material.dart';
import '../models/products_model.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Main Product Image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                product.thumbnail,
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 20),

            // Product Title
            Text(
              product.title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            // Price
            Text(
              '\$${product.price}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            // Description
            const Text(
              'Description',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            Text(
              product.description,
              style: const TextStyle(
                fontSize: 15,
              ),
            ),

            const SizedBox(height: 20),

            // Product Details Heading
            const Text(
              'Product Information',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            // ID
            Text(
              'ID: ${product.id}',
              style: const TextStyle(fontSize: 15),
            ),

            const SizedBox(height: 5),

            // Category
            Text(
              'Category: ${product.category}',
              style: const TextStyle(fontSize: 15),
            ),

            const SizedBox(height: 5),

            // Brand
            Text(
              'Brand: ${product.brand}',
              style: const TextStyle(fontSize: 15),
            ),

            const SizedBox(height: 5),

            // Rating
            Text(
              'Rating: ${product.rating} ⭐',
              style: const TextStyle(fontSize: 15),
            ),

            const SizedBox(height: 5),

            // Stock
            Text(
              'Stock: ${product.stock}',
              style: const TextStyle(fontSize: 15),
            ),

            const SizedBox(height: 5),

            // Discount
            Text(
              'Discount: ${product.discountPercentage}%',
              style: const TextStyle(fontSize: 15),
            ),

            const SizedBox(height: 25),

            // Product Images Heading
            const Text(
              'Product Images',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            // All Product Images
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: product.images.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        product.images[index],
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}