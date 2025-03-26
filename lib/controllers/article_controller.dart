import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/article.dart';

class ArticleController {
  static Future<List<Article>> fetchArticles() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((json) => Article.fromJson(json)).toList();
    } else {
      throw Exception('Erreur lors du chargement des articles');
    }
  }
}
