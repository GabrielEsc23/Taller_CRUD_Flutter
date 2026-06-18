import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Game Collection'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            _menuButton(
              context,
              "Mi Colección",
              Icons.library_books,
              '/collection',
            ),

            const SizedBox(height: 10),

            _menuButton(
              context,
              "Explorar API",
              Icons.explore,
              '/api',
            ),

            const SizedBox(height: 10),

            _menuButton(
              context,
              "Agregar Juego",
              Icons.add,
              '/form',
            ),

            const SizedBox(height: 10),

            _menuButton(
              context,
              "Acerca de",
              Icons.info,
              '/about',
            ),
          ],
        ),
      ),
    );
  }

  Widget _menuButton(
    BuildContext context,
    String text,
    IconData icon,
    String route,
  ) {
    return SizedBox(
      width: double.infinity,
      height: 70,
      child: ElevatedButton.icon(
        icon: Icon(icon),
        label: Text(text),
        onPressed: () {
          Navigator.pushNamed(context, route);
        },
      ),
    );
  }
}