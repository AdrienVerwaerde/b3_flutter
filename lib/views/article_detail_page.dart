import 'package:b3_dev/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/article.dart';

class ArticleDetailPage extends StatelessWidget {
  // Déclaration d'un widget stateless car on ne va pas intéragir avec cet élément
  final Article
      article; // L'article à afficher est reçu en paramètre depuis le Model, il est final car il ne changera jamais
  const ArticleDetailPage({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        flexibleSpace: Image.asset(
          'images/drawerheader.jpg',
          fit: BoxFit.cover,
        ),
        title: Text(
          'Article ${article.id}', // On affiche ici le titre de l'article dynamiquement
          style: GoogleFonts.gemunuLibre(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      // Article
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            // Titre de l'article
            Text(
              article.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),

            // Contenu de l'article
            const SizedBox(height: 16),
            Text(
              article.body,
              style: const TextStyle(
                fontSize: 16,
                color: primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
