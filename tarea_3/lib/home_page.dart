import 'package:flutter/material.dart';
import './info_lugar.dart';
import './item_actividad.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double imageHeight = MediaQuery.of(context).size.height * 0.4;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Reserva tu hotel'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            fit: StackFit.expand,
            children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image(
                      height: imageHeight,
                      width: double.infinity,
                      image: const AssetImage("assets/images/beach-1.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              // para poder poner column o listview en stack hay que encerrarlas en positioned y anclarla a todos lados
              Positioned(
                top: imageHeight - 150,
                bottom: 0,
                left: 0,
                right: 0,
                child: ListView(
                  children: [
                    const InfoLugar(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.grey[200],
                          ),
                          child: const Text("Details"),
                        ),
                        const Text("Walkthrough Flight Detail"),
                      ],
                    ),
                    SizedBox(
                      height: 200,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: const <Widget>[
                          ItemActividad("Vidanta", "assets/images/place-1.png", 1),
                          ItemActividad("Chichen-Itza", "assets/images/place-2.jpg", 2),
                          ItemActividad("Las Vegas", "assets/images/place-3.jpg", 3),
                          ItemActividad("Madrid", "assets/images/place-4.jpg", 4),
                          ItemActividad("Berlin", "assets/images/place-5.jpg", 5),
                          ItemActividad("Praga", "assets/images/place-6.jpg", 6),
                          ItemActividad("Australia", "assets/images/place-7.jpg", 7),
                        ],
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        const snackBar = SnackBar(content: Text("Reservación en proceso"));
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      color: Colors.red,
                      child: const Text("Start booking", style: TextStyle(color: Colors.white),),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
