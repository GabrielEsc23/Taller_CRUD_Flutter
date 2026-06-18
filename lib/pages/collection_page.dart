import 'package:flutter/material.dart';
import '../models/game.dart';
import '../services/mongodb_service.dart';

class CollectionPage extends StatefulWidget {
  const CollectionPage({super.key});

  @override
  State<CollectionPage> createState() =>
      _CollectionPageState();
}

class _CollectionPageState
    extends State<CollectionPage> {

  late Future<List<Game>> gamesFuture;

  @override
  void initState() {
    super.initState();

    gamesFuture =
        MongoDBService.getGames();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Mi Colección"),
      ),

      body: FutureBuilder<List<Game>>(

        future: gamesFuture,

        builder: (context, snapshot) {

          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final games = snapshot.data!;
        
          if (games.isEmpty) {
            return const Center(
              child: Text(
                "No hay juegos guardados",
              ),
            );
          }

          return ListView.builder(
            itemCount: games.length,
            itemBuilder: (context, index) {

              final game = games[index];

              return Card(
              margin: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
  child: ListTile(

    

    onTap: () async {
      await Navigator.pushNamed(
        context,
        '/detail',
        arguments: game,
      );

      setState(() {
        gamesFuture =
            MongoDBService.getGames();
      });
    },

    leading: game.image.isNotEmpty
        ? Image.network(
            game.image,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
            errorBuilder: (
              context,
              error,
              stackTrace,
            ) {
              return const Icon(
                Icons.broken_image,
                size: 40,
              );
            },
          )
        : const Icon(
            Icons.image,
            size: 40,
          ),

    title: Text(game.title),

    subtitle: Text(
      "\$${game.price}",
    ),
    trailing: Row(
  mainAxisSize: MainAxisSize.min,

  
  children: [

    IconButton(
      icon: const Icon(Icons.edit),
      onPressed: () async {

        await Navigator.pushNamed(
          context,
          '/form',
          arguments: game,
        );

        setState(() {
          gamesFuture =
              MongoDBService.getGames();
        });
      },
    ),

    IconButton(
      icon: const Icon(Icons.delete),
      onPressed: () async {

        await MongoDBService.deleteGame(
          game.id!,
        );

        setState(() {
          gamesFuture =
              MongoDBService.getGames();
        });
      },
    ),


   
  ],
),
   
  ),
);
            },
          );
        },
      ),

      floatingActionButton:
          FloatingActionButton(
        onPressed: () async {

          await Navigator.pushNamed(
            context,
            '/form',
          );

          setState(() {
            gamesFuture =
                MongoDBService.getGames();
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

