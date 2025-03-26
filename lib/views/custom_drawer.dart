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
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.zero,
          bottomRight: Radius.circular(16),
        ),
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 75,
            child: DrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 255, 166, 228),
                image: DecorationImage(
                  image: AssetImage('images/drawerheader.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
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
          _buildDrawerItem(
            context,
            icon: Icons.home,
            label: 'Accueil',
            destination: const HomePage(),
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
        ],
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context,
      {required IconData icon,
      required String label,
      required Widget destination}) {
    return ListTile(
      leading: Icon(icon, color: secondaryColor),
      title: Text(label, style: const TextStyle(color: primaryColor)),
      onTap: () {
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => destination),
        );
      },
    );
  }
}
