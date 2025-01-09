import 'package:flutter/material.dart';
import 'package:wheel_slider/wheel_slider.dart';
class HeightChooser extends StatefulWidget {
  final ValueChanged<double> onHeightChanged;
  const HeightChooser({Key? key, required this.onHeightChanged})
      : super(key: key);
  @override
  State<HeightChooser> createState() => _HeightChooserState();

}

class _HeightChooserState extends State<HeightChooser> {
  _HeightChooserState();

  @override
  Widget build(BuildContext context) {
    int _nTotalCount = 100;
    double _nInitValue = 0.0;
    double _nCurrent_height_Value = 0.0;

    return WheelSlider.number(
      interval: 0.1, // this field is used to show decimal/double values
      perspective: 0.01,
      totalCount: _nTotalCount,
      initValue: _nInitValue,
      unSelectedNumberStyle: const TextStyle(
        fontSize: 15.0,
        color: Colors.black54,
      ),
      currentIndex: _nCurrent_height_Value,
      onValueChanged: (val) {
        setState(() {
          _nCurrent_height_Value = val;
        });
        widget.onHeightChanged(_nCurrent_height_Value);
      },
      hapticFeedbackType: HapticFeedbackType.heavyImpact,
    );
  }
}