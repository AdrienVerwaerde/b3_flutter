import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/article.dart';


// Le controller sert de "chef d'orchestre" pour gérer la logique des Articles et les récupérer/afficher correctement.
// Il récupère la liste des articles en les téléchargeant depuis l'API.
// On peut ensuite afficher tous les articles ou un article en particulier.
class ArticleController {
  // L'API utilisée est celle de [https://jsonplaceholder.typicode.com/posts] et renvoie une liste d'objets [Article]s.
  // Si l'appel API  échoue, une exception est levée.
  static Future<List<Article>> fetchArticles() async {
    // final permet de recevoir la valeur une seule fois sans être réassignée
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    //  Si l'appel est bon, on récupère les données et on boucle dessus pour les afficher en tant qu'objet Article en accord avec le Model
    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((json) => Article.fromJson(json)).toList(); // fromJson est une
    } else {
      throw Exception('Erreur lors du chargement des articles');
    }
  }

  // Récupère un article en fonction de son identifiant.
  // Si l'appel API  échoue, une exception est levée.
  static Future<Article> fetchArticleById(int id) async {
    // final permet de recevoir la valeur une seule fois sans être réassignée
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/$id')); // on ajoute /$id pour avoir un article en particulier

    //  Si l'appel est bon, on récupère les données d'un article et on boucle dessus pour les afficher en tant qu'objet Article en accord avec le Model
    if (response.statusCode == 200) {
      return
      Article.fromJson(json.decode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Erreur lors du chargement des articles');
    }
  }
}
