import 'package:assessment_flutter/model/meal_model.dart';
import 'package:assessment_flutter/provider/meal_provider.dart';
import 'package:flutter/material.dart';

class MealDataListTile extends StatelessWidget {
  const MealDataListTile(
      {super.key,
      required this.mealData,
      required this.mealProvider,
      required this.index,
      required this.itemIndex});

  final MealModel mealData;
  final MealProvider mealProvider;
  final int index;
  final int itemIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.white))),
      child: Row(
        children: [
          Expanded(
            child: Text(
              mealData.calorieList[itemIndex].foodName,
              style: TextStyle(color: Colors.grey.shade600),
            ),
          ),
          Text(
            "${mealData.calorieList[itemIndex].cal} Cals",
            style: const TextStyle(color: Colors.black),
          ),
          IconButton(
              onPressed: () {
                if (mealProvider.mealEdit[index]) {
                  mealProvider.removeData(index, itemIndex);
                }
              },
              icon: CircleAvatar(
                radius: 10,
                backgroundColor:
                    !mealProvider.mealEdit[index] ? Colors.black : Colors.red,
                child: Icon(
                  !mealProvider.mealEdit[index]
                      ? Icons.arrow_forward_sharp
                      : Icons.close,
                  color: Colors.white,
                  size: 13,
                ),
              ))
        ],
      ),
    );
  }
}
