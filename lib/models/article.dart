class Article {
  final int id;
  final String title;
  final String body;

  // Objet Article créé lors de la récupération des données, il nécessite les éléments suivants pour être valable : id, title et body
  Article({required this.id, required this.title, required this.body});
  // Methode de création de l'objet Article. Le constructor factory permet de convertir les données depuis le json
  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
