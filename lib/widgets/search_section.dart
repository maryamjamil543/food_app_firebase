import 'package:flutter/material.dart';
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
              prefixIcon: const Icon(Icons.search),

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),

        const SizedBox(width: 10),

        Container(
          height: 50,
          width: 50,

          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),

            border: Border.all(
              color: AppColors.buttonColor, // orange border
              width: 1.5,
            ),
          ),
          child: const Icon(
            Icons.tune,
            color: AppColors.buttonColor,
          ),
        )
      ],
    );
  }
}