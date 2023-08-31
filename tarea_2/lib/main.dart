import 'package:flutter/material.dart';

void main() => runApp(const ItesoApp());

class ItesoApp extends StatelessWidget {
  const ItesoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ITESO APP',
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("ITESO APP")),
        ),
        body: const Column(
          children: [
            ItesoImage(),
            ItesoData(),
            ItesoContact(),
            ItesoBio()
          ],
        ),
      ),
    );
  }
}

class ItesoBio extends StatelessWidget {
  const ItesoBio({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 35, left: 25, right: 25),
      child: Text('''El ITESO, Universidad Jesuita de Guadalajara (Instituto Tecnológico y de Estudios Superiores de Occidente) es una universidad privada ubicada en la Zona Metropolitana de Guadalajara, Jalisco, México, fundada en el año 1957.
    
    La institución forma parte del Sistema Universitario Jesuita (SUJ) que integra a ocho universidades en México. La universidad es nombrada como la Universidad Jesuita de Guadalajara.''', 
      textAlign: TextAlign.justify),
    );
  }
}

class ItesoContact extends StatefulWidget {
  const ItesoContact({super.key});

  @override
  State<ItesoContact> createState() => _ItesoContactState();
}

class _ItesoContactState extends State<ItesoContact> {
  
  bool _mailBlack = true;
  bool _phoneBlack = true;
  bool _routeBlack = true;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              IconButton(
                icon: Icon(Icons.mail,
                color: _mailBlack?Colors.black:Colors.indigo),
                onPressed: () {
                  setState(() {
                    _mailBlack = !_mailBlack;
                  });
                  SnackBar snackBarMail = const SnackBar(content: Text("Puedes contactarlos en iteso@iteso.mx"));
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(snackBarMail);
                },
              ),
              const Text("Correo"),	
            ],
          ),
          Column(
            children: [
              IconButton(
                icon: Icon(Icons.phone,
                color: _phoneBlack?Colors.black:Colors.indigo),
                onPressed: () {
                  setState(() {
                    _phoneBlack = !_phoneBlack;
                  });
                  SnackBar snackBarPhone = const SnackBar(content: Text("Puedes llamarlos al número 33 3669 3434"));
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(snackBarPhone);
                },
              ),
              const Text("Llamada"),	
            ],
          ),
          Column(
            children: [
              IconButton(
                icon: Icon(Icons.directions,
                color: _routeBlack?Colors.black:Colors.indigo),
                onPressed: () {
                  setState(() {
                    _routeBlack = !_routeBlack;
                  });
                  SnackBar snackBarDirections = const SnackBar(content: Text("Puedes buscarlos en Google Maps"));
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(snackBarDirections);
                },
              ),
              const Text("Ruta"),	
            ],
          )
        ],
      ),
    );
  }
}

class ItesoImage extends StatelessWidget {
  const ItesoImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.network("https://keystoneacademic-res.cloudinary.com/image/upload/element/12/121980_121891__MG_2277.jpg");
  }
}

class ItesoData extends StatefulWidget {
  const ItesoData({super.key});

  @override
  State<ItesoData> createState() => _ItesoDataState();
}

class _ItesoDataState extends State<ItesoData> {
  int likesCount = 0;
  bool _isBlack = true;
  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: const Text("ITESO, Universidad Jesuita de Guadalajara", style: TextStyle(fontWeight: FontWeight.bold),),
        subtitle: const Text("San Pedro Tlaquepaque, Jalisco, México"),
        trailing: Row( 
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(
                  Icons.thumb_up, 
                  color:_isBlack?Colors.black:Colors.indigoAccent
                ),
                onPressed: () {
                  setState(() {
                    likesCount++;
                    _isBlack = !_isBlack;
                  });
                },
              ),
              Text('$likesCount'),
            ],
          ),
      );
  }
}