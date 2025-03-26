import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('À Propos')),
      body: 
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'COUCOU',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 5),
            Image.asset('images/about.png'),
          ],
        ),
      ),
    );
  }
}