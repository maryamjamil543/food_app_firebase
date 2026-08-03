import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/app_colors.dart';

class SearchSection extends StatelessWidget {
  final ValueChanged onChanged;

  const SearchSection({
    super.key,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        // Search Box
        Container(
          width: 250,
          height: 60,

          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: AppColors.searchbar,
              width: 1.0,
            ),
          ),

          child: Row(
            children: [

              const SizedBox(width: 15),

              Image.asset(
                "assets/images/Search.png",
                width: 24,
                height: 24,
                fit: BoxFit.contain,
              ),

              const SizedBox(width: 10),

              Expanded(
                child: TextField(
                  onChanged: onChanged,
                  decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: GoogleFonts.dmSans(
                      color: AppColors.searchtext,
                      fontSize: 15,
                    ),

                    border: InputBorder.none,

                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(width: 12),
        // Tune Button
        Container(
          width: 56,
          height: 56,

          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColors.buttonColor,
              width: 1.5,
            ),
          ),

          child: Icon(
            Icons.tune,
            color: AppColors.buttonColor,
            size: 24,
          ),
        ),
      ],
    );
  }
}