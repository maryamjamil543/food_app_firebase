import 'package:flutter/material.dart';
import '../widgets/location_header.dart';
import '../widgets/search_section.dart';
import '../widgets/category_section.dart';
import '../widgets/food_card.dart';
import '../widgets/bottom_nav.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Map<String, String>> foodList = const [

    {
      "image": "assets/images/chicken_burger.png",
      "name": "Chicken Burger",
      "description": "Chicken + cheese\nLettuce + tomato",
      "price": "\$22.00",
    },

    {
      "image": "assets/images/cheese-burger.png",
      "name": "Cheese Burger",
      "description": "Beef + cheese\nFresh vegetables",
      "price": "\$25.00",
    },

    {
      "image": "assets/images/cheese-burger.png",
      "name": "Cheese Burger",
    },

    {
      "image": "assets/images/chicken_burger.png",
      "name": "Chicken Burger",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const BottomNav(),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),

          child: Column(
            children: [
              const SizedBox(height: 20),
              const LocationHeader(),
              const SizedBox(height: 25),
              const SearchSection(),
              const SizedBox(height: 20),
              const CategorySection(),
              const SizedBox(height: 20),

              Expanded(
                child: GridView.builder(
                  itemCount: foodList.length,
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 18,
                    crossAxisSpacing: 18,
                    childAspectRatio: .68,
                  ),

                  itemBuilder: (context, index) {
                    return FoodCard(
                      image: foodList[index]["image"] ?? "",
                      name: foodList[index]["name"] ?? "",
                      description: foodList[index]["description"] ?? "",
                      price: foodList[index]["price"] ?? "",
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}