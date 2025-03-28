import 'package:b3_dev/views/layout.dart';
import 'package:flutter/material.dart';

// Une simple page qui affiche des infos. Elle est appelée dans un bouton du Drawer pour pouvoir être ouverte
class AboutPage extends StatelessWidget {
  const AboutPage({super.key}); // facultatif mais intéressant pour la structure de l'app. On transmet la key du composant au constructor parent, ici StatelessWidget

  @override
  Widget build(BuildContext context) {
    return Layout(
      title: 'À Propos',
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text(
                'COUCOU',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(),
              Image.asset('images/about.png'),
            ],
          ),
        ),
      ),
    );
  }
}
