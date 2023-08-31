import 'package:flutter/material.dart';

class CostInput extends StatelessWidget {
  const CostInput({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 15, left: 20),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.room_service),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: SizedBox(
                width: 250,
                child: TextField(
                decoration: InputDecoration(
                  labelText: 'Cost of Service',
                  border: OutlineInputBorder(),
                ),
                )
              ),
            ),
            Spacer()
          ],
        ),
    );
  }
}