import 'package:flutter_api_workshop/features/books/data/book.dart';

abstract class BooksRepository {
  Future<Book> getBook(String id);
  Future<List<Book>> getBooks({String query = ''});
  Future<void> addBookToFaves(Book book);
  Future<void> removeBookFromFaves(String bookId);
  Future<List<Book>> getFaveBooks();
}
