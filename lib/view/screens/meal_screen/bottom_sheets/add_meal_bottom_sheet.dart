import 'package:assessment_flutter/model/meal_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';

class AddMealBottomSheet {
  AddMealBottomSheet._();

  static Future<MealCalerieData> addMealMenu(BuildContext context) async {
    String mealItem = "";
    int calorie = 0;
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final mealData = await showModalBottomSheet(
        builder: (context) => Padding(
              padding: const EdgeInsets.all(25),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Add Meal Name and Calories",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const Gap(40),
                    TextFormField(
                      onChanged: (value) {
                        mealItem = value;
                      },
                      validator: (value) => validateTextField(value!),
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(10),
                          hintText: "Enter Name",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                    ),
                    const Gap(10),
                    TextFormField(
                      validator: (value) => validateTextField(value!),
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      onChanged: (value) {
                        calorie = int.parse(value);
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(10),
                          hintText: "Enter Calories",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                    ),
                    const Gap(40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white, elevation: 0),
                            onPressed: () => Navigator.pop(context),
                            child: const Text(
                              "Cancel",
                              style: TextStyle(color: Colors.black),
                            )),
                        const Gap(20),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black, elevation: 0),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                Navigator.pop(
                                    context,
                                    MealCalerieData(
                                        cal: calorie, foodName: mealItem));
                              }
                            },
                            child: const Text(
                              "Add",
                              style: TextStyle(color: Colors.white),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.white);

    return mealData;
  }

  static String? validateTextField(String value) {
    if (value.isEmpty) {
      return "Required*";
    }
    return null;
  }
}
