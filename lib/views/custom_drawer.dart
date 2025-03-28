import 'package:b3_dev/views/theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:b3_dev/theme.dart';
import 'package:b3_dev/views/about_page.dart';
import 'package:b3_dev/views/contact_page.dart';
import 'package:b3_dev/views/articles_page.dart';
import 'package:b3_dev/views/home_page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Widget fourni par Flutter
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.zero,
          bottomRight: Radius.circular(16),
        ),
      ),
      child: ListView(
        // La liste des éléments qu'on met dans le Drawer
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 75,
            child: DrawerHeader(
              // Le header du Drawer
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 255, 166, 228),
                image: DecorationImage(
                  image: AssetImage('images/drawerheader.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Menu',
                  style: GoogleFonts.gemunuLibre(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),

          // Elements du Drawer. _buildDrawerItem est une fonction qui construit un item du Drawer
          _buildDrawerItem(
            context, // récupère le contexte actuel de l'app
            icon: Icons.home, // l'icone
            label: 'Accueil', // le nom de l'objet
            destination: const HomePage(), // la page où on sera envoyé si on clique
          ),
          _buildDrawerItem(
            context,
            icon: Icons.info,
            label: 'À Propos',
            destination: const AboutPage(),
          ),
          _buildDrawerItem(
            context,
            icon: Icons.message,
            label: 'Contact',
            destination: const ContactPage(),
          ),
          const Divider(color: Color.fromARGB(45, 100, 100, 100)),
          _buildDrawerItem(
            context,
            icon: Icons.article,
            label: 'Articles',
            destination: const ArticlesPage(),
          ),
          const ThemeSwitcher(),
        ],
      ),
    );
  }

  // Construit un objet ListTile pour le Drawer qui redirige vers la destination associée lorsqu'on clique
  // L'item a une icone, un texte et une destination
  Widget _buildDrawerItem(BuildContext context,
      // Ensemble des paramètres que prend la fonction
      {required IconData icon,
      required String label,
      required Widget destination}) {
    // L'élément du Drawer
    return ListTile(
      leading: Icon(icon, color: secondaryColor),
      title: Text(label, style: const TextStyle(color: primaryColor)),
      onTap: () { // Option qui permet d'effectuer une action lors du clic
        Navigator.pop(context); // ferme le Drawer quand on clique un lien ou hors du Drawer
        Navigator.push(
          // Redirige vers la destination associée
          context,
          MaterialPageRoute(builder: (_) => destination),
        );
      },
    );
  }
}
