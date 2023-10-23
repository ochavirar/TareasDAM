import 'dart:convert';

import 'package:desafio_de_4/Screens/main_screen.dart';
import 'package:desafio_de_4/user_template.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:desafio_de_4/Providers/dark_theme_provider.dart';
import 'package:desafio_de_4/styles.dart';


class NetworkingTransformer extends StatefulWidget {
  const NetworkingTransformer({super.key});

  @override
  State<NetworkingTransformer> createState() => _NetworkingTransformerState();
}

class _NetworkingTransformerState extends State<NetworkingTransformer> {
  DarkThemeProvider themeProvider = DarkThemeProvider(); 
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        return themeProvider;
      },
      child: Consumer<DarkThemeProvider>(
        builder: (BuildContext context, value, child) {
          return MaterialApp(
            title: 'QUIZ APP',
            theme: Styles.themeData(themeProvider.darkTheme, context),
            home: const UsersSummary(),
          );
        }
      ),
    );
  }
}

Future<User> getUsers () async {
  final Response response = await get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
  if (response.statusCode == 200) {
    return User.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to load user');
  }
}

class UsersSummary extends StatelessWidget {
  const UsersSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Desafio de 4'),
      ),
      body: const Center(child: Text("Bienvenido a la app de ejemplo de flutter")),
      drawer: const DrawerContainer(),
    );
  }
}
