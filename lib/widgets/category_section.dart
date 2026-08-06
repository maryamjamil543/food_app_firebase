import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/app_colors.dart';


class CategorySection extends StatelessWidget {
  final String selectedCategory;
  final Function(String) onCategorySelected;

  const CategorySection({
    super.key,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  Widget categoryItem(
      String image,
      String title,
      bool selected,
      ) {

    return GestureDetector(
      onTap: () {
        onCategorySelected(title);
      },

      child: Container(
        width: 150,
        height: 55,
        decoration: BoxDecoration(
          color: selected
              ? AppColors.buttonColor
              : AppColors.white,
          borderRadius: BorderRadius.circular(15),

          border: Border.all(
            color: AppColors.buttonColor,
            width: 2,
          ),
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 12),
            Image.asset(
              image,
              height: 30,
              width: 30,
            ),

            const SizedBox(width: 6),
            Text(
              title,
              style: GoogleFonts.dmSans(
                color: selected
                    ? AppColors.white
                    : AppColors.black,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Categories",
          style: GoogleFonts.roboto(
            color: AppColors.category,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),

        const SizedBox(height: 10),
        SizedBox(
          height: 55,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              categoryItem(
                "assets/images/burger.png",
                "burger",
                selectedCategory == "burger",
              ),

              const SizedBox(width: 10),
              categoryItem(
                "assets/images/pizza.png",
                "pizza",
                selectedCategory == "pizza",
              ),

              const SizedBox(width: 10),
              categoryItem(
                "assets/images/sandwich.png",
                "sandwich",
                selectedCategory == "sandwich",
              ),
            ],
          ),
        ),
      ],
    );
  }
}