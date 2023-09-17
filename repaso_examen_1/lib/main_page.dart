import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:repaso_examen_1/second_page.dart';
import 'package:repaso_examen_1/third_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  
  @override
  State<MainPage> createState() => MmainPageState();
}

class MmainPageState extends State<MainPage> {

  String datoPagina2 = "";
  String numeroPagina2 = "";
  String monitoPagina3 = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tarea 1')),
      body: ListView(
        children: [
          Column(
        children: [
          Center(
            child: Text(
              "BIENVENIDOS",
              style: GoogleFonts.pacifico(
                fontSize: 40,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: Image.asset('assets/images/Dash_Dart.png'),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 50.0),
            child: Text(
              "Seleccione la acción a realizar:",
              style: GoogleFonts.sourceSans3(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Open input dialog
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Ingrese los datos'),
                          content: TextField(
                            maxLength: 10,
                            onChanged: (value) {
                              datoPagina2 = value;
                            },
                            decoration: const InputDecoration(hintText: "Ingrese palabra"),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Cancelar', style: TextStyle(color: Colors.black)),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage(numero: numeroPagina2))
                                ).then((value) {
                                   setState(() {
                                    numeroPagina2 = value;
                                  }); 
                                });
                                            
                              },
                              child: const Text('Aceptar', style: TextStyle(color: Colors.black)),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: const Text('Página 2'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  ThirdPage(monito: monitoPagina3,))).then((value) {
                      setState(() {
                        monitoPagina3 = value;
                      });
                    });               
                  },
                  child: const Text('Página 3'),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 100.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('pg. 2 =>$datoPagina2$numeroPagina2'),
                Text("pg. 3 =>$monitoPagina3"),
              ],
            ),
          ),
        ],
      ),
        ],
      ) 
      
    );
  }
}
