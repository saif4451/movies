import 'package:dio/dio.dart';
import 'package:movies_app/core/utils/Model/movie_model/Movies.dart';

import '../core/utils/Model/movie_details/Movie.dart';
import '../core/utils/Model/movie_suggestion/Movies_suggest.dart';

class ApiService {
  final Dio _dio = Dio();
  final String _baseUrl = 'https://movies-api.accel.li/api/v2/list_movies.json';
  final String movieUrl = 'https://movies-api.accel.li/api/v2/movie_details.json';
  final String movieSuggestion = 'https://movies-api.accel.li/api/v2/movie_suggestions.json';

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
  Future<Movie> getMovieDetails({required int MovieId}) async {
    try {
      final response = await _dio.get(
        movieUrl,
        queryParameters: {
          'movie_id' : MovieId,
          'with_images' : true,
          'with_cast' : true,
        },
      );

      if (response.statusCode == 200) {
        return Movie.fromJson(response.data['data']["movie"]??'');
      } else {
        throw Exception('Failed to load movie');
      }
    } on DioException catch (e) {
      throw Exception('Dio error: ${e.message}');
    }
  }
  Future<List<Movies>> getMovieSuggestion({required int MovieId}) async {
    try {
      final response = await _dio.get(
        movieSuggestion,
        queryParameters: {
          'movie_id' : MovieId,
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
