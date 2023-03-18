import 'package:flutter_api_workshop/features/books/data/book.dart';
import 'package:flutter_api_workshop/features/books/data/book_response.dart';
import 'package:flutter_api_workshop/features/books/data/books_repository.dart';

class LocalJsonBooksRepository implements BooksRepository {
  final Map<String, dynamic> _json;

  LocalJsonBooksRepository(this._json);

  @override
  Future<List<Book>> getBooks({String query = ''}) async {
    final response = BookItemsResponse.fromJson(_json);
    final books = response.items
        .map(
          (book) => Book.fromResponse(book),
        )
        .toList();
    return books;
  }

  @override
  Future<Book> getBook(String id) async {
    final response = BookItemsResponse.fromJson(_json);
    final books = response.items
        .map(
          (book) => Book.fromResponse(book),
        )
        .toList();
    final book = books.firstWhere((book) => book.id == id);
    return book;
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
