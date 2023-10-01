import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:contador_2_0/providers/operations_provider.dart';

class Extra extends StatelessWidget {
  const Extra({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[context.watch<OperationsProvider>().getTenth()],
    );
  }
}