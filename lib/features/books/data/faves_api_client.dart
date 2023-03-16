import 'package:dio/dio.dart';
import 'package:flutter_api_workshop/features/books/data/fave_book_request_body.dart';
import 'package:flutter_api_workshop/features/books/data/fave_book_response.dart';

class FavesApiClient {
  final Dio _dio;

  FavesApiClient(this._dio);

  final List<String> _faveIds = [];

  Future<void> addBookToFaves(FaveBookWrapperRequestBody book) async {
    final response = await _dio.post('objects', data: book.toJson());
    final id = response.data['id'];
    _faveIds.add(id);
  }

  Future<void> removeBookFromFaves(String faveId) async {
    await _dio.delete('objects/$faveId');
    _faveIds.remove(faveId);
  }

  Future<List<FaveBookResponse>> getFaveBooks() async {
    if (_faveIds.isEmpty) {
      return [];
    }

    final ids = _faveIds.skip(1).fold('id=${_faveIds.first}',
        (previousValue, value) => '$previousValue&id=$value');
    final response = await _dio.get('objects?$ids');

    if (response.data == null) {
      return [];
    }

    final items = response.data as List<dynamic>;
    return items
        .map<FaveBookResponse>((item) => FaveBookResponse.fromJson(item))
        .toList();
  }
}
