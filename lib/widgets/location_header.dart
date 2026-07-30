import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
                children:  [
                  Image.asset(
                    "assets/images/Location.png",
                    height: 25,
                    width: 25,
                  ),
                  SizedBox(width: 4),
                  Text(
                    "Nevada, US",
                    style: GoogleFonts.roboto(
                      color: AppColors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    size: 20,
                    color: AppColors.buttonColor,
                  ),
                ],
              ),

              SizedBox(height: 18),

              Text(
                "Order Your Food\nFast and Free",
                style: GoogleFonts.roboto(
                  color: AppColors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
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