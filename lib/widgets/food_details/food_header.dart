import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../utils/app_colors.dart';


class FoodHeader extends StatefulWidget {
  const FoodHeader({super.key});

  @override
  State<FoodHeader> createState() => _FoodHeaderState();
}

class _FoodHeaderState extends State<FoodHeader> {
  int currentIndex = 0;

  final List<String> images = [
    "assets/images/Burger_detail.png",
    "assets/images/Burger_detail.png",
    "assets/images/Burger_detail.png",

  ];

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        SizedBox(
          height: 210,
          child: CarouselSlider(
            options: CarouselOptions(
              height: 210,
              viewportFraction: 1,
              autoPlay: false,
              onPageChanged: (index, reason){
                setState(() {
                  currentIndex = index;
                });
              },
            ),

            items: images.map((image){
              return Image.asset(
                image,
                fit: BoxFit.contain,
              );
            }).toList(),
          ),
        ),

        const SizedBox(height: 5),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            images.length,
                (index){
              return _dot(index == currentIndex);
            },
          ),
        ),
      ],
    );
  }

  Widget _dot(bool active){
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