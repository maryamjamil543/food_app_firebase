import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 327,
      height: 61,

      child: ElevatedButton(
        onPressed: () {
        },

        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.buttonColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),

        child: const Text(
          "Add To Cart",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}