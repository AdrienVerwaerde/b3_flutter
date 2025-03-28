import 'package:b3_dev/controllers/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:b3_dev/views/home_page.dart';
import 'package:provider/provider.dart';

// Point d'entrée de l'app
// Cette fonction lance l'app. 
// Dans notre cas, elle crée un [ChangeNotifierProvider] pour rendre le [ThemeController] disponible à l'ensemble de l'app.
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
  // Fonction qui construit l'arbre des widgets de l'app.
  // Elle utilise le [ThemeController] pour définir le thème de l'app en fonction de l'état du thème.
  Widget build(BuildContext context) {
    // On appelle le controller du theme pour envelopper l'app
    final themeController = Provider.of<ThemeController>(context);

    return MaterialApp( // Widget qui configure l'application pour qu'elle puisse utiliser les composants Material Design
      title: 'App B3 MDS',
      // Themes existants générés par Material Design
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      // Récupère le theme actuel
      themeMode: themeController.currentTheme,
      debugShowCheckedModeBanner: false, // bandeau de debug (désactivé ici)
      home: const HomePage(), // la page d'accueil de l'app
    );
  }
}
