import 'package:flutter/material.dart';
import 'package:contador_2_0/home.dart';
import 'package:provider/provider.dart';
import 'package:contador_2_0/providers/operations_provider.dart';

void main() => runApp(
  ChangeNotifierProvider(
    create: (_) => OperationsProvider(),
    child: const MyApp(),
  )
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Contador 2.0',
      home: Home(),
    );
  }
}
