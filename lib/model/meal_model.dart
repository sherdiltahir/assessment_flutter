class MealModel {
  final String mealName;
  final List<MealCalerieData> calorieList;

  MealModel({required this.calorieList, required this.mealName});
}

class MealCalerieData {
  final String foodName;

  final int cal;

  MealCalerieData({required this.cal, required this.foodName});
}
