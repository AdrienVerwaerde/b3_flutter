import 'package:b3_dev/theme.dart';
import 'package:b3_dev/views/layout.dart';
import 'package:flutter/material.dart';


// Homepage simple qui affiche juste un message et le Layout global du site (appbar et drawer)
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Layout(
      title: 'Home',
      child: Center(
        child: Text(
          'Bienvenue sur l\'application Flutter MVC !',
          style: TextStyle(color: primaryColor, fontSize: 18),
        ),
      ),
    );
  }
}
