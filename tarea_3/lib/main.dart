import 'package:flutter/material.dart';
import 'tip_input.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Center(child: Text('Tip Calculator')),
        ),
        body: const Column(
          children: [
            CostInput(),
            TipInput(),
            TipRounder(),
            CalculateTip()
          ],
        )
      ),
    );
  }
}
