import 'package:flutter/material.dart';
import 'package:movies_app/api/dio_manager.dart';
import 'package:movies_app/core/utils/Model/movie_details/Movie.dart';
import 'package:movies_app/core/utils/Model/movie_suggestion/Movies_suggest.dart';
import 'package:movies_app/screens/home/tabs/homeTab/movieDetails/Movie_widget.dart';
import 'package:movies_app/screens/widgets/Main_loading_widget.dart';
import 'package:movies_app/screens/widgets/main_Error_widget.dart';

import '../../../../../core/utils/app_colors.dart';

class MovieResponse extends StatefulWidget {
  int movieId;
   MovieResponse({super.key, required this.movieId});

  @override
  State<MovieResponse> createState() => _MovieResponseState();
}

class _MovieResponseState extends State<MovieResponse> {
  ApiService apiService = ApiService();
  late Future<Movie> movie;
  void initState() {
    super.initState();
    movie = apiService.getMovieDetails(MovieId: widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Movie>(
        future: movie,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return  MainLoadingWidget();
          }
          else if (snapshot.hasError) {
            return MainErrorWidget(errorMessage:  'Error: ${snapshot.error}',
                func2: () => Navigator.pop(context),
                func1: () {
                  apiService.getMovieDetails(MovieId: widget.movieId);
                  setState(() {

                  });
                },);
          } else if (!snapshot.hasData|| snapshot.data == null ) {
            return MainErrorWidget(errorMessage:  'No Details Available',
              func2: () => Navigator.pop(context),
              func1: () {
                apiService.getMovieDetails(MovieId: widget.movieId);
                setState(() {

                });
              },
            );
          }

          else{
            print('${snapshot.data!.largeScreenshotImage1??'no data'}');
            final movieDetails = snapshot.data!;
            return MovieWidget(movie: movieDetails);
        }


        },);
  }
}
