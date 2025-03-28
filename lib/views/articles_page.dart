import 'package:b3_dev/theme.dart';
import 'package:b3_dev/views/layout.dart';
import 'package:flutter/material.dart';
import '../controllers/article_controller.dart';
import '../models/article.dart';
import 'article_detail_page.dart';
import 'package:google_fonts/google_fonts.dart';

class ArticlesPage extends StatefulWidget { // Widget avec état car la page doit se mettre à jour lors du changement de page (pagination)
  const ArticlesPage({super.key});

  @override
  State<ArticlesPage> createState() => _ArticlesPageState();
}

class _ArticlesPageState extends State<ArticlesPage> {
  late Future<List<Article>> _articlesFuture; // Fonction qui contiendra la liste des articles chargée de manière asynchrone. On utilise "late" car elle est initialisee plus tard

  // Pour paginer les articles, on définit l'indice de la page actuelle (commence à 0)
  int _currentPage = 0;
  // Puis le nombre d'articles affichés par page
  final int _articlesPerPage = 10;

  @override
  void initState() {
    super.initState();
    // On lance la récupération des articles une seule fois à l'initialisation pour éviter que la requète se fasse en boucle
    _articlesFuture = ArticleController.fetchArticles();
  }

  /// Fonction qui extrait uniquement les articles correspondant à la page en cours
  List<Article> _getPaginatedArticles(List<Article> allArticles) {
    // Calcul classique de la pagination : on associe la page actuelle au nombre d'articles par page pour établir le total de pages
    final start = _currentPage * _articlesPerPage;
    final end = (_currentPage + 1) * _articlesPerPage; // On ajoute +1 car on ne peut pas être en page 0
    return allArticles.sublist( // Utilise sublist pour découper la liste d'articles entre [start, end)
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
            // Affiche un loader pendant que les données sont récupérées
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator(color: secondaryColor);
            }
            // Affiche un message d'erreur si l'appel API a échoué
            else if (snapshot.hasError) {
              return Text('Erreur : ${snapshot.error}');
            }
            // Affiche un message si la liste d'articles est vide
            else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Text('Aucun article trouvé.');
            }
            // Si les articles sont bien récupérés on les affiche
            else {
              final allArticles = snapshot.data!;
              final totalPages = (allArticles.length / _articlesPerPage).ceil();
              final paginatedArticles = _getPaginatedArticles(allArticles);

              return Column(
                children: [
                  // Liste scrollable des articles visibles sur la page actuelle
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
                          // Lorsqu'on clique sur un article, on ouvre la page de détails -> article_detail_page
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ArticleDetailPage(article: article),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),

                  // Pagination : boutons précédent / suivant + numéro de page
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: secondaryColor,
                          ),
                          onPressed: _currentPage > 0
                              ? () => setState(() => _currentPage--)
                              : null, // On désactive le bouton Précedent si on est sur la première page
                          child: Text(
                            'PRÉCÉDENT',
                            style: GoogleFonts.gemunuLibre(
                              fontSize: 16,
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        const SizedBox(width: 16),

                        // Affichage du numéro de page
                        Text(
                          'Page ${_currentPage + 1} / $totalPages',
                          style: const TextStyle(color: primaryColor),
                        ),

                        const SizedBox(width: 16),

                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: secondaryColor,
                          ),
                          onPressed: (_currentPage + 1) < totalPages
                              ? () => setState(() => _currentPage++)
                              : null,  // On désactive le bouton Suivant si on est sur la première page
                          child: Text(
                            'SUIVANT',
                            style: GoogleFonts.gemunuLibre(
                              fontSize: 16,
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
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
