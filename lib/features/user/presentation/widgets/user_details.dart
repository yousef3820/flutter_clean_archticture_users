import 'package:flutter/material.dart';

class UserDetails extends StatelessWidget {
  final IconData icon;
  final String details;
  const UserDetails({super.key , required this.icon , required this.details});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(icon , size: 30, color: Colors.blue,),
          const SizedBox(width: 20,),
          Text(details ,style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20
          ),)
        ],
      ),
    );
  }
}