import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class LocationHeader extends StatelessWidget {
  const LocationHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Icon(
                    Icons.location_on,
                    color: AppColors.buttonColor,
                    size: 20,
                  ),
                  SizedBox(width: 4),
                  Text(
                    "Nevada, US",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Roboto',
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    size: 18,
                    color: AppColors.buttonColor,
                  ),
                ],
              ),

              SizedBox(height: 18),

              Text(
                "Order Your Food\nFast and Free",
                style: TextStyle(
                  fontSize: 28,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  height: 1.0,
                  color: AppColors.black,
                ),
              ),
            ],
          ),
        ),

        // Right Side Image
        Image.asset(
          "assets/images/delivery.png",
          width: 92,
          height: 90,
          fit: BoxFit.contain,
        ),
      ],
    );
  }
}