import 'package:dio/dio.dart';
import 'package:flutter_api_workshop/features/books/data/book.dart';
import 'package:flutter_api_workshop/features/books/data/book_response.dart';
import 'package:flutter_api_workshop/features/books/data/books_repository.dart';

class NetworkBooksRepository implements BooksRepository {
  final _dio = Dio(
    BaseOptions(baseUrl: 'https://www.googleapis.com/books/v1/'),
  )..interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
    );

  @override
  Future<List<Book>> getBooks({String query = ''}) async {
    if (query.isEmpty) return [];
    final response = await _dio.get('volumes', queryParameters: {'q': query});
    final items = BookItemsResponse.fromJson(response.data).items;
    final books = items.map((book) => Book.fromResponse(book)).toList();
    return books;
  }

  @override
  Future<void> addBookToFaves(Book book) {
    // TODO: implement addBookToFaves
    throw UnimplementedError();
  }

  @override
  Future<Book> getBook(String id) {
    // TODO: implement getBook
    throw UnimplementedError();
  }

  @override
  Future<List<Book>> getFaveBooks() {
    // TODO: implement getFaveBooks
    throw UnimplementedError();
  }

  @override
  Future<void> removeBookFromFaves(String bookId) {
    // TODO: implement removeBookFromFaves
    throw UnimplementedError();
  }
}
