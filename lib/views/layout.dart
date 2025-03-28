import 'package:b3_dev/views/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Layout global du site
// L'idée est d'appeler ce composant sur toutes les pages pour avoir une présentation homogène
class Layout extends StatelessWidget {
  final Widget child; // on accepte les widgets des autres pages en child 
  final String title; // on affichera toujours le titre de la page en String

  const Layout( // on définit les paramètres nécessaires
      {required this.child, // tous les children des autres pages
      super.key,
      required this.title}); // le titre de la page actuelle

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // le Layout est composé d'une Appbar...
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        flexibleSpace: Image.asset(
          'images/drawerheader.jpg',
          fit: BoxFit.cover,
        ),

        // ...du titre de la page actuelle...
        title: Text(
          title,
          style: GoogleFonts.gemunuLibre(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      // ...et du Drawer défini dans "custum_drawer.dart"
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: child,
      ),
    );
  }
}
