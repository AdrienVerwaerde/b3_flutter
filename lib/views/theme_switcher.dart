import 'package:b3_dev/controllers/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:b3_dev/theme.dart';

// Composant visuel ListTile utilisé dans le Drawer qui permet à l'utilisateur d'activer ou désactiver le mode sombre
class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    // Récupère l'instance du ThemeController via Provider
    final themeController = Provider.of<ThemeController>(context);

    // Variable booléenne : true si mode sombre actif
    final isDark = themeController.isDarkMode;

    return ListTile(
      leading: Icon(
        Icons.nightlight,
        color: isDark
            ? secondaryColor
            : const Color.fromARGB(115, 254, 159, 192),
      ),
      title: Text(
        'Thème Sombre',
        style: TextStyle(
          color: isDark
              ? primaryColor
              : const Color.fromARGB(100, 100, 100, 100),
        ),
      ),
      trailing: Switch(
        value: isDark,
        onChanged: (value) => themeController.toggleTheme(),
        activeColor: isDark ? secondaryColor : primaryColor,
      ),
      onTap: () {
        themeController.toggleTheme();
      },
    );
  }
}
