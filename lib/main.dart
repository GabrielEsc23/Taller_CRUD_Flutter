import 'package:flutter/material.dart';
import 'services/mongodb_service.dart';
import 'pages/home_page.dart';
import 'pages/collection_page.dart';
import 'pages/api_detail.dart';
import 'pages/form_page.dart';
import 'pages/detail_page.dart';
import 'pages/api_explorer_page.dart';
import 'pages/about_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await MongoDBService.connect();
    print("MongoDB conectado");
  } catch (e) {
    print("Error MongoDB: $e");
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Game Collection',

      initialRoute: '/',

      routes: {
        '/': (context) => const HomePage(),
        '/collection': (context) => const CollectionPage(),
        '/form': (context) => const FormPage(),
        '/detail': (context) => const DetailPage(),
        '/api': (context) => const ApiExplorerPage(),
        '/about': (context) => const AboutPage(),
        '/apiDetail': (context) => const ApiDetailPage(),
      },
    );
  }
}