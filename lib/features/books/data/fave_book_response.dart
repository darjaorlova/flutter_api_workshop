import 'package:json_annotation/json_annotation.dart';

part 'fave_book_response.g.dart';

@JsonSerializable(createToJson: false)
class FaveBookResponse {
  final String id;
  final FaveBookDataResponse data;

  FaveBookResponse({
    required this.id,
    required this.data,
  });

  factory FaveBookResponse.fromJson(Map<String, dynamic> json) =>
      _$FaveBookResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class FaveBookDataResponse {
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

  FaveBookDataResponse({
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

  factory FaveBookDataResponse.fromJson(Map<String, dynamic> json) =>
      _$FaveBookDataResponseFromJson(json);
}
