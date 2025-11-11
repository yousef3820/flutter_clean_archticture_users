import 'package:flutter/material.dart';

class LandingWidget extends StatelessWidget {
  const LandingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 350,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        color: Colors.blue,
      ),
      child: Center(
        child: const Text(
          "Clean Archticture",
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
    );
  }
}
