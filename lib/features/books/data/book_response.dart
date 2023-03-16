import 'package:json_annotation/json_annotation.dart';

part 'book_response.g.dart';

@JsonSerializable(createToJson: false)
class BookResponse {
  final String? kind;
  final String? id;
  final String? etag;
  final String? selfLink;
  final VolumeInfoResponse? volumeInfo;

  BookResponse({
    required this.kind,
    required this.id,
    required this.etag,
    required this.selfLink,
    required this.volumeInfo,
  });

  factory BookResponse.fromJson(Map<String, dynamic> json) =>
      _$BookResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class VolumeInfoResponse {
  final String? title;
  final List<String>? authors;
  final String? publisher;
  final String? publishedDate;
  final String? description;
  final int? pageCount;
  final List<String>? categories;
  final double? averageRating;
  final int? ratingsCount;
  final String? maturityRating;
  final ImageLinksResponse? imageLinks;
  final String? language;
  final String? subtitle;

  VolumeInfoResponse({
    required this.title,
    required this.authors,
    required this.publisher,
    required this.publishedDate,
    required this.description,
    required this.pageCount,
    required this.categories,
    required this.averageRating,
    required this.ratingsCount,
    required this.maturityRating,
    required this.imageLinks,
    required this.language,
    required this.subtitle,
  });

  factory VolumeInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$VolumeInfoResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class ImageLinksResponse {
  final String? smallThumbnail;
  final String? thumbnail;
  final String? small;
  final String? medium;
  final String? large;
  final String? extraLarge;

  ImageLinksResponse({
    required this.smallThumbnail,
    required this.thumbnail,
    required this.small,
    required this.medium,
    required this.large,
    required this.extraLarge,
  });

  factory ImageLinksResponse.fromJson(Map<String, dynamic> json) =>
      _$ImageLinksResponseFromJson(json);
}
