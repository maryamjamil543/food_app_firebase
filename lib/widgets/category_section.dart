import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        const Text(
          "Categories",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            fontFamily: 'Roboto',
            color: AppColors.category,
          ),
        ),

        const SizedBox(height: 10),

        SizedBox(
          height: 45,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Chip(
                avatar: Image.asset(
                  "assets/images/burger.png",
                  height: 25,
                  width: 25,
                ),
                label: const Text("Burger",
                  style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'DM Sans',
                   color: AppColors.black,
                  ),
                ),
                backgroundColor: AppColors.buttonColor,
                side: BorderSide(
                  color: AppColors.buttonColor,
                  width: 1,
                ),
              ),

              const SizedBox(width: 10),

              Chip(
                avatar: Image.asset(
                  "assets/images/pizza.png",
                  height: 25,
                  width: 25,
                ),
                label: const Text("Pizza",
                   style: TextStyle(
                   fontSize: 18,
                   fontWeight: FontWeight.w700,
                    fontFamily: 'DM Sans',
                   color: AppColors.black,
                   ),
                ),
                backgroundColor: Colors.white,
                side: BorderSide(
                  color: AppColors.buttonColor,
                  width: 1,
                ),
              ),

              const SizedBox(width: 10),

              Chip(
                avatar: Image.asset(
                  "assets/images/sandwich.png",
                  height: 25,
                  width: 25,
                ),
                label: const Text("Sandwich",
                   style: TextStyle(
                   fontSize: 18,
                    fontWeight: FontWeight.w700,
                     fontFamily: 'DM Sans',
                     color: AppColors.black,
                    ),
                ),
                backgroundColor: AppColors.background,
                side: BorderSide(
                  color: AppColors.buttonColor,
                  width: 1,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}