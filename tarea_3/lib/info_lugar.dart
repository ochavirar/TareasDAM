import 'package:flutter/material.dart';

class InfoLugar extends StatelessWidget {
  const InfoLugar({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      // espacio alrededor del container/card
      margin: const EdgeInsets.all(12),
      child: Container(
        // espacio alrededor pero hacia dentro del container
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Titulo con icono y estrellas
            ListTile(
              leading: const Icon(Icons.surfing, size: 48, color: Colors.indigo),
              title: textTop("Balis beach"),
              subtitle: const Wrap(
                children: [
                  Row(
                    children: <Widget>[
                      Icon(Icons.star, color: Colors.yellow),
                      Icon(Icons.star, color: Colors.yellow),
                      Icon(Icons.star, color: Colors.yellow),
                      Icon(Icons.star, color: Colors.yellow),
                      Text("4.1")
                    ],
                  ), 
                  ],
              ),
            ),
            // Datos del hotel
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    textTitleTable("Duration"),
                    textCellTable("7 days"),
                  ],
                ),
                Column(
                  children: [
                    textTitleTable("Participants"),
                    textCellTable("10 people")
                  ],
                ),
                Column(
                  children: [
                    textTitleTable("Hotel stay"),
                    textCellTable("5-star hotel")
                  ],
                ),
              ],
            ),
            const Divider(),
            // Precio
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textTotalPrice("Trip price"),
                const Text("\$1225.00/Adult"),
              ],
            )
          ],
        ),
      ),
    );
  }

  // Metodos que retornan un Text pero estilizado
  Widget textTop(String text) => Text(
        text,
        style: MyTextStyles().topTitle,
      );
  Widget textTitleTable(String text) => Text(
        text,
        style: MyTextStyles().catagoryTable,
      );
  Widget textCellTable(String text) => Text(
        text,
        style: MyTextStyles().cellTable,
      );
  Widget textTotalPrice(String text) => Text(
        text,
        style: MyTextStyles().totalPrice,
      );
}

class MyTextStyles {
  final TextStyle topTitle = const TextStyle(
    fontSize: 21,
    fontWeight: FontWeight.w900,
  );
  final TextStyle catagoryTable = const TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w300,
  );
  final TextStyle cellTable = const TextStyle(fontSize: 14);
  final TextStyle totalPrice = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );
}
