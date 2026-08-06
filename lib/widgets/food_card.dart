import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/app_colors.dart';
import '../screens/food_detail.dart';
import '../models/food_models.dart';

class FoodCard extends StatelessWidget {
  final FoodModel food;
  const FoodCard({
    super.key,
    required this.food,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),

      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FoodDetail(food: food),
          ),
        );
      },

      child: Card(
        elevation: 2,
        color: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),

        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Rating
               Row(
                children: [
                  Icon(
                    Icons.star,
                    color: AppColors.star,
                    size: 12,
                  ),

                  SizedBox(width: 3),

                  Text(
                    food.rating,
                    style: GoogleFonts.dmSans(
                      color: AppColors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 5),

              Center(
                child: Image.network(
                  food.image,
                  height: 70,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.image_not_supported,
                      size: 50,
                    );
                  },
                ),
              ),

              const SizedBox(height: 5),

              // Name
              Text(
                food.name,
                style: GoogleFonts.dmSans(
                  color: AppColors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(height: 3),

              // Description
              if (food.description.isNotEmpty)
                Text(
                  food.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.dmSans(
                    color: AppColors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),

              const Spacer(),

              // Price + Button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  if (food.price.isNotEmpty)
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: food.price.substring(0, food.price.length - 3),
                            style: GoogleFonts.dmSans(
                              color: AppColors.buttonColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),

                          TextSpan(
                            text: food.price.substring(food.price.length - 3),
                            style: GoogleFonts.dmSans(
                              color: AppColors.buttonColor,
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),

                  if (food.price.isNotEmpty)
                    Container(
                      height: 22,
                      width: 22,

                      decoration: BoxDecoration(
                        color: AppColors.buttonColor,
                        borderRadius: BorderRadius.circular(50),
                      ),

                      child: const Icon(
                        Icons.add,
                        color: AppColors.white,
                        size: 15,
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}