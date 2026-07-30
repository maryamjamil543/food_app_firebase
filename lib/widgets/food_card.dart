import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/app_colors.dart';
import '../screens/food_detail.dart';

class FoodCard extends StatelessWidget {
  final String image;
  final String name;
  final String description;
  final String price;

  const FoodCard({
    super.key,
    required this.image,
    required this.name,
    required this.description,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),

      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const FoodDetail(),
          ),
        );
      },

      child: Card(
        elevation: 2,
        color: Colors.white,
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
                    "4.8",
                    style: GoogleFonts.dmSans(
                      color: AppColors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 5),

              // Burger Image
              Center(
                child: Image.asset(
                  image,
                  height: 70,
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(height: 5),

              // Name
              Text(
                name,
                style: GoogleFonts.dmSans(
                  color: AppColors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(height: 3),

              // Description
              if (description.isNotEmpty)
                Text(
                  description,
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
                  if (price.isNotEmpty)
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: price.substring(0, price.length - 3),
                            style: GoogleFonts.dmSans(
                              color: AppColors.buttonColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),

                          TextSpan(
                            text: price.substring(price.length - 3),
                            style: GoogleFonts.dmSans(
                              color: AppColors.buttonColor,
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),

                  if (price.isNotEmpty)
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