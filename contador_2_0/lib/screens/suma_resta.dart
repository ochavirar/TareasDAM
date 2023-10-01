import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:contador_2_0/providers/operations_provider.dart';

class SumaResta extends StatefulWidget {
  const SumaResta({super.key});

  @override
  State<SumaResta> createState() => _SumaRestaState();
}

class _SumaRestaState extends State<SumaResta> {
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
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  context.read<OperationsProvider>().add();
                },
                icon: const Icon(Icons.add), 
                label: const Text("Suma")
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  context.read<OperationsProvider>().restart();
                },
                icon: const Icon(Icons.restart_alt), 
                label: const Text("reinicio")
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  context.read<OperationsProvider>().subtract();
                },
                icon: const Icon(Icons.remove), 
                label: const Text("Restar")
              ),
            )
          ],
        )
      ],
    );
  }
}