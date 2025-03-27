import 'package:b3_dev/theme.dart';
import 'package:b3_dev/views/layout.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Layout(
      title: 'Home',
      child: const Center(
        child: Text(
          'Bienvenue sur l\'application Flutter MVC !',
          style: TextStyle(color: primaryColor, fontSize: 18),
        ),
      ),
    );
  }
}
