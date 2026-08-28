import 'package:dio/dio.dart';
import 'package:movies_app/core/utils/Model/movie_model/movies_source.dart';
import 'api_constant.dart';
import 'end_points.dart';

class ApiService {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
    ),
  );

  static Future<MoviesSource> getMovies({String? genre}) async {
    try {
      final response = await _dio.get(
        EndPoints.listMovies,
        queryParameters: {
          if (genre != null) 'genre': genre,
          'sort_by': 'date_added',
        },
      );

      return MoviesSource.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  static Future<MoviesSource> getGenres() async {
    try {
      final response = await _dio.get(EndPoints.listMovies);

      return MoviesSource.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}