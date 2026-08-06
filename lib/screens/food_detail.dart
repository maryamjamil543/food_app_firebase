import 'package:flutter/material.dart';
import '../../models/food_models.dart';
import '../../utils/app_colors.dart';
import '../widgets/food_details/top_icon.dart';
import '../widgets/food_details/food_header.dart';
import '../widgets/food_details/food_info.dart';
import '../widgets/food_details/add_to_cart.dart';

class FoodDetail extends StatelessWidget {
  final FoodModel food;

  const FoodDetail({
    super.key,
    required this.food,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.back,
      body: SafeArea(
        child: Stack(
          children: [
            Container(color: AppColors.back),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 15),
                  const DetailAppBar(),
                  const SizedBox(height: 15),

                  // Selected item pass karo
                  FoodHeader(food: food),
                ],
              ),
            ),

            Positioned(
              top: 305,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.fromLTRB(24, 28, 24, 20),
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: FoodInfo(food: food),
                      ),
                    ),
                    const SizedBox(height: 15),
                    const AddToCartButton(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}