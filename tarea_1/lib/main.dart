import 'package:flutter/material.dart';

void main(){
  runApp(const McFlutter());
}

class McFlutter extends StatelessWidget {
  const McFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black45,
          title: const Text("Mc Flutter")
          ),
        body: Container(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
          height: 160,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(
              width: 1.5
            ),
          ),
        child: const McFlutterData()
        ),
      ),
    );
  }
}

class McFlutterData extends StatelessWidget {
  const McFlutterData({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.account_circle_sharp,
              size: 50.0
            ),
            Column(
              children: <Widget>[
                Text("Flutter McFlutter",
                style: TextStyle(fontSize: 25),),
                Text("Experienced App Developer")
              ],
            )
          ],
        ),
        Spacer(flex: 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("123 Main Street",
            style: TextStyle(fontSize: 13),),
            Text("(415) 555-0198",
            style: TextStyle(fontSize: 13),)
          ],
        ),
        Spacer(flex: 2),
        IconButtons(),
      ],
    );
  }
}

class IconButtons extends StatefulWidget {
  const IconButtons({super.key});
  @override
  State<IconButtons> createState() => _MyIconButtons();
}

class _MyIconButtons extends State<IconButtons> {
  bool _indigoState_1 = false;
  bool _indigoState_2 = false;
  bool _indigoState_3 = false;
  bool _indigoState_4 = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        IconButton( 
          icon: Icon(Icons.accessibility_new, color: _indigoState_1?Colors.indigo:Colors.black),
          onPressed: () {
            setState(() {
              _indigoState_1 = !_indigoState_1;
            });
            const snackBar = SnackBar(
              content: Text("Enabling profile"), 
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
        ),
        IconButton( 
          icon: Icon(Icons.timer, color: _indigoState_2?Colors.indigo:Colors.black),
          onPressed: () {
            setState(() {
              _indigoState_2 = !_indigoState_2;
            });
            const snackBar = SnackBar(
              content: Text("Enabling schedule"), 
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
        ),
        IconButton( 
          icon: Icon(Icons.phone_android, color: _indigoState_3?Colors.indigo:Colors.black),
          onPressed: () {
            setState(() {
              _indigoState_3 = !_indigoState_3;
            });
            const snackBar = SnackBar(
              content: Text("Enabling phone 1"), 
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
        ),
        IconButton( 
          icon: Icon(Icons.phone_iphone_outlined, color: _indigoState_4?Colors.indigo:Colors.black),
          onPressed: () {
            setState(() {
              _indigoState_4 = !_indigoState_4;
            });
            const snackBar = SnackBar(
              content: Text("Enabling phone 2"), 
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
        ),
      ],
    );
  }
}
