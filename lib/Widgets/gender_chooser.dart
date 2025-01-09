import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toggle_switch/toggle_switch.dart';

class GenderChooser extends StatefulWidget {
  final ValueChanged<int> onGenderChanged;

  const GenderChooser({Key? key, required this.onGenderChanged})
      : super(key: key);

  @override
  State<GenderChooser> createState() => _GenderChooserState();
}

class _GenderChooserState extends State<GenderChooser> {
  int _selectedGender = 0; // Initial selected gender (index 1)

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blue, // Set your desired border color here
          width: 2.0, // Set the border width
        ),
        borderRadius: BorderRadius.circular(22.0), // Match the corner radius of ToggleSwitch
      ),
      child: ToggleSwitch(
        minWidth: 118.0,
        cornerRadius: 20.0,
        minHeight: 44,
        activeFgColor: Colors.white,
        inactiveBgColor: Colors.white,
        inactiveFgColor: Colors.deepPurple,
        totalSwitches: 2,
        icons: const [FontAwesomeIcons.venus, FontAwesomeIcons.mars],
        activeBgColors: const [[Colors.deepPurple], [Colors.deepPurple]],
        initialLabelIndex: _selectedGender,
        onToggle: (index) {
          setState(() {
            _selectedGender = index!;
          });
          widget.onGenderChanged(index!);
        },
        labels: const ['Female', 'Male'], // Add text labels
      ),
    );
  }

  void switchGender(int index) {
    setState(() {
      _selectedGender = index; // Update the state variable
    });
    widget.onGenderChanged(_selectedGender); // Call the callback with the new index
  }
}
