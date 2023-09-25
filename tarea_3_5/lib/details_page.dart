import 'package:flutter/material.dart';
import 'package:tarea_3_5/food_card.dart';

class DetailsPage extends StatefulWidget {
  final Food foodData;

  const DetailsPage({super.key, required this.foodData});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

  @override
  Widget build(BuildContext context) {
    var foodData = widget.foodData;
    var ingredientes = <Widget>[];
    var pasos = <Widget>[];

    for(int i=0; i<widget.foodData.ingredientes.length; i++){
      ingredientes.add(Padding(
        padding: const EdgeInsets.all(4.0),
        child: Text(widget.foodData.ingredientes[i]),
      ));
    }

    for(int i=0; i<widget.foodData.ingredientes.length; i++){
      pasos.add(Padding(
        padding: const EdgeInsets.all(4.0),
        child: Text(widget.foodData.pasos[i]),
      ));
    }

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(),
              Text(foodData.name),
              IconButton(
                icon: const Icon(Icons.star), 
                color: (foodData.isFavorite)?Colors.yellow:Colors.white,
                onPressed: () {
                  setState(() {
                    foodData.isFavorite = !foodData.isFavorite;
                    if (foodData.isFavorite) {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Agregado a favoritos'))
                      );
                    } else {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Eliminado de favoritos'))
                      );
                    }
                  });
                },
              )
            ],
          ),
        )
        
      ),
      body:
        ListView(
          children: <Widget>[
            Image.asset(foodData.image, height: 300, width: double.infinity, fit: BoxFit.cover),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: 
              Center(child: 
                Text(
                  "Ingredientes", 
                  style: TextStyle(fontSize: 25, 
                  color: Colors.orange,
                  fontWeight: FontWeight.bold
                  ),
                )
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: ingredientes
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: 
              Center(child: 
                Text(
                  "Pasos", 
                  style: TextStyle(fontSize: 25, 
                  color: Colors.orange,
                  fontWeight: FontWeight.bold
                  ),
                )
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: pasos
              ),
            ),
          ]
        ),
    );
  }
}