import 'package:flutter/material.dart';

class ApiDetailPage extends StatelessWidget {
  const ApiDetailPage({super.key});

  @override
  Widget build(BuildContext context) {

    final game =
        ModalRoute.of(context)!
            .settings
            .arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: Text(game['title']),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            Center(
              child: Image.network(
                game['thumb'],
                height: 250,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              game['title'],
              style: const TextStyle(
                fontSize: 24,
                fontWeight:
                    FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              "Precio: \$${game['salePrice']}",
              style: const TextStyle(
                fontSize: 18,
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.save),
              label: const Text(
                "Guardar en colección",
              ),
            ),
          ],
        ),
      ),
    );
  }
}