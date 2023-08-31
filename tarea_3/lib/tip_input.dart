import 'package:flutter/material.dart';

class CostInput extends StatefulWidget {
  const CostInput({super.key});

  @override
  State<CostInput> createState() => _CostInputState();
}

class _CostInputState extends State<CostInput> {
  
  final _costController = TextEditingController();

  TextEditingController get costController => _costController;

  @override
  void dispose() {
    _costController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 20),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(Icons.room_service, color: Colors.green,),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: SizedBox(
                width: 250,
                child: TextField(
                decoration: const InputDecoration(
                  labelText: 'Cost of Service',
                  border: OutlineInputBorder(),
                ),
                keyboardType: const TextInputType.numberWithOptions(decimal: false),
                controller: _costController,
                )
              ),
            ),
            const Spacer()
          ],
        ),
    );
  }
}

class TipInput extends StatefulWidget {
  const TipInput({super.key});

  @override
  State<TipInput> createState() => _TipInputState();
}

class _TipInputState extends State<TipInput> {
  double _selectedValue = 0.15; // Initialize with a default value

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Padding(
          padding:  EdgeInsets.only(top: 35, left: 20),
          child: Row(
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
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 40),
          child: Column(
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
                title: const Text('Okay ()'),
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
        ),
      ],
    );
  }
}

class TipRounder extends StatefulWidget {
  const TipRounder({super.key});

  @override
  State<TipRounder> createState() => _TipRounderState();
}

class _TipRounderState extends State<TipRounder> {
  bool _round = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.only(top: 10, left: 20, right: 20), 
          child:  Row(
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
          )
        );
  }
}

class CalculateTip extends StatefulWidget {
  const CalculateTip({super.key});

  @override
  State<CalculateTip> createState() => _CalculateTipState();
}

class _CalculateTipState extends State<CalculateTip> {
  double _tipAmount = 0.0;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 15),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white
              ),
              onPressed: () {
                setState(() {
                  _tipAmount = 0.0;
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
    );
  }
}