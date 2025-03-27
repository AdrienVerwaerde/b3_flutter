import 'package:b3_dev/theme.dart';
import 'package:b3_dev/views/layout.dart';
import 'package:flutter/material.dart';
import '../controllers/article_controller.dart';
import '../models/article.dart';
import 'article_detail_page.dart';
import 'package:google_fonts/google_fonts.dart';

class ArticlesPage extends StatefulWidget {
  const ArticlesPage({Key? key}) : super(key: key);

  @override
  State<ArticlesPage> createState() => _ArticlesPageState();
}

class _ArticlesPageState extends State<ArticlesPage> {
  late Future<List<Article>> _articlesFuture;

// On définit la première page à 0 et le nombre d'articles à 10 max, on utilise int car les valeurs sont des nombres
  int _currentPage = 0;
  final int _articlesPerPage = 10;

  @override
  void initState() {
    super.initState();
    // Appel du controller adéquat
    _articlesFuture = ArticleController.fetchArticles();
  }

  // Calcul classique de pagination où on compare le nombre d'articles total au nombre d'articles par page pour déterminer le nombre de pages
  List<Article> _getPaginatedArticles(List<Article> allArticles) {
    final start = _currentPage * _articlesPerPage;
    final end = (_currentPage + 1) * _articlesPerPage;
    return allArticles.sublist(
      start,
      end > allArticles.length ? allArticles.length : end,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      title: 'Articles',
      child: Center(
        child: FutureBuilder<List<Article>>(
          future: _articlesFuture,
          builder: (context, snapshot) {
            // Loader le temps de charger les articles
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator(color: secondaryColor);
            } else if (snapshot.hasError) {
              return Text('Erreur : ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Text('Aucun article trouvé.');
            } else {
              // On recupere la liste des articles et on divise le nombre affiché par 10 pour chaque page
              final allArticles = snapshot.data!;
              final totalPages = (allArticles.length / _articlesPerPage).ceil();
              final paginatedArticles = _getPaginatedArticles(allArticles);

              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: paginatedArticles.length,
                      itemBuilder: (context, index) {
                        final article = paginatedArticles[index];
                        return ListTile(
                          title: Text(
                            article.title,
                            style: const TextStyle(color: primaryColor),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    ArticleDetailPage(article: article),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: secondaryColor),
                          onPressed: _currentPage > 0
                              ? () => setState(() => _currentPage--)
                              : null,
                          child: Text('PRÉCÉDENT',
                              style: GoogleFonts.gemunuLibre(
                          fontSize: 16,
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                        ),
                        const SizedBox(width: 16),
                        Text('Page ${_currentPage + 1} / $totalPages', style: const TextStyle(color: primaryColor),),
                        const SizedBox(width: 16),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: secondaryColor),
                          onPressed: (_currentPage + 1) < totalPages
                              ? () => setState(() => _currentPage++)
                              : null,
                          child: const Text('SUIVANT',
                              style: TextStyle(color: primaryColor)),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
