import 'package:assessment_flutter/model/meal_model.dart';
import 'package:flutter/material.dart';

class MealProvider with ChangeNotifier {
  List<MealModel> mealList = <MealModel>[];

  final mealEdit = <bool>[];

  void addItem(MealCalerieData data, int index) {
    mealList[index].calorieList.add(data);
    notifyListeners();
  }

  void init() {
    mealList = List.generate(
        6,
        (index) => MealModel(
            calorieList: <MealCalerieData>[], mealName: "Meal ${index + 1}"));

    for (final value in mealList) {
      mealEdit.add(false);
    }
    notifyListeners();
  }

  void changeEditState(int index) {
    mealEdit[index] = !mealEdit[index];
    notifyListeners();
  }

  void removeData(int index, int itemIndex) {
    mealList[index].calorieList.removeAt(itemIndex);
    if (mealList[index].calorieList.isEmpty) {
      mealEdit[index] = false;
    }
    notifyListeners();
  }
}
