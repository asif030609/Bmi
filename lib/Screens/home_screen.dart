import 'package:flutter/material.dart';

import '../Widgets/gender_chooser.dart';
import '../Widgets/height_chooser.dart';
import '../Widgets/weight_chooser.dart';
import 'result_screen.dart';

class BmiApp extends StatefulWidget {

  @override
  State<BmiApp> createState() => _BmiAppState();
}

class _BmiAppState extends State<BmiApp> {
  ButtonStyle buttonStyle = ElevatedButton.styleFrom(
    padding: const EdgeInsets.fromLTRB(87, 14, 87, 14),
    backgroundColor: Colors.deepPurple.shade400,
    foregroundColor: Colors.white,
  );
  double _height=0.0;
  int _weight=0;
  int _gender=0;

  void _UpdateHeight(double height){
    setState(() {
      _height=height;
    });
  }
  void _UpdateWeight(int weight){
    _weight=weight;
  }
  void _UpdateGender(int gender){
    _gender=gender;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 28,
          ),
          const Center(
            child: Text(
              'BMI Calculator',
              style: TextStyle(
                  fontFamily: 'Oswald',
                  fontSize: 34,
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          const Text(
            'Gender',
            style: TextStyle(
                fontFamily: 'Oswald',
                fontSize: 24,
                color: Color(0xFFA8A7A7),
                fontWeight: FontWeight.w300),
          ),
          const SizedBox(height: 40),
          GenderChooser(onGenderChanged:_UpdateGender),
          const SizedBox(height: 99),
          const Text(
            'Height:',
            style: TextStyle(
                fontFamily: 'Oswald',
                fontSize: 24,
                color: Color(0xFFA8A7A7),
                fontWeight: FontWeight.w300),
          ),
          const SizedBox(height: 20),
          HeightChooser(onHeightChanged: _UpdateHeight),
          const SizedBox(height: 20),
          const Text(
            'Weight:',
            style: TextStyle(
                fontFamily: 'Oswald',
                fontSize: 24,
                color: Color(0xFFA8A7A7),
                fontWeight: FontWeight.w300),
          ),
          const SizedBox(height: 20),
          WeightChooser(onWeightChanged: _UpdateWeight),
          const SizedBox(height: 130),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Calculate(height:_height ,weight:_weight, gender:_gender,),
                ),
              );
            },
            style: buttonStyle,
            child: const Text(
              'Calculate',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}