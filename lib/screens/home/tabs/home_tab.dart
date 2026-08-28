import 'dart:math';
import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/mob_size.dart';
import 'package:movies_app/screens/widgets/main_error_widget.dart';
import '../../../api/dio_manager.dart';
import '../../../core/utils/Model/movie_model/movies_source.dart';
import '../../widgets/available_now_carousel.dart';
import '../../widgets/genre_section_item.dart';
import '../../widgets/main_loading_widget.dart';
import '../../widgets/show_all_movies_bottomsheet.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  String? selectedGenre;
  late Future<MoviesSource> _genreMoviesFuture;
  late Future<MoviesSource> _carouselMoviesFuture;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() {
    _carouselMoviesFuture = ApiService.getMovies();

    _genreMoviesFuture = ApiService.getGenres().then((moviesSource) {
      final movies = moviesSource.data?.movies ?? [];

      Set<String> allGenres = {};
      for (var movie in movies) {
        if (movie.genres != null) {
          allGenres.addAll(movie.genres!);
        }
      }

      List<String> genresList = allGenres.toList();
      if (genresList.isNotEmpty) {
        genresList.shuffle(Random());
        selectedGenre = genresList.first;
      } else {
        selectedGenre = 'Action';
      }

      return ApiService.getMovies(genre: selectedGenre);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          FutureBuilder<MoviesSource>(
            future: _carouselMoviesFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return SizedBox(
                  height: context.height * 0.69,
                  child:  MainLoadingWidget(),
                );
              } else if (snapshot.hasError || snapshot.data?.status != 'ok') {
                return  SizedBox.shrink();
              }

              final carouselMovies = snapshot.data?.data?.movies ?? [];
              return AvailableNowCarousel(movies: carouselMovies);
            },
          ),

          SizedBox(height: context.height * 0.02),

          FutureBuilder<MoviesSource>(
            future: _genreMoviesFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return  MainLoadingWidget();
              } else if (snapshot.hasError) {
                return MainErrorWidget(
                  errorMessage: snapshot.error.toString(),
                  onPressed: () {
                    setState(() {
                      _loadData();
                    });
                  },
                );
              }

              final moviesSource = snapshot.data;

              if (moviesSource == null || moviesSource.status != 'ok') {
                return MainErrorWidget(
                  errorMessage: moviesSource?.statusMessage ?? 'something went wrong',
                  onPressed: () {
                    setState(() {
                      _loadData();
                    });
                  },
                );
              }

              final genreMoviesList = moviesSource.data?.movies ?? [];

              if (genreMoviesList.isEmpty) {
                return const SizedBox.shrink();
              }

              final limitedGenreMovies = genreMoviesList.take(10).toList();

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (selectedGenre != null)
                    GenreSectionItem(
                      genreName: selectedGenre!,
                      allMovies: limitedGenreMovies,
                      onSeeMoreTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (context) => AllMoviesBottomSheet(
                            genreName: selectedGenre!,
                            allMovies: genreMoviesList,
                          ),
                        );
                      },
                    ),
                ],
              );
            },
          ),

          SizedBox(height: context.height * 0.02),
        ],
      ),
    );
  }
}