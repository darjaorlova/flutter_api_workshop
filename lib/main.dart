import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_workshop/features/books/data/books_api_client.dart';
import 'package:flutter_api_workshop/features/books/data/books_repository.dart';
import 'package:flutter_api_workshop/features/books/data/faves_api_client.dart';
import 'package:flutter_api_workshop/features/books/data/network_books_repository.dart';
import 'package:flutter_api_workshop/features/books/presentation/books_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final booksDio = Dio(
    BaseOptions(
      baseUrl: 'https://www.googleapis.com/books/v1/',
    ),
  );
  booksDio.interceptors.add(LogInterceptor(responseBody: true));
  final booksApiClient = BooksApiClient(booksDio);

  final faveDio = Dio(
    BaseOptions(
      baseUrl: 'https://api.restful-api.dev/',
    ),
  );
  faveDio.interceptors.add(LogInterceptor(
    responseBody: true,
    requestBody: true,
  ));
  final favesApiClient = FavesApiClient(faveDio);
  final booksRepository = NetworkBooksRepository(
    booksApiClient,
    favesApiClient,
  );

  // Uncomment to use json file instead of network
/*  final booksJson = json.decode(
    await rootBundle.loadString('assets/data/books.json'),
  );

  final localJsonBooksRepository = LocalJsonBooksRepository(booksJson);*/

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
