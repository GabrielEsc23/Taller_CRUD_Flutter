import 'package:mongo_dart/mongo_dart.dart';
import '../models/game.dart';

class MongoDBService {
  static Db? db;

  static Future connect() async {
   db = await Db.create(
  "mongodb+srv://Gabriel:1234@cluster0.xvewknz.mongodb.net/game_collection?retryWrites=true&w=majority"
);

    await db!.open();

    print("MongoDB conectado");
  }

  static DbCollection get collection =>
      db!.collection('games');

  // INSERT
  static Future insertGame(Game game) async {
  print("Intentando guardar: ${game.title}");

  final result = await collection.insertOne(
    game.toJson(),
  );

  print("Guardado: ${result.isSuccess}");
}

  // GET ALL
  static Future<List<Game>> getGames() async {

    final data = await collection.find().toList();

    return data.map((e) => Game.fromJson(e)).toList();
  }

  // DELETE
  static Future deleteGame(ObjectId id) async {

    await collection.deleteOne(
      where.id(id),
    );
  }

  // UPDATE
  static Future updateGame(Game game) async {

    await collection.replaceOne(
      where.id(game.id!),
      game.toJson(),
    );
  }
}