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
}
