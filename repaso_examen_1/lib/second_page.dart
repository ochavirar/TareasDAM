import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SecondPage extends StatefulWidget {

  final String numero;

  const SecondPage({super.key, required this.numero});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {

  var random = Random();
  int randomNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Página 2')),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Color.fromARGB(255, 98, 169, 227), Color.fromARGB(255, 95, 132, 195)]
              )
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                  Text("Genere numero random",
                  style: GoogleFonts.sourceSans3(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple[900],
                  ),
                  ),
                  Text("$randomNumber",
                  style: GoogleFonts.sourceSans3(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.red
                  )),
                  ElevatedButton(
                    onPressed: () {
                      randomNumber = random.nextInt(100);
                      setState(() {
                      });
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      
                    ),
                    child: const Text('Generar',
                    style: TextStyle(color: Colors.black),),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    ),  
                    onPressed: () {
                      Navigator.pop(context, randomNumber.toString());
                      setState(() {
                      });
                    },
                    child: const Text('Guardar',
                    style: TextStyle(color: Colors.black),),
                  ),
                ],),
              ),
            ),
          )
        ],
      ),
    );
  }
}