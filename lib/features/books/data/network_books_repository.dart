import 'package:flutter_api_workshop/features/books/data/book.dart';
import 'package:flutter_api_workshop/features/books/data/books_api_client.dart';
import 'package:flutter_api_workshop/features/books/data/books_repository.dart';
import 'package:flutter_api_workshop/features/books/data/fave_book_request_body.dart';
import 'package:flutter_api_workshop/features/books/data/faves_api_client.dart';

class NetworkBooksRepository implements BooksRepository {
  final BooksApiClient _booksApiClient;
  final FavesApiClient _favesApiClient;

  NetworkBooksRepository(this._booksApiClient, this._favesApiClient);

  @override
  Future<Book> getBook(String id) async {
    final response = await _booksApiClient.getBook(id);
    return Book.fromResponse(response);
  }

  @override
  Future<List<Book>> getBooks({String query = ''}) async {
    if (query.isEmpty) {
      return [];
    }
    final response = await _booksApiClient.getBooks(query: query);
    return response.map((r) => Book.fromResponse(r)).toList();
  }

  @override
  Future<void> addBookToFaves(Book book) async {
    final body = FaveBookWrapperRequestBody(
      data: FaveBookRequestBody(
        id: book.id,
        title: book.title,
        subtitle: book.subtitle,
        description: '', //book.description,
        authors: book.authors,
        coverImageUrl: book.coverImageUrl,
        coverThumbnailUrl: book.coverThumbnailUrl,
        pageCount: book.pageCount,
        ratingCount: book.ratingCount,
        averageRating: book.averageRating,
        releaseYear: book.releaseYear,
        faveId: book.faveId,
      ),
    );
    await _favesApiClient.addBookToFaves(body);
  }

  @override
  Future<void> removeBookFromFaves(String bookId) async {
    await _favesApiClient.removeBookFromFaves(bookId);
  }

  @override
  Future<List<Book>> getFaveBooks() async {
    final response = await _favesApiClient.getFaveBooks();
    return response.map((r) => Book.fromFaveResponse(r)).toList();
  }
}
