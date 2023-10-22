import 'package:desafio_de_4/Providers/dark_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:desafio_de_4/Screens/main_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => DarkThemeProvider(),
      child: const MyApp(),
    )
  );
}