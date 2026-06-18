import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Acerca de"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Center(
              child: Icon(
                Icons.sports_esports,
                size: 100,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Game Collection",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "Game Collection es una aplicación móvil desarrollada en Flutter que permite a los usuarios descubrir ofertas de videojuegos, crear una colección personalizada y administrar su biblioteca de juegos de forma sencilla y organizada.",
              style: TextStyle(
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              "Características",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const ListTile(
              leading: Icon(Icons.add_circle_outline),
              title: Text("Crear, editar y eliminar juegos"),
            ),

            const ListTile(
              leading: Icon(Icons.storage),
              title: Text("Almacenamiento en MongoDB Atlas"),
            ),

            const ListTile(
              leading: Icon(Icons.public),
              title: Text("Exploración de ofertas mediante CheapShark API"),
            ),

            const ListTile(
              leading: Icon(Icons.swipe),
              title: Text("Carga dinámica con Infinite Scrolling"),
            ),

            const ListTile(
              leading: Icon(Icons.image),
              title: Text("Visualización de imágenes y detalles"),
            ),

            const SizedBox(height: 25),

            const Text(
              "Tecnologías Utilizadas",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text("• Flutter"),
            const Text("• Dart"),
            const Text("• MongoDB Atlas"),
            const Text("• CheapShark API"),
            const Text("• REST API"),

            const SizedBox(height: 25),

            const Text(
              "Versión",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "Versión 1.0.0",
            ),

            const SizedBox(height: 25),

            const Text(
              "Desarrollado como proyecto académico para demostrar la integración de Flutter con bases de datos en la nube, consumo de APIs externas, navegación entre pantallas y gestión de datos mediante operaciones CRUD.",
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}