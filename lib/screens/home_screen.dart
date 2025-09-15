import 'package:flutter/material.dart';
import 'form_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Accueil'), centerTitle: true),
      body: Center(
        child: ElevatedButton.icon(
          icon: const Icon(Icons.person_add),
          label: const Text('Nouvelle inscription'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FormScreen()),
            );
          },
        ),
      ),
    );
  }
}
