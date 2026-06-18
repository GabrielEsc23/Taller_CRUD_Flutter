import 'package:flutter/material.dart';
import '../models/game.dart';
import '../services/mongodb_service.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  Game? gameToEdit;
  bool isEdit = false;

  final titleController = TextEditingController();
  final imageController = TextEditingController();
  final priceController = TextEditingController();
  final descriptionController = TextEditingController();

  Future saveGame() async {
try{
  print("Botón guardar presionado");

  if (isEdit) {
    
    final updatedGame = Game(
      id: gameToEdit!.id,
      title: titleController.text,
      image: imageController.text,
      price: double.parse(
        priceController.text,
      ),
      description:
          descriptionController.text,
    );

    await MongoDBService.updateGame(
      updatedGame,
    );
    print("Juego actualizado");

  } else {

    final newGame = Game(
      title: titleController.text,
      image: imageController.text,
      price: double.parse(
        priceController.text,
      ),
      description:
          descriptionController.text,
    );

    await MongoDBService.insertGame(
      newGame,
    );
     print("Juego guardado");
  }

  if (mounted) {
    Navigator.pop(context);
  }
} catch(e){
  print("ERROR $e");
}
  }

@override
void didChangeDependencies() {
  super.didChangeDependencies();

  final args =
      ModalRoute.of(context)?.settings.arguments;

  if (args != null &&
      args is Game &&
      !isEdit) {

    gameToEdit = args;
    isEdit = true;

    titleController.text =
        gameToEdit!.title;

    imageController.text =
        gameToEdit!.image;

    priceController.text =
        gameToEdit!.price.toString();

    descriptionController.text =
        gameToEdit!.description;
  }
}
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text( isEdit
          ? "Editar Juego"
          : "Nuevo Juego"),
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [

            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: "Título",
              ),
            ),

            TextField(
              controller: imageController,
              decoration: const InputDecoration(
                labelText: "URL Imagen",
              ),
            ),

            TextField(
              controller: priceController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Precio",
              ),
            ),

            TextField(
              controller: descriptionController,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: "Descripción",
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: saveGame,
              child: const Text("Guardar"),
            )
          ],
        ),
      ),
    );
  }
}