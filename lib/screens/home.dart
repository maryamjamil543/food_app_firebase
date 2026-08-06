import 'package:flutter/material.dart';
import '../widgets/location_header.dart';
import '../widgets/search_section.dart';
import '../../utils/app_colors.dart';
import '../widgets/category_section.dart';
import '../widgets/food_card.dart';
import '../models/food_models.dart';
import '../services/firebase_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseService firebaseService = FirebaseService();
  List<FoodModel> foodList = [];
  String searchText = "";
  String selectedCategory = "pizza";

  @override
  void initState() {
    super.initState();
    loadFoods();
  }

  void loadFoods() async {
    final foods = await firebaseService.getAllFoods();

    setState(() {
      foodList = foods;
    });
  }

  @override
  Widget build(BuildContext context) {

    // final filteredList = foodList.where((food) {
    //   final query = searchText.trim().toLowerCase();
    //
    //   if(query.isNotEmpty){
    //     return food.name
    //         .toLowerCase()
    //         .contains(query);
    //   }
    //
    //   return food.name
    //       .toLowerCase()
    //       .contains(selectedCategory.toLowerCase());
    // }).toList();
    final filteredList = foodList.where((food) {

      final query = searchText.trim().toLowerCase();

      if (query.isNotEmpty) {
        return food.name.toLowerCase().contains(query);
      }

      return food.category.toLowerCase()
          .contains(selectedCategory.toLowerCase());

    }).toList();

    return Scaffold(
      backgroundColor: AppColors.white,
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
                selectedCategory: selectedCategory,
                onCategorySelected:(category){
                  setState((){
                    selectedCategory = category;
                    searchText = "";
                  });
                  loadFoods();
                },
              ),

              const SizedBox(height:20),

              Expanded(
                child: GridView.builder(
                  itemCount: filteredList.length,
                  gridDelegate:
                   SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:2,
                    mainAxisSpacing:18,
                    crossAxisSpacing:18,
                    childAspectRatio:.60,
                  ),

                  itemBuilder:(context,index){
                    return FoodCard(
                      food: filteredList[index],
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