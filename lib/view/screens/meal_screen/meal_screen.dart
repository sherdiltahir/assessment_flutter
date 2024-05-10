import 'package:assessment_flutter/gen/colors.gen.dart';
import 'package:assessment_flutter/provider/meal_provider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'widget/meal_list_tiles.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      Provider.of<MealProvider>(context, listen: false).init();
    });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        centerTitle: false,
        title: const Text(
          "Meal",
          style: TextStyle(color: ColorName.addIconBG),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_horiz, color: ColorName.addIconBG))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<MealProvider>(builder: (context, mealProvider, _) {
              return ListView.builder(
                  itemCount: mealProvider.mealList.length,
                  padding: const EdgeInsets.all(20),
                  itemBuilder: (context, int index) {
                    final mealData = mealProvider.mealList[index];
                    return MealListTile(
                        mealData: mealData,
                        index: index,
                        mealProvider: mealProvider);
                  });
            }),
          )
        ],
      ),
    );
  }
}
