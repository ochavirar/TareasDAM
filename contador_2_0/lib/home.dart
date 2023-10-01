import 'package:flutter/material.dart';
import 'package:contador_2_0/screens/suma_resta.dart';
import 'package:contador_2_0/screens/multiplica.dart';
import 'package:contador_2_0/screens/primo.dart';
import 'package:contador_2_0/screens/extra.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedPage = 0;

  final List<Widget> _pages = [
    const SumaResta(),
    const Multiplica(),
    const Primo(),
    const Extra(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Contador 2.0'),
        ),
        body: _pages[_selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          fixedColor: Colors.white,
          backgroundColor: Theme.of(context).secondaryHeaderColor,
          currentIndex: _selectedPage,
          onTap: (int index) {
            setState(() {
              _selectedPage = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              backgroundColor: Colors.blue,
              icon: Icon(Icons.add),
              label: 'Suma y resta',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.blue,
              icon: Icon(Icons.close),
              label: 'Multiplicación',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.blue,
              icon: Icon(Icons.check),
              label: 'Primo',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.blue,
              icon: Icon(Icons.add_circle_outline),
              label: 'Extra',
            ),
          ],
        ),
      );
  }
}