class FoodModel {
  final String name;
  final String description;
  final String image;
  final String price;
  final String rating;
  final String category;

  FoodModel({
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.rating,
    required this.category,
  });

  factory FoodModel.fromMap(Map<dynamic, dynamic> data) {
    return FoodModel(
      name: data['name'] ?? '',
      description: data['des'] ?? '',
      image: data['img'] ?? '',
      price: data['price'] ?? '',
      rating: data['rating'].toString(),
      category: data['category'] ?? '',
    );
  }
}