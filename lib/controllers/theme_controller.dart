import 'package:flutter/material.dart';

// On définit un Controller pour gerer le thème pour des raisons de scalabilité. Par exemple si plus tard on veut aussi gérer le thème via des paramètres de l'app.
// Gère l'état du thème (clair/sombre) et notifie l'UI lorsqu'il change
class ThemeController extends ChangeNotifier {
  // Variable privée indiquant si le mode sombre est actif
  bool _isDarkMode = false;

  // Getter public pour accéder à l'état actuel du thème
  bool get isDarkMode => _isDarkMode;

  // Getter pour obtenir le ThemeMode attendu par MaterialApp
  ThemeMode get currentTheme =>
      _isDarkMode ? ThemeMode.dark : ThemeMode.light;

  // Méthode pour basculer entre le mode clair et sombre
  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners(); // Notifie tous les widgets écoutant ce controller (un seul pour l'instant mais ça pourrait changer si l'app évolue)
  }
}