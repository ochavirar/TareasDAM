import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:contador_2_0/providers/operations_provider.dart';

class Multiplica extends StatelessWidget {
  const Multiplica({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            context.watch<OperationsProvider>().counter.toString(),
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          )
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton.icon(
            onPressed: () {
              context.read<OperationsProvider>().multiply2();
              mostrarAviso(context, 2);
            },
            icon: const Icon(Icons.close), 
            label: const Text("X2")
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton.icon(
            onPressed: () {
              context.read<OperationsProvider>().multiply3();
              mostrarAviso(context, 3);
            },
            icon: const Icon(Icons.close), 
            label: const Text("X3")
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton.icon(
            onPressed: () {
              context.read<OperationsProvider>().multiply5();
              mostrarAviso(context, 5);
            },
            icon: const Icon(Icons.close), 
            label: const Text("X5")
          ),
        )
      ],
    );
  }

  void mostrarAviso(BuildContext context, int factor){
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Aviso'),
        content: Text('Se ha multiplicado por $factor'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(), 
            child: const Text('Ok')
          )
        ],
      )
    );
  }
}