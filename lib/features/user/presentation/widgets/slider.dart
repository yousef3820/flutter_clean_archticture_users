import 'package:flutter/material.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({super.key, required this.currentValue, required this.onChanged});
  final double currentValue;
final ValueChanged<double> onChanged;
  Widget build(BuildContext context) {
    return Slider(
      value: currentValue,
      min: 1,
      max: 10,
      label: currentValue.toStringAsFixed(1),
      divisions: 9,
      activeColor: Colors.blue, 
      onChanged:onChanged
    );
  }
}
