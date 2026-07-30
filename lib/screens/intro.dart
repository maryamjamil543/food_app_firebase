import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/app_colors.dart';
import 'home.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          // Background Image
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              "assets/images/back_img.png",
              fit: BoxFit.cover,
            ),
          ),

          // Black Gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  AppColors.overlay,
                ],
              ),
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const Spacer(),

                  Text(
                    "Find and Get\nYour Best Food",
                    style: GoogleFonts.roboto(
                      color: AppColors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 16),
                  Text(
                    "Find the most delicious food\nwith the best quality and free delivery here.",
                    style: GoogleFonts.roboto(
                      color: AppColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                  const SizedBox(height: 40),

                  Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                      },
                      child: Image.asset(
                        "assets/images/next.png",
                        width: 60,
                        height: 60,
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                   Center(
                    child: Text(
                      "Skip",
                      style: GoogleFonts.roboto(
                        color: AppColors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),                    ),
                  ),

                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}