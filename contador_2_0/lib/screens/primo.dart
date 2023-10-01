import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:contador_2_0/providers/operations_provider.dart';

class Primo extends StatelessWidget {
  const Primo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        context.watch<OperationsProvider>().isPrime() ? 'Es primo' : 'No es primo',
        style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          color: context.watch<OperationsProvider>().isPrime() ? Colors.green : Colors.red,
        ),
      ),
    );
  }
}