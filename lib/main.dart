import 'package:flutter/material.dart';
import 'package:b3_dev/views/home_page.dart';
import 'package:google_fonts/google_fonts.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App B3 MDS',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 9, 9, 216)),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false, 
      home: const HomePage(),
    );
  }
}
