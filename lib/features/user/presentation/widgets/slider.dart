import 'package:flutter/material.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({super.key, required this.currentValue, required this.onChanged});
  final double currentValue;
  final ValueChanged<double> onChanged;
  @override
  Widget build(BuildContext context) {
    return Slider(
      value: currentValue,
      min: 0,
      max: 10,
      label: currentValue.toStringAsFixed(1),
      divisions: 10,
      activeColor: Colors.blue, 
      onChanged:onChanged
    );
  }
}
