import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/article.dart';

class ArticleController {
  /// Récupère la liste des articles en les téléchargeant depuis l'API.
  ///
  /// L'API utilisée est celle de [https://jsonplaceholder.typicode.com/posts]
  /// et renvoie une liste de [Article]s.
  ///
  /// Si l'appel API  échoue, une exception est levée.
  static Future<List<Article>> fetchArticles() async {
    // final permet de recevoir la valeur une seule fois sans être réassignée
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    //  Si l'appel est bon, on récupère les données et on boucle dessus pour les afficher en tant qu'objet Article en accord avec le Model
    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((json) => Article.fromJson(json)).toList();
    } else {
      throw Exception('Erreur lors du chargement des articles');
    }
  }
}
