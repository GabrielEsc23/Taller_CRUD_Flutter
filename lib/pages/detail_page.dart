import 'package:flutter/material.dart';
import '../models/game.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {

    final game =
        ModalRoute.of(context)!
            .settings
            .arguments as Game;

    return Scaffold(
      appBar: AppBar(
        title: Text(game.title),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            Center(
              child: game.image.isNotEmpty
                  ? Image.network(
                      game.image,
                      height: 250,
                      errorBuilder:
                          (_, __, ___) =>
                              const Icon(
                        Icons.image,
                        size: 100,
                      ),
                    )
                  : const Icon(
                      Icons.image,
                      size: 100,
                    ),
            ),

            const SizedBox(height: 20),

            Text(
              game.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight:
                    FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              "Precio: \$${game.price}",
              style: const TextStyle(
                fontSize: 18,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Descripción",
              style: TextStyle(
                fontSize: 20,
                fontWeight:
                    FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(game.description),
          ],
        ),
      ),
    );
  }
}