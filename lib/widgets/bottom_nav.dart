import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: AppColors.buttonColor,
      selectedLabelStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        fontFamily: 'Roboto',
      ),

      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: AppColors.buttonColor,
            size: 28,
          ),
          label: "Home",
        ),

        BottomNavigationBarItem(
          icon: Icon(
            Icons.shopping_bag_outlined,
            color: AppColors.buttonColor,
            size: 28,
          ),
          label: "",
        ),

        BottomNavigationBarItem(
          icon: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(
                color: AppColors.buttonColor,
                width: 2,
              ),
            ),
            child: const Icon(
              Icons.more_horiz,
              color: AppColors.buttonColor,
              size: 22,
            ),
          ),
          label: "",
        ),
      ],
    );
  }
}