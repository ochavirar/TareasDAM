import 'package:desafio_de_4/Providers/dark_theme_provider.dart';
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
        child: Text('Desafio de 4'),
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
    bool valueTheme = false;
    return Drawer(
        child: ListView(
          children: <Widget>[
            const DrawerHeader(child: Text('Desafio de 4')),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Item 3'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const Divider(),
            SwitchListTile(
              title: const Text('Dark Theme'),
              value: themeChange.darkTheme,
              onChanged: (bool value) {
                valueTheme = value;
                themeChange.darkTheme = value;
              },
            ),
          ],
        )
      );
  }
}