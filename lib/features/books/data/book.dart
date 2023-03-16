import 'package:flutter_api_workshop/features/books/data/book_response.dart';
import 'package:flutter_api_workshop/features/books/data/fave_book_response.dart';

class Book {
  final String id;
  final String title;
  final String subtitle;
  final String description;
  final String authors;
  final String? coverImageUrl;
  final String? coverThumbnailUrl;
  final int pageCount;
  final int ratingCount;
  final int averageRating;
  final String releaseYear;
  final String? faveId;

  Book({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.authors,
    required this.coverImageUrl,
    required this.coverThumbnailUrl,
    required this.pageCount,
    required this.ratingCount,
    required this.averageRating,
    required this.releaseYear,
    required this.faveId,
  });

  factory Book.fromResponse(BookResponse response) {
    final volumeInfo = response.volumeInfo!;
    final imagesLinks = volumeInfo.imageLinks;
    final coverImageUrl = imagesLinks?.large ??
        imagesLinks?.medium ??
        imagesLinks?.thumbnail ??
        imagesLinks?.smallThumbnail ??
        '';
    final coverThumbnailUrl =
        imagesLinks?.thumbnail ?? imagesLinks?.smallThumbnail ?? '';
    final releaseYear = volumeInfo.publishedDate?.substring(0, 4) ?? '?';
    return Book(
      id: response.id ?? '',
      title: volumeInfo.title ?? '',
      subtitle: volumeInfo.subtitle ?? '',
      description: volumeInfo.description ?? '',
      authors: _toAuthorString(volumeInfo.authors),
      coverImageUrl: coverImageUrl,
      coverThumbnailUrl: coverThumbnailUrl,
      pageCount: volumeInfo.pageCount ?? 0,
      ratingCount: volumeInfo.ratingsCount ?? 0,
      averageRating: volumeInfo.averageRating?.toInt() ?? 0,
      releaseYear: releaseYear,
      faveId: null,
    );
  }

  factory Book.fromFaveResponse(FaveBookResponse response) {
    final data = response.data;
    return Book(
      id: data.id,
      title: data.title,
      subtitle: data.subtitle,
      description: data.description,
      authors: data.authors,
      coverImageUrl: data.coverImageUrl,
      coverThumbnailUrl: data.coverThumbnailUrl,
      pageCount: data.pageCount,
      ratingCount: data.ratingCount,
      averageRating: data.averageRating,
      releaseYear: data.releaseYear,
      faveId: response.id,
    );
  }

  Book copyWith({
    String? id,
    String? title,
    String? subtitle,
    String? description,
    String? authors,
    String? coverImageUrl,
    String? coverThumbnailUrl,
    int? pageCount,
    int? ratingCount,
    int? averageRating,
    String? releaseYear,
    String? faveId,
  }) {
    return Book(
      id: id ?? this.id,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      description: description ?? this.description,
      authors: authors ?? this.authors,
      coverImageUrl: coverImageUrl ?? this.coverImageUrl,
      coverThumbnailUrl: coverThumbnailUrl ?? this.coverThumbnailUrl,
      pageCount: pageCount ?? this.pageCount,
      ratingCount: ratingCount ?? this.ratingCount,
      averageRating: averageRating ?? this.averageRating,
      releaseYear: releaseYear ?? this.releaseYear,
      faveId: faveId ?? this.faveId,
    );
  }

  static String _toAuthorString(List<String>? authors) {
    if (authors == null) return '';
    return authors.skip(1).fold(
        authors.first, (previousValue, value) => '$previousValue, $value');
  }
}
