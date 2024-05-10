import 'package:assessment_flutter/gen/colors.gen.dart';
import 'package:assessment_flutter/model/meal_model.dart';
import 'package:assessment_flutter/provider/meal_provider.dart';
import 'package:assessment_flutter/view/screens/meal_screen/bottom_sheets/add_meal_bottom_sheet.dart';
import 'package:assessment_flutter/view/screens/meal_screen/custom_painter/meal_card_add_button_painter.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'meal_data_list_tile.dart';

class MealListTile extends StatelessWidget {
  const MealListTile(
      {super.key,
      required this.mealData,
      required this.index,
      required this.mealProvider});
  final MealModel mealData;
  final int index;
  final MealProvider mealProvider;
  @override
  Widget build(BuildContext context) {
    int calculateTotal = 0;

    for (var element in mealData.calorieList) {
      calculateTotal = calculateTotal + element.cal;
    }
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.only(left: 10, top: 0, bottom: 10, right: 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: ColorName.bgScaffoldColor,
                      ),
                      padding: const EdgeInsets.all(20),
                      child: const Center(
                        child: Icon(
                          Icons.sunny,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const Gap(10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          mealData.mealName,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        const Gap(5),
                        Row(
                          children: [
                            InkWell(
                              onTap: () => mealData.calorieList.isNotEmpty
                                  ? mealProvider.changeEditState(index)
                                  : null,
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: mealData.calorieList.isEmpty
                                        ? Colors.grey.shade400
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                      color: mealData.calorieList.isNotEmpty
                                          ? !mealProvider.mealEdit[index]
                                              ? Colors.black
                                              : Colors.green
                                          : Colors.transparent,
                                      width: 1,
                                    )),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 2.5),
                                child: Center(
                                  child: Text(
                                    mealData.calorieList.isNotEmpty
                                        ? !mealProvider.mealEdit[index]
                                            ? "Edit"
                                            : "Save"
                                        : "No Products",
                                    style: TextStyle(
                                        color: mealData.calorieList.isNotEmpty
                                            ? !mealProvider.mealEdit[index]
                                                ? Colors.black
                                                : Colors.green
                                            : Colors.white,
                                        fontSize: 12),
                                  ),
                                ),
                              ),
                            ),
                            const Gap(5),
                            const Icon(
                              Icons.bookmark_outline,
                              size: 15,
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () async => mealProvider.addItem(
                    await AddMealBottomSheet.addMealMenu(context), index),
                child: CustomPaint(
                  painter: StrokeToAddButton(),
                  child: Container(
                    decoration: const BoxDecoration(
                        color: ColorName.addIconBG,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5),
                            topRight: Radius.circular(20))),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
          Visibility(
            visible: mealData.calorieList.isNotEmpty,
            replacement: Container(),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              margin: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: List.generate(
                        mealData.calorieList.length,
                        (itemIndex) => MealDataListTile(
                            mealData: mealData,
                            mealProvider: mealProvider,
                            index: index,
                            itemIndex: itemIndex)),
                  ),
                  const Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: TextStyle(color: Colors.green.shade500),
                      ),
                      const Spacer(
                        flex: 4,
                      ),
                      Text(
                        "$calculateTotal Cals",
                        style: TextStyle(color: Colors.green.shade500),
                      ),
                      const Spacer()
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
