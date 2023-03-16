import 'package:flutter_api_workshop/features/books/data/book.dart';
import 'package:flutter_api_workshop/features/books/data/book_response.dart';
import 'package:flutter_api_workshop/features/books/data/books_repository.dart';

class LocalJsonBooksRepository extends BooksRepository {
  final Map<String, dynamic> _json;

  LocalJsonBooksRepository(this._json);

  @override
  Future<List<Book>> getBooks({String query = ''}) async {
    final items = (_json['items']) as List<dynamic>;
    List<BookResponse> response =
        items.map<BookResponse>((item) => BookResponse.fromJson(item)).toList();
    return response.map((book) => Book.fromResponse(book)).toList();
  }

  @override
  Future<Book> getBook(String id) async {
    final items = (_json['items']) as List<dynamic>;
    List<BookResponse> response =
        items.map<BookResponse>((item) => BookResponse.fromJson(item)).toList();
    final bookResponse = response.firstWhere((element) => element.id == id);
    return Book.fromResponse(bookResponse);
  }

  @override
  Future<void> addBookToFaves(Book book) {
    // TODO: implement addBookToFaves
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
