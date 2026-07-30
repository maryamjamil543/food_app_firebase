import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/app_colors.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search",

              hintStyle: GoogleFonts.roboto(
                color: AppColors.searchtext,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),

              prefixIcon: Padding(
                padding: const EdgeInsets.all(12),
                child: Image.asset(
                  "assets/images/Search.png",
                  height: 25,
                  width: 25,
                ),
              ),

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: AppColors.searchbar,
                  width: 1.5,
                ),
              ),
            ),
          ),
        ),

        const SizedBox(width: 10),

        Container(
          height: 60,
          width: 60,

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
            size: 28,
          ),
        ),
      ],
    );
  }
}