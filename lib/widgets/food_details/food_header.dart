import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../models/food_models.dart';
import '../../utils/app_colors.dart';

class FoodHeader extends StatefulWidget {
  final FoodModel food;

  const FoodHeader({
    super.key,
    required this.food,
  });

  @override
  State<FoodHeader> createState() => _FoodHeaderState();
}

class _FoodHeaderState extends State<FoodHeader> {

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    // Ab selected food ki image use hogi
    final List images = [
      widget.food.image,
      widget.food.image,
      widget.food.image,
    ];

    return Column(
      children: [

        SizedBox(
          height: 210,
          child: CarouselSlider(
            options: CarouselOptions(
              height: 210,
              viewportFraction: 1,
              autoPlay: false,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),

            items: images.map((image) {

              return Image.network(
                image,
                fit: BoxFit.contain,

                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.image_not_supported,
                    size: 80,
                  );
                },

              );

            }).toList(),
          ),
        ),


        const SizedBox(height: 5),


        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            images.length,
                (index) {
              return _dot(index == currentIndex);
            },
          ),
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
              : AppColors.white,
        ),
      ),
    );
  }
}