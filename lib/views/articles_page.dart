import 'package:b3_dev/theme.dart';
import 'package:b3_dev/views/layout.dart';
import 'package:flutter/material.dart';
import '../controllers/article_controller.dart';
import '../models/article.dart';
import 'article_detail_page.dart';

class ArticlesPage extends StatefulWidget {
  const ArticlesPage({Key? key}) : super(key: key);

  @override
  State<ArticlesPage> createState() => _ArticlesPageState();
}

class _ArticlesPageState extends State<ArticlesPage> {
  // On défini une variable non nulle qui sera initialisée plus tard. Elle contient la liste des objets Article.
  // Comme ça on s'assure de récupérer les données avant de chercher à les utiliser
  late Future<List<Article>> _articlesFuture;

  @override
  /// Initialize the state of the widget by fetching the list of articles.
  ///
  /// See [ArticleController.fetchArticles] for more information.
  void initState() {
    super.initState();
    _articlesFuture = ArticleController.fetchArticles();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      title: 'Articles',
      child: Center(
        child: FutureBuilder<List<Article>>(
          future: _articlesFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Erreur : ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('Aucun article trouvé.'));
            } else {
              final articles = snapshot.data!;
              return ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  final article = articles[index];
                  return ListTile(
                    title: Text(article.title, style:const TextStyle(color: primaryColor)),
                  
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
              );
            }
          },
        ),
      ),
    );
  }
}
