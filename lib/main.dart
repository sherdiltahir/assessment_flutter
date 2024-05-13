import 'package:assessment_flutter/gen/colors.gen.dart';
import 'package:assessment_flutter/gen/fonts.gen.dart';
import 'package:assessment_flutter/provider/meal_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'view/screens/meal_screen/meal_screen.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MealProvider(),
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Meal App',
          theme: ThemeData(
            fontFamily: FontFamily.poppins,
            dialogBackgroundColor: ColorName.bgScaffoldColor,
            scaffoldBackgroundColor: ColorName.bgScaffoldColor,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
            useMaterial3: true,
          ),
          home: const MealScreen()),
    );
  }
}
