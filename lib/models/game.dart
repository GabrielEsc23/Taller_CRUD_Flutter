import 'package:mongo_dart/mongo_dart.dart';

class Game {
  ObjectId? id;
  String title;
  String image;
  double price;
  String description;

  Game({
    this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.description,
  });

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      id: json['_id'],
      title: json['title'] ?? '',
      image: json['image'] ?? '',
      price: double.tryParse(
      json['price'].toString(),
    ) ?? 0.0,
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'image': image,
      'price': price,
      'description': description,
    };
  }
}