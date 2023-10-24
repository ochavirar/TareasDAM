import 'package:desafio_de_4/Providers/dark_theme_provider.dart';
import 'package:desafio_de_4/Providers/profile_provider.dart';
import 'package:desafio_de_4/Screens/change_profile_screen.dart';
import 'package:desafio_de_4/Screens/networking_sample.dart';
import 'package:desafio_de_4/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  DarkThemeProvider themeProvider = DarkThemeProvider(); 

  @override
  void initState() {
    super.initState();
    getAppTheme();
  }

  void getAppTheme() async {
    themeProvider.darkTheme = await themeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create: (_) {
        return themeProvider;
      },
      child: Consumer<DarkThemeProvider>(
        builder: (BuildContext context, value, child) {
          return MaterialApp(
            title: 'QUIZ APP',
            theme: Styles.themeData(themeProvider.darkTheme, context),
            home: const MainScreen(),
          );
        }
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Desafio de 4'),
      ),
      body: const Center(
        child: Padding(padding: EdgeInsets.all(40.0), 
        child: Column(
          children: [
            Text("Bienvenido a la app de ejemplo de flutter",
              style: TextStyle(
                fontSize: 20, 
                fontWeight: FontWeight.bold
              ),
            ),
            Divider(),
            Text("Esta app es un ejemplo de como se puede hacer un tema oscuro en flutter, networking, navegación y manejo de estados",
              style: TextStyle(
                fontSize: 15, 
                fontWeight: FontWeight.normal
              ),
            ),
            Divider(),
            Spacer(),
            Divider(),
            Text("Datos actuales del usuario, puedes modificarlos en la opción 'Cambia los datos de tu perfil'",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.normal
            ),),
            Spacer(),
            ProfileDataDisplay(),
            Spacer(),
            Spacer()
          ],
        ))
      ),
      drawer: const DrawerContainer(),
    );
  }
}

class DrawerContainer extends StatelessWidget {


  const DrawerContainer({super.key});
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    
    return Drawer(
        child: ListView(
          children: <Widget>[
            const DrawerHeader(
              child: Center(
                child: Text(
                  'Desafio de 4',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  )
                )
              )
            ),
            ListTile(
              title: const Text('Página principal'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const MainScreen()));
              },
            ),
            ListTile(
              title: const Text('Networking en acción'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const NetworkingTransformer()));
              },
            ),
            ListTile(
              title: const Text('Cambia los datos de tu perfil'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileChanger()));
              },
            ),
            const Divider(),
            SwitchListTile(
              title: const Text('Dark Theme'),
              value: themeChange.darkTheme,
              onChanged: (bool value) {
                themeChange.darkTheme = value;
              },
            ),
          ],
        )
      );
  }
}

class ProfileDataDisplay extends StatelessWidget {
  const ProfileDataDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController(text: context.watch<ProfileProvider>().name.toString());
    TextEditingController roleController = TextEditingController(text: context.watch<ProfileProvider>().role.toString());
    TextEditingController emailController = TextEditingController(text: context.watch<ProfileProvider>().email.toString());
  
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Nombre: ${nameController.text}",
          style: const TextStyle(
            fontSize: 20, 
            fontWeight: FontWeight.bold
          ),
        ),
        const Divider(),
        Text("Rol: ${roleController.text}",
          style: const TextStyle(
            fontSize: 20, 
            fontWeight: FontWeight.bold
          ),
        ),
        const Divider(),
        Text("email: ${emailController.text}",
          style: const TextStyle(
            fontSize: 20, 
            fontWeight: FontWeight.bold
          ),
        ),
      ],
    );
  }
}