import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/app_colors.dart';

class FoodInfo extends StatefulWidget {
  const FoodInfo({super.key});

  @override
  State<FoodInfo> createState() => _FoodInfoState();
}

class _FoodInfoState extends State<FoodInfo> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                "Chicken\nburger",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,

                  style: GoogleFonts.dmSans(
                    color: AppColors.black,
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                  ),
              ),
            ),

            Icon(
              Icons.star,
              color: AppColors.star,
              size: 26,
            ),

            SizedBox(width: 3),



        RichText(
          text: TextSpan(
            children: [

              TextSpan(
                text: "4.8",
                style: GoogleFonts.dmSans(
                  color: AppColors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),

              TextSpan(
                text: " (41 Reviews)",
                style: GoogleFonts.dmSans(
                  color: AppColors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),

            ],
          ),
        ),
        ],
        ),

        const SizedBox(height:25),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            RichText(
              text: TextSpan(
                children: [

                  TextSpan(
                    text: "\$22.",
                    style: GoogleFonts.dmSans(
                      color: AppColors.buttonColor,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  TextSpan(
                    text: "00",
                    style: GoogleFonts.dmSans(
                      color: AppColors.buttonColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                ],
              ),
            ),


            Container(
              width: 118,
              height: 38,
              padding: const EdgeInsets.symmetric(horizontal: 6),

              decoration: BoxDecoration(
                color: AppColors.back,
                borderRadius: BorderRadius.circular(40),
              ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  GestureDetector(
                    onTap: (){
                      if(quantity > 1){
                        setState(() {
                          quantity--;
                        });
                      }
                    },
                    child: quantityButton(Icons.remove),
                  ),


                  Text(
                    quantity.toString(),
                    style: GoogleFonts.dmSans(
                      color: AppColors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                  GestureDetector(
                    onTap: (){
                      setState(() {
                        quantity++;
                      });
                    },
                    child: quantityButton(Icons.add),
                  ),

                ],
              ),
            ),

          ],
        ),

        const SizedBox(height: 20),

        // Food Information Cards
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            infoCard(
              "Size",
              "Medium",
            ),

            infoCard(
              "Energy",
              "554 KCal",
            ),

            infoCard(
              "Delivery",
              "45 min",
            ),
          ],
        ),

        const SizedBox(height: 20),

        // About
         Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "About",
            style: GoogleFonts.dmSans(
              color: AppColors.black,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),

        const SizedBox(height: 10),

        // Description
        Align(
          alignment: Alignment.centerLeft,
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Crispy seasoned chicken breast topped with, "
                      "mandatory melted cheese and piled onto soft rolls "
                      "with onion, avocado, lettuce, tomato and garlic mayo ",

                  style: GoogleFonts.dmSans(
                    color: AppColors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                TextSpan(
                  text: "if ordered",

                  style: GoogleFonts.dmSans(
                    color: AppColors.ordered,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),

                ),

                TextSpan(
                  text: ".",
                  style: GoogleFonts.dmSans(
                    color: AppColors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 20),
      ],
    );
  }

  Widget quantityButton(IconData icon){

    return Container(
      width: 29,
      height: 29,

      decoration: const BoxDecoration(
        color: AppColors.buttonColor,
        shape: BoxShape.circle,
      ),

      child: Icon(
        icon,
        color: AppColors.white,
        size: 28,
      ),
    );

  }

  // Info Card
  Widget infoCard(
      String title,
      String value,
      ){
    return Container(
      width: 93,
      height: 65,

      padding: const EdgeInsets.symmetric(
        horizontal: 7,
        vertical: 5,
      ),

      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),

        border: Border.all(
          color: AppColors.buttonColor,
          width: 1,
        ),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Text(
                title,
                style: GoogleFonts.dmSans(
                  color: AppColors.buttonColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),

              if(title == "Size")
                const Icon(
                  Icons.keyboard_arrow_down,
                  color: AppColors.buttonColor,
                  size: 18,
                ),
            ],
          ),

          const SizedBox(height: 2),

          Text(
            value,
            style: GoogleFonts.dmSans(
              color: AppColors.black,
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}