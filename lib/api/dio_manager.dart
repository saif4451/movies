import 'package:dio/dio.dart';
import '../core/utils/Model/movie_model/Movies.dart';
import '../core/utils/Model/movie_model/Movies_source.dart';
import 'api_constant.dart';
import 'end_points.dart';
import '../core/utils/Model/movie_details/Movie.dart';

class ApiService {

  final Dio _dio = Dio();
  final String _baseUrl = 'https://movies-api.accel.li/api/v2/list_movies.json';
  final String movieUrl = 'https://movies-api.accel.li/api/v2/movie_details.json';
  final String movieSuggestion = 'https://movies-api.accel.li/api/v2/movie_suggestions.json';
  static final Dio Static_dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
    ),
  );
  static Future<MoviesSource> getMovies({String? genre}) async {
    try {
      final response = await Static_dio.get(
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
      final response = await Static_dio.get(EndPoints.listMovies);

      return MoviesSource.fromJson(response.data);
    } catch (e) {
      rethrow;
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
          'movie_id': MovieId,
        },
      );

      if (response.statusCode == 200) {
        List results = response.data['data']['movies'] ?? [];
        return results.map((e) => Movies.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load movies');
      }
    } on DioException catch (e) {
      throw Exception('Dio error: ${e.message??e.response?.data["status_message"]}' '');
    }
  }

}
