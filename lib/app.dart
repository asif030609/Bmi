
import 'package:bmi_calculator/Screens/home_screen.dart';
import 'package:flutter/material.dart';

class BmiCalculator extends StatelessWidget {
  const BmiCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: BmiApp(),
      themeMode: ThemeMode.system,

    );

  }
  ThemeData _dartThemeData() {
    return ThemeData(
      brightness: Brightness.dark,

    );
  }
}
