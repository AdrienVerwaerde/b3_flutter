import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:b3_dev/controllers/theme_controller.dart';
import 'package:b3_dev/theme.dart';

class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    // Provider récupère l'état actuel du theme
    final themeController = Provider.of<ThemeController>(context);
    // Si le theme sombre est actif alors isDark=true
    final isDark = themeController.isDarkMode;

    return ListTile(
      leading: Icon(
        Icons.nightlight,
        color: isDark ? secondaryColor : const Color.fromARGB(115, 254, 159, 192),
      ),
      title: Text(
        'Thème Sombre',
        style: TextStyle(color: isDark ? primaryColor : const Color.fromARGB(100, 100, 100, 100)),
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
