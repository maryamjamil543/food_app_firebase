import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../widgets/food_details/top_icon.dart';
import '../widgets/food_details/food_header.dart';
import '../widgets/food_details/food_info.dart';
import '../widgets/food_details/add_to_cart.dart';

class FoodDetail extends StatelessWidget {
  const FoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [

              const SizedBox(height: 15),
              DetailAppBar(),

              const SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      FoodHeader(),
                      const SizedBox(height: 20),
                      FoodInfo(),
                    ],
                  ),
                ),
              ),

              AddToCartButton(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}