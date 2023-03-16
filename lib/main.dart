import 'package:flutter/material.dart';
import 'package:flutter_api_workshop/features/books/data/books_repository.dart';
import 'package:flutter_api_workshop/features/books/data/in_memory_books_repository.dart';
import 'package:flutter_api_workshop/features/books/presentation/books_page.dart';

void main() {
  final booksRepository = InMemoryBooksRepository();

  runApp(
    BooksApp(
      booksRepository: booksRepository,
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
