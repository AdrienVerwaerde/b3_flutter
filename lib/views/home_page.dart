import 'package:b3_dev/theme.dart';
import 'package:b3_dev/views/about_page.dart';
import 'package:b3_dev/views/contact_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Accueil',
          style: GoogleFonts.gemunuLibre(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      drawer: Drawer(
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
            ListTile(
              leading: const Icon(Icons.home, color: secondaryColor),
              title: const Text('Accueil'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.info, color: secondaryColor),
              title: const Text('À Propos'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.message, color: secondaryColor),
              title: const Text('Contact'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ContactPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text(
          'Bienvenue sur l\'application Flutter MVC !',
          style: TextStyle(color: primaryColor, fontSize: 18),
        ),
      ),
    );
  }
}
