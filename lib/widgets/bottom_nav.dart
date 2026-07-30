import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/app_colors.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),

        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),


      child: ClipRRect(

        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),


        child: BottomNavigationBar(

          backgroundColor: Colors.white,

          elevation: 0,

          currentIndex: 0,

          selectedItemColor: AppColors.buttonColor,

          unselectedItemColor: AppColors.buttonColor,


          selectedLabelStyle: GoogleFonts.roboto(
            color: AppColors.buttonColor,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),


          type: BottomNavigationBarType.fixed,


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

                  color: AppColors.white,

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
        ),
      ),
    );
  }
}