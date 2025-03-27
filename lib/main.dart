import 'package:b3_dev/controllers/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:b3_dev/views/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    // Le plugin permettant de switcher de theme
    ChangeNotifierProvider(
      create: (_) => ThemeController(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // On appelle le controller du theme pour envelopper l'app
    final themeController = Provider.of<ThemeController>(context);

    return MaterialApp(
      title: 'App B3 MDS',
      // Themes existant
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      // Récupère le theme actuel
      themeMode: themeController.currentTheme,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
