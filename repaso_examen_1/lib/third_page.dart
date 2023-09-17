import 'package:flutter/material.dart';


class ThirdPage extends StatelessWidget {

  final String monito;

  const ThirdPage({super.key, required this.monito});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Página 3')),
      body: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
        ElevatedButton(onPressed: () {
          Navigator.pop(context, '(●\'◡\'●)');
        }, 
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.white)),
        child: const Text('(●\'◡\'●)',
        style: TextStyle(color: Colors.black)),),
        ElevatedButton(onPressed: () {
          Navigator.pop(context, '(┬┬﹏┬┬)');
        }, 
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.white)),
        child: const Text('(┬┬﹏┬┬)',
        style: TextStyle(color: Colors.black))),
        ElevatedButton(onPressed: () {
          Navigator.pop(context, '＼(ﾟｰﾟ＼)');
        }, 
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.white)),
        child: const Text('＼(ﾟｰﾟ＼)', 
        style: TextStyle(color: Colors.black)),
        ),
      ],
      ),
    );
  }
}