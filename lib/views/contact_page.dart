import 'package:b3_dev/theme.dart';
import 'package:b3_dev/views/layout.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  // key fournie par Dart permettant de controler et valider le formulaire
  final _formKey = GlobalKey<FormState>();

  // Chaque controller permet de gérer un input et avoir accès aux données entrées
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  // Méthode pour envoyer le contenu du message par mail
  Future<void> _sendEmail(String name, String email, String message) async {
    final subject = Uri.encodeComponent('Nouveau message de contact');
    final body = Uri.encodeComponent('''
Nom : $name
Email : $email

Message :
$message
''');

    final uri = Uri.parse(
        'mailto:verwaerdeadrien@gmail.com?subject=$subject&body=$body');

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Impossible d\'ouvrir l\'application mail.')),
      );
    }
  }

  void _sendMessage() {
    // On récupère les donnée stockées dans les controllers définis plus haut
    if (_formKey.currentState!.validate()) {
      final name = _nameController.text;
      final email = _emailController.text;
      final message = _messageController.text;

      _sendEmail(name, email, message);

      ScaffoldMessenger.of(context).showSnackBar(
        // Snackbar pour confirmer l'envoi du message
        const SnackBar(
          content: Text('Message bien envoyé par mail !',
              style: TextStyle(color: secondaryColor)),
        ),
      );

      _nameController.clear();
      _emailController.clear();
      _messageController.clear();
    }
  }

  // Les styles pour les inputs du formulaire
  InputDecoration _buildInputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: primaryColor),
      floatingLabelStyle: const TextStyle(color: secondaryColor),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: secondaryColor, width: 2),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      title: 'Contact',
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: _buildInputDecoration('Nom'),
                    style: const TextStyle(color: primaryColor),
                    cursorColor: primaryColor,
                    validator: (value) =>
                        value!.isEmpty ? 'Entrez un nom' : null,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _emailController,
                    decoration: _buildInputDecoration('Email'),
                    style: const TextStyle(color: primaryColor),
                    validator: (value) =>
                        value!.isEmpty ? 'Entrez un email' : null,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _messageController,
                    decoration: _buildInputDecoration('Message'),
                    style: const TextStyle(color: primaryColor),
                    maxLines: 4,
                    validator: (value) =>
                        value!.isEmpty ? 'Entrez un message' : null,
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: _sendMessage,
                      icon: const Icon(Icons.send, color: primaryColor),
                      label: Text(
                        'Envoyer',
                        style: GoogleFonts.gemunuLibre(
                          fontSize: 16,
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: secondaryColor,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
