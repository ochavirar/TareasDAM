import 'package:flutter/material.dart';

class TipCalculator extends StatefulWidget {
  const TipCalculator({super.key});

  @override
  State<TipCalculator> createState() => _TipCalculatorState();
}

class _TipCalculatorState extends State<TipCalculator> {

  var _costController = TextEditingController();
  double _selectedValue = 0.15;
  bool _round = false;
  double _tipAmount = 0.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 20), 
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(Icons.room_service, color: Colors.green,),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: SizedBox(
                width: 250,
                child: TextField(
                  controller: _costController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Cost of Service',
                    border: OutlineInputBorder(),
                  ),
                )
              ),
            ),
            const Spacer()
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 25),
          child: Column(
              children: <Widget>[
            const Row(
              children: [
                Icon(Icons.food_bank, color: Colors.green,),
                Padding(
                  padding:  EdgeInsets.only(left: 20),
                  child: Text(
                    "How good was the service?",
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              ],
            ), Column(
              children: <Widget>[
                RadioListTile(
                  title: const Text('Excellent (20%)'),
                  value: 0.20,
                  groupValue: _selectedValue,
                  onChanged: (value) {
                    setState(() {
                      _selectedValue = 0.20;
                    });
                  },
                ),
                RadioListTile(
                  title: const Text('Good (18%)'),
                  value: 0.18,
                  groupValue: _selectedValue,
                  onChanged: (value) {
                    setState(() {
                      _selectedValue = 0.18;
                    });
                  },
                ),
                RadioListTile(
                  title: const Text('Okay (15%)'),
                  value: 0.15,
                  groupValue: _selectedValue,
                  onChanged: (value) {
                    setState(() {
                      _selectedValue = 0.15;
                    });
                  },
                ),
                // Add more RadioListTile options here...
              ],
            ),
              ],
            ),
        ),
        Row(
            children: [
              const Icon(Icons.money, color: Colors.green,),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "Round up tip?",
                  style: TextStyle(fontSize: 17),
                ),
              ),
              const Spacer(),
              Switch(
                value: _round,
                onChanged: (bool value) {
                  setState(() {
                    _round = value;
                  });
                },
                activeTrackColor: Colors.lightGreenAccent,
                activeColor: Colors.green,
              )
            ],
          ),
        Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white
              ),
              onPressed: () {
                setState(() {
                  if(_costController.text.isNotEmpty){
                    if(_round){
                      _tipAmount = double.parse(((double.parse(_costController.text) * _selectedValue).ceilToDouble()).toStringAsFixed(2));
                    } else {
                      _tipAmount = double.parse(((double.parse(_costController.text) * _selectedValue)).toStringAsFixed(2));
                    }
                  } else {
                    showDialog <String>(
                      context: context, 
                      builder: (BuildContext context) => const AlertDialog(
                        title: Text('Error'),
                        content: Text('Please enter a cost of service.')
                      ),
                    );
                  }
                });
              }, 
              child: const Text('Calculate Tip')
            ),
          ),
        ),
        Row(
          children: [
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 25, top: 15),
              child: Text('Tip amount: \$$_tipAmount'),
            )
          ],
        )
      ],
    )
      ],
      
      )
    );
  }
}