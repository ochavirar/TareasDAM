import 'package:flutter/material.dart';
import 'details_page.dart';

class Food{
  final String name;
  final int time;
  final String difficulty;
  final String price;
  final String image;
  bool isFavorite;
  final List ingredientes;
  final List pasos;

  Food({
    required this.name, 
    required this.time, 
    required this.difficulty, 
    required this.price,
    required this.image,
    required this.isFavorite,
    required this.ingredientes, 
    required this.pasos
  });
}

class FoodCard extends StatelessWidget {
  
  final Food food;

  const FoodCard({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(foodData: food)));
      },
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            child: Stack(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: Image.asset(food.image, height: 300, width: double.infinity, fit: BoxFit.cover ) 
                ),
                Container( 
                  color: const Color.fromRGBO(0, 0, 0, 0.5),
                  margin: const EdgeInsets.only(top: 200),
                  height: 100,
                  width: double.infinity,
                  
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children:<Widget> [
                      Center(
                        child: Text(
                          food.name,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              const Icon(
                                Icons.timer_outlined,
                                color: Colors.white,
                              ),
                              Text(
                                "${food.time} minutos",
                                style: const TextStyle(
                                  color: Colors.white
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              const Icon(
                                Icons.work,
                                color: Colors.white,
                              ),
                              Text(
                                food.difficulty,
                                style: const TextStyle(
                                  color: Colors.white
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              const Icon(
                                Icons.attach_money,
                                color: Colors.white,
                              ),
                              Text(
                                food.price,
                                style: const TextStyle(
                                  color: Colors.white
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
    );
  }
}