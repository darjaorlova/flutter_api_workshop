import 'package:dio/dio.dart';
import 'package:flutter_api_workshop/features/books/data/book_response.dart';

class BooksApiClient {
  final Dio _dio;

  BooksApiClient(this._dio);

  Future<BookResponse> getBook(String id) async {
    final response = await _dio.get('volumes/$id');
    return BookResponse.fromJson(response.data);
  }

  Future<List<BookResponse>> getBooks({String query = ''}) async {
    final response = await _dio.get('volumes?q=$query&maxResults=40');
    final items = (response.data['items']) as List<dynamic>;
    return items
        .map<BookResponse>((item) => BookResponse.fromJson(item))
        .toList();
  }
}
