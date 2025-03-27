import 'package:b3_dev/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/article.dart';

class ArticleDetailPage extends StatelessWidget {
  final Article article;

  const ArticleDetailPage({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        flexibleSpace: Image.asset(
          'images/drawerheader.jpg',
          fit: BoxFit.cover,
        ),
        title: Text('Article ${article.id}',
          style: GoogleFonts.gemunuLibre(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(article.title,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color:primaryColor)),
            const SizedBox(height: 16),
            Text(article.body, style: const TextStyle(fontSize: 16, color: primaryColor)),
          ],
        ),
      ),
    );
  }
}
