import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/app_colors.dart';
import '../screens/home.dart';
import '../screens/cart_screen.dart';
import '../screens/more_screen.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentIndex = 0;

  final List<Widget> screens = [
    const HomeScreen(),
    const CartScreen(),
    const MoreScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: screens[currentIndex],
      bottomNavigationBar: Container(

        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),

          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0,-2),
            ),
          ],
        ),

        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),

          child: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index){
              setState((){
                currentIndex = index;
              });
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            elevation: 0,
            selectedItemColor: AppColors.buttonColor,
            unselectedItemColor: AppColors.buttonColor,
            selectedLabelStyle: GoogleFonts.roboto(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),

            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size:28,
                ),
                label:"Home",
              ),

              BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_bag_outlined,
                  size:28,
                ),
                label:"Cart",
              ),

              BottomNavigationBarItem(
                icon: Icon(
                  Icons.more_horiz,
                  size:28,
                ),
                label:"More",
              ),
            ],
          ),
        ),
      ),
    );
  }
}