import 'package:flutter/material.dart';
import 'package:wheel_slider/wheel_slider.dart';

class WeightChooser extends StatefulWidget {

  final ValueChanged<int> onWeightChanged;

  const WeightChooser({Key? key, required this.onWeightChanged})
      : super(key: key);
  @override
  State<WeightChooser> createState() => _WeightChooserState();
}

class _WeightChooserState extends State<WeightChooser> {
  @override
  Widget build(BuildContext context) {
    const int _nTotalCount = 99;
    const int _nInitValue = 0;
    int  nCurrent_weight_Value = 0;
    return  WheelSlider.number(
      interval: 1,
      // this field is used to show decimal/double values
      perspective: 0.01,
      totalCount: _nTotalCount,
      initValue: _nInitValue,
      unSelectedNumberStyle: const TextStyle(
        fontSize: 15.0,
        color: Colors.black54,
      ),
      currentIndex: 0,
      onValueChanged: (val) {
        setState(() {
          nCurrent_weight_Value = val;
        });

        widget.onWeightChanged(nCurrent_weight_Value);
      },
      hapticFeedbackType: HapticFeedbackType.heavyImpact,
    );
  }
}
