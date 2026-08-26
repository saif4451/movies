import 'package:dio/dio.dart';
import 'package:movies_app/core/utils/Model/movie_model/Movies.dart';

class ApiService {
  final Dio _dio = Dio();
  final String _baseUrl = 'https://movies-api.accel.li/api/v2/list_movies.json';

  Future<List<Movies>> getMovies({String? genre}) async {
    try {
      final response = await _dio.get(
        _baseUrl,
        queryParameters: {
          if (genre != null) 'genre': genre,
        },
      );

      if (response.statusCode == 200) {
        List results = response.data['data']['movies'] ?? [];
        return results.map((e) => Movies.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load movies');
      }
    } on DioException catch (e) {
      throw Exception('Dio error: ${e.message}');
    }
  }
  Future<List<String>> getGenres() async {
    try {
      final response = await _dio.get('https://movies-api.accel.li/api/v2/list_movies.json');

      if (response.statusCode == 200) {
        List results = response.data['data']['genres'] ?? [];
        return results.map((e) => e.toString()).toList();
      } else {
        throw Exception('Failed to load genres');
      }
    } on DioException catch (e) {
      throw Exception('Dio error: ${e.message}');
    }
  }
}
