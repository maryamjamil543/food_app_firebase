import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import '../widgets/food_details/top_icon.dart';
import '../widgets/food_details/food_header.dart';
import '../widgets/food_details/food_info.dart';
import '../widgets/food_details/add_to_cart.dart';

class FoodDetail extends StatelessWidget {
  const FoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.back,

      body: SafeArea(
        child: Stack(
          children: [

            /// Background
            Container(
              color: AppColors.back,
            ),

            /// Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: const [

                  SizedBox(height: 15),

                  DetailAppBar(),

                  SizedBox(height: 15),

                  FoodHeader(),
                ],
              ),
            ),

            /// Bottom Sheet
            Positioned(
              top: 305, // 305-315 ke beech adjust kar sakti ho
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                width: double.infinity,
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
                        child: FoodInfo(),
                      ),
                    ),

                    SizedBox(height: 15),

                    AddToCartButton(),
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