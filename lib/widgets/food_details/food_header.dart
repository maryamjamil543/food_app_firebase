import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';

class FoodHeader extends StatelessWidget {
  const FoodHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        // Burger Image
        SizedBox(
          height: 210,
          child: Image.asset(
            "assets/images/Burger_detail.png",
            fit: BoxFit.contain,
          ),
        ),

        const SizedBox(height: 3),

        // 4 Dot Indicator
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _dot(true),
            _dot(false),
            _dot(false),
            _dot(false),
          ],
        ),

      ],
    );
  }
  Widget _dot(bool active) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: active
            ? Border.all(
          color: AppColors.buttonColor,
          width: 1.5,
        )
            : null,
      ),
      child: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: active
              ? AppColors.buttonColor
              : Colors.white,
        ),
      ),
    );
  }
}