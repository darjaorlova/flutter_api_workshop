import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_api_workshop/features/books/data/books_repository.dart';
import 'package:flutter_api_workshop/features/books/data/local_json_books_repository.dart';
import 'package:flutter_api_workshop/features/books/data/network_books_repository.dart';
import 'package:flutter_api_workshop/features/books/presentation/books_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //final booksRepository = InMemoryBooksRepository();

  final booksJson = json.decode(
    await rootBundle.loadString('assets/data/books.json'),
  );

  final localJsonBooksRepository = LocalJsonBooksRepository(booksJson);

  final networkBooksRepository = NetworkBooksRepository();

  runApp(
    BooksApp(
      booksRepository: networkBooksRepository,
    ),
  );
}

class BooksApp extends StatelessWidget {
  final BooksRepository booksRepository;

  const BooksApp({super.key, required this.booksRepository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter API Demo',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: BooksPage(
        booksRepository: booksRepository,
      ),
    );
  }
}
