// Ce modèle défini à quoi doivent ressembler les objets [Article]s.
class Article { // On définit les éléments qui vont composer les objets. Ces éléments sont "final" c'est à dire qu'ils auront toujours cette valeur.
  final int id;
  final String title;
  final String body;

  // Objet Article créé lors de la récupération des données, il nécessite les éléments suivants pour être valable : id, title et body
  Article({required this.id, required this.title, required this.body});
  // Methode de création de l'objet Article.
  factory Article.fromJson(Map<String, dynamic> json) { // Le constructor factory est spécialisé dans la création d'objets, ici il permet de convertir les données depuis le json.

    return Article( // On récupère les valeurs entrées dans les champs id, title et body du json pour les assigner aux objets en tant que String.
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
