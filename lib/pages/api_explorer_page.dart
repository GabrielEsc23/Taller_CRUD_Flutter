import 'package:flutter/material.dart';

import '../services/cheapshark_service.dart';
import '../services/mongodb_service.dart';
import '../models/game.dart';

class ApiExplorerPage extends StatefulWidget {
  const ApiExplorerPage({super.key});

  @override
  State<ApiExplorerPage> createState() =>
      _ApiExplorerPageState();
}

class _ApiExplorerPageState
    extends State<ApiExplorerPage> {

  final ScrollController _controller =
      ScrollController();

  final List<dynamic> games = [];

  int page = 0;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    loadGames();

    _controller.addListener(() {

      if (_controller.position.pixels >=
          _controller.position.maxScrollExtent - 200) {

        loadGames();
      }
    });
  }

  Future loadGames() async {

    print("Cargando página: $page");

    if (isLoading) return;

    isLoading = true;

    

    final newGames =
        await CheapSharkService()
            .getDeals(page);

       print("Juegos recibidos: ${newGames.length}");
    setState(() {
      games.addAll(newGames);
      page++;
    });

    isLoading = false;
  }

  Future saveGame(dynamic apiGame) async {

    final game = Game(
      title: apiGame['title'],
      image: apiGame['thumb'],
      price: double.parse(
        apiGame['salePrice'],
      ),
      description:
          "Importado desde CheapShark",
    );

    await MongoDBService.insertGame(
      game,
    );

    if (mounted) {
      ScaffoldMessenger.of(context)
          .showSnackBar(
        SnackBar(
          content: Text(
            "${apiGame['title']} guardado",
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "CheapShark Explorer",
        ),
      ),

      body: ListView.builder(

        controller: _controller,

        itemCount: games.length,

        itemBuilder: (context, index) {

          final game = games[index];

          return Card(

            margin: const EdgeInsets.all(8),

                child: ListTile(
                  onTap: () {

          Navigator.pushNamed(
            context,
            '/apiDetail',
            arguments: game,
          );
        },
              leading: Image.network(
                game['thumb'],
                width: 60,
                height: 60,
                fit: BoxFit.cover,
                errorBuilder:
                    (_, __, ___) =>
                        const Icon(
                  Icons.image,
                ),
              ),

              title: Text(
                game['title'],
              ),

              subtitle: Text(
                "\$${game['salePrice']}",
              ),

              trailing: IconButton(
                icon: const Icon(
                  Icons.save,
                ),
                onPressed: () {
                  saveGame(game);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}