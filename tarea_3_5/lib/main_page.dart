import 'package:flutter/material.dart';
import 'food_card.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title:const Center(child: Text('Quick & Easy')),
        ),
        body: ListView(
          children: <Widget>[
              FoodCard(food: 
                Food(
                name: 'Spagetti',
                time: 15,
                difficulty: 'Media',
                price: 'Medio',
                image: 'assets/images/food1.jpg',
                isFavorite: false,
                ingredientes: ['Spagetti', 'Salsa', 'Queso', 'Carne Molida'],
                pasos: ['Hervir agua', 'Poner spagetti', 'Poner salsa', 'Poner queso', 'Poner carne molida']
              )
            ),
            FoodCard(food: 
                Food(
                name: 'Hamburgruesa',
                time: 100,
                difficulty: 'Baja',
                price: 'Alto',
                image: 'assets/images/food2.jpg',
                isFavorite: false,
                ingredientes: ['Pan', 'Carne', 'Queso', 'Lechuga', 'Tomate'],
                pasos: ['Poner pan', 'Poner carne', 'Poner queso', 'Poner lechuga', 'Poner tomate']
              )
            ),
            FoodCard(food: 
                Food(
                name: 'Pizza',
                time: 50,
                difficulty: 'Media',
                price: 'Bajo',
                image: 'assets/images/food3.jpg',
                isFavorite: false,
                ingredientes: ['Masa', 'Salsa', 'Queso', 'Pepperoni'],
                pasos: ['Poner masa', 'Poner salsa', 'Poner queso', 'Poner pepperoni']
              )
            )
          ],
        )
    ));
  }
}