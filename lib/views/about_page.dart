import 'package:b3_dev/views/layout.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

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
