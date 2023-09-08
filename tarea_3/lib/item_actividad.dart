import 'package:flutter/material.dart';

class ItemActividad extends StatelessWidget {
  final String place;
  final int day;
  final String image;

  const ItemActividad(this.place, this.image, this.day, {super.key});
  
  @override
  Widget build(BuildContext context) {
    
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 120,
            width: 120,
            child: Image.asset(image, fit: BoxFit.cover),
          ),
          Text("Day $day", style: const TextStyle(fontSize: 11)),
          Text(place),
        ],
      ),
    );
  }
}
