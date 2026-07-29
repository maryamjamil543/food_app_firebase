import 'package:flutter/material.dart';
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

        // Price & Quantity
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            RichText(
              text: const TextSpan(
                children: [

                  TextSpan(
                    text: "\$22.",
                    style: TextStyle(
                      color: AppColors.buttonColor,
                      fontSize: 24,
                      fontFamily: "DM Sans",
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  TextSpan(
                    text: "00",
                    style: TextStyle(
                      color: AppColors.buttonColor,
                      fontSize: 18,
                      fontFamily: "DM Sans",
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                ],
              ),
            ),


            Row(
              children: [
                GestureDetector(
                  onTap: (){
                    if(quantity > 1){
                      setState(() {
                        quantity--;
                      });
                    }
                  },
                  child: circleButton(Icons.remove),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    quantity.toString(),
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      fontFamily: "DM Sans",
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: (){
                    setState(() {
                      quantity++;
                    });
                  },
                  child: circleButton(Icons.add),
                ),
              ],
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
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "About",
            style: TextStyle(
              fontSize: 18,
              color: AppColors.black,
              fontWeight: FontWeight.w500,
              fontFamily: "DM Sans",
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
                  text: "Crispy seasoned chicken breast topped with melted cheese, "
                      "mandatory melted cheese and piled onto soft rolls "
                      "with onion, avocado, lettuce, tomato and garlic mayo ",

                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.category,
                    fontFamily: "DM Sans",
                  ),
                ),

                TextSpan(
                  text: "if ordered.",

                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontFamily: "DM Sans",
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

  // Plus Minus Button
  Widget circleButton(IconData icon){

    return Container(
      width: 32,
      height: 32,
      decoration: const BoxDecoration(
        color: AppColors.buttonColor,
        shape: BoxShape.circle,
      ),

      child: Icon(
        icon,
        color: AppColors.white,
        size: 20,
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
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.buttonColor,
                  fontWeight: FontWeight.w500,
                  fontFamily: "DM Sans",
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
            style: const TextStyle(
              fontSize: 18,
              color: AppColors.black,
              fontWeight: FontWeight.w500,
              fontFamily: "DM Sans",
            ),
          ),
        ],
      ),
    );
  }
}