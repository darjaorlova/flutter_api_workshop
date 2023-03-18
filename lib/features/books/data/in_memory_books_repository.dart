import 'package:flutter_api_workshop/features/books/data/book.dart';
import 'package:flutter_api_workshop/features/books/data/books_repository.dart';

class InMemoryBooksRepository implements BooksRepository {
  final List<Book> _books = [
    Book(
      id: 'NODES6H1GJoC',
      title: 'Marina',
      subtitle: '',
      description:
          "'Fifteen years on, the remembrance of that day has returned to me. I have seen that boy wandering through the mist of the railway station, and the name of Marina has flared up again like a fresh wound. We all have a secret buried under lock and key in the attic of our soul. This is mine...' In May 1980, 15-year-old Óscar Drai suddenly vanishes from his boarding school in the old quarter of Barcelona. For seven days and nights no one knows his whereabouts... His story begins in the heart of old Barcelona, when he meets Marina and her father German Blau, a portrait painter. Marina takes Óscar to a cemetery to watch a macabre ritual that occurs on the fourth Sunday of each month. At 10 a.m. precisely a coach pulled by black horses appears. From it descends a woman dressed in black, her face shrouded, wearing gloves, holding a single rose. She walks over to a gravestone that bears no name, only the mysterious emblem of a black butterfly with open wings. When Óscar and Marina decide to follow her they begin a journey that will take them to the heights of a forgotten, post-war Barcelona, a world of aristocrats and actresses, inventors and tycoons; and a dark secret that lies waiting in the mysterious labyrinth beneath the city streets. Carlos Ruiz Zafón was born in Barcelona and is the author of seven novels including THE SHADOW OF THE WIND. He is one of the world's most read and best-loved writers. His work has been translated into more than 40 languages and published around the world, garnering numerous international prizes and reaching millions of readers. He divides his time between Barcelona and Los Angeles.",
      authors: 'Carlos Ruiz Zafon',
      coverImageUrl:
          'http://books.google.com/books/content?id=NODES6H1GJoC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api',
      coverThumbnailUrl:
          'http://books.google.com/books/content?id=NODES6H1GJoC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api',
      pageCount: 304,
      ratingCount: 49,
      averageRating: 4,
      releaseYear: '2013',
      faveId: null,
    )
  ];

  @override
  Future<List<Book>> getBooks({String query = ''}) async {
    return _books;
  }

  @override
  Future<void> addBookToFaves(Book book) {
    // TODO: implement addBookToFaves
    throw UnimplementedError();
  }

  @override
  Future<Book> getBook(String id) async {
    return _books.firstWhere((book) => book.id == id);
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
