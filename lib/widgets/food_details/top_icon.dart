import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';

class DetailAppBar extends StatelessWidget {
  const DetailAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        // Back Button
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: AppColors.back, // Cream color
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color:  AppColors.black, // Light grey border
              width: 1,
            ),
          ),
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              size: 18,
              color: AppColors.black,
            ),
          ),
        ),

        // Favorite Button
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: AppColors.back, // Cream color
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color:  AppColors.black,
              width: 1,
            ),
          ),
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_border,
              size: 20,
              color: AppColors.black,
            ),
          ),
        ),
      ],
    );
  }
}