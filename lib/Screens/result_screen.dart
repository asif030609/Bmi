import 'package:flutter/material.dart';
import '../Widgets/radial_gauge_meter.dart';
class Calculate extends StatelessWidget {
  final int weight;
  final double height;
  final int gender;

  const Calculate({
    super.key,
    required this.gender,
    required this.height,
    required this.weight,
  });
  double get ans {
    if (height == 0.0) {
      return 0.0; // Or handle the error in another way
    } else {
      return weight / ((height * 0.3048) * (height * 0.3048));
    }
  }

  int get value => gender;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    String bmiResultText = value == 1
        ? 'As a Male your BMI is ${ans.toStringAsFixed(2)}'
        : 'As a Female your BMI is ${ans.toStringAsFixed(2)}';

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenSize.width * 0.05),
            child: Column(
              children: [
                SizedBox(height: screenSize.height * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.deepPurple,
                        size: 25,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenSize.height * 0.02),
                const Text(
                  'Your BMI Result',
                  style: TextStyle(
                    fontFamily: 'Oswald',
                    fontSize: 34,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: screenSize.height * 0.03),
                radialGaugeMeter(Ans: ans),
                SizedBox(height: screenSize.height * 0.03),
                Text(
                  bmiResultText,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                SizedBox(height: screenSize.height * 0.03),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.18),
                  child: Column(
                    children: [
                      _buildBmiRow('<18.5', 'Under Weight', ans <= 18.5),
                      SizedBox(height: screenSize.height * 0.01),
                      _buildBmiRow('18.5 - 24.9', 'Healthy', ans >= 18.5 && ans <= 24.9),
                      SizedBox(height: screenSize.height * 0.01),
                      _buildBmiRow('25 - 29.9', 'Over Weight', ans >= 25 && ans <= 29.9),
                      SizedBox(height: screenSize.height * 0.01),
                      _buildBmiRow('30 - 34.9', 'Obese', ans >= 30 && ans <= 34.9),
                      SizedBox(height: screenSize.height * 0.01),
                      _buildBmiRow('>40', 'Highly Obese', ans >= 40),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }

  Row _buildBmiRow(String range, String category, bool isActive) {
    return Row(
      children: [
        Text(
          range,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: isActive ? Colors.deepPurple : Colors.black,
          ),
        ),
        const Spacer(),
        Text(
          category,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: isActive ? Colors.deepPurple : Colors.black,
          ),
        ),
      ],
    );
  }
}
