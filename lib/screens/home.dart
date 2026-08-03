import 'package:flutter/material.dart';
import '../widgets/location_header.dart';
import '../widgets/search_section.dart';
import '../widgets/category_section.dart';
import '../widgets/food_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String,String>> foodList = const [

    {
      "image":"assets/images/chicken_burger.png",
      "name":"Chicken burger",
      "description":"Chicken + cheese\nLettuce + tomato",
      "price":"\$22.00",
      "category":"Burger",
    },

    {
      "image":"assets/images/cheese-burger.png",
      "name":"Cheese burger",
      "description":"Beef + cheese\nFresh vegetables",
      "price":"\$25.00",
      "category":"Burger",
    },

    {
      "image":"assets/images/cheese-burger.png",
      "name":"Cheese burger",
      "description":"Beef + Onion\nFresh vegetables",
      "price":"\$25.00",
      "category":"Burger",
    },

    {
      "image":"assets/images/chicken_burger.png",
      "name":"Chicken burger",
      "description":"Chicken + cheese\nLettuce + tomato",
      "price":"\$22.00",
      "category":"Burger",
    },

    {
      "image":"assets/images/pizza.png",
      "name":"Pizza",
      "description":"Cheese + Olives",
      "price":"\$30.00",
      "category":"Pizza",
    },

    {
      "image":"assets/images/sandwich.png",
      "name":"Sandwich",
      "description":"Chicken + Mayo",
      "price":"\$18.00",
      "category":"Sandwich",
    },
  ];

  String searchText = "";
  String selectedCategory = "Burger";

  @override
  Widget build(BuildContext context) {
    final filteredList = foodList.where((food) {
      if(searchText.isNotEmpty){
        return food["name"]!
            .toLowerCase()
            .contains(searchText.toLowerCase());
      }
      return food["category"] == selectedCategory;
    }).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:20),
          child: Column(
            children: [
              const SizedBox(height:20),
              const LocationHeader(),

              const SizedBox(height:25),
              SearchSection(
                onChanged:(value){
                  setState((){
                    searchText = value;
                  });
                },
              ),

              const SizedBox(height:20),
              CategorySection(
                selectedCategory:selectedCategory,
                onCategorySelected:(category){
                  setState((){
                    selectedCategory = category;
                    searchText = "";
                  });
                },
              ),

              const SizedBox(height:20),

              Expanded(
                child: GridView.builder(
                  itemCount: filteredList.length,
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:2,
                    mainAxisSpacing:18,
                    crossAxisSpacing:18,
                    childAspectRatio:.60,
                  ),

                  itemBuilder:(context,index){
                    return FoodCard(
                      image: filteredList[index]["image"]!,
                      name: filteredList[index]["name"]!,
                      description: filteredList[index]["description"]!,
                      price: filteredList[index]["price"]!,
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