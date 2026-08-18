import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/app_colors.dart';
import '../widgets/bottom_nav.dart';
import 'login.dart';
import '../services/product_repository.dart';

class IntroScreen extends StatefulWidget {
const IntroScreen({super.key,});

@override
State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final ProductRepository productRepository =
  ProductRepository();

  bool isLoading = false;

@override
void initState() {
super.initState();
}
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
                      onTap: () async {
                        loadAlreadyLogin();
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
          if (isLoading)
            Center(
              child: Container(
                width: 180,
                height: 80,
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Center(
                  child: SizedBox(
                    width: 30,
                    height: 30,
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Future<void> loadAlreadyLogin() async {

    setState(() {
      isLoading = true;
    });

    try {
      // First load products into local database
      await productRepository.getProducts();

      // Now check login status
      final prefs = await SharedPreferences.getInstance();

      final isLoggedIn =
          prefs.getBool('isLoggedIn') ?? false;

      if (!mounted) return;

      if (isLoggedIn) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const BottomNav(),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      }

    } catch (e) {

      print('Error loading products: $e');

    } finally {

      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }
}
