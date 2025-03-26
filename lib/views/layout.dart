import 'package:b3_dev/theme.dart';
import 'package:b3_dev/views/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Layout extends StatelessWidget {

  final Widget child;
  
  const Layout({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Accueil',
          style: GoogleFonts.gemunuLibre(
            fontSize: 24,
            color: primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      drawer: const CustomDrawer(),
      body: Padding(padding: const EdgeInsets.all(16.0),
      child: child,
      ),
    );
  }
}
