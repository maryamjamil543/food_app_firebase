import 'package:firebase_database/firebase_database.dart';
import '../models/food_models.dart';

class FirebaseService {

  final DatabaseReference ref =
  FirebaseDatabase.instance.ref("foods");


  // Get all foods (burger + pizza + sandwich)
  Future<List<FoodModel>> getAllFoods() async {

    List<FoodModel> foods = [];

    DatabaseEvent event = await ref.once();

    final data = event.snapshot.value;

    if (data is Map) {

      data.forEach((category, value) {

        if (value is List) {

          for (var item in value) {

            if (item != null) {

              final foodData = Map<dynamic, dynamic>.from(item);

              foodData['category'] = category;

              foods.add(
                FoodModel.fromMap(foodData),
              );

            }
          }
        }
      });
    }

    return foods;
  }

}