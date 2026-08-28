import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_text_styels.dart';
import 'package:movies_app/core/utils/mob_size.dart';
import 'package:movies_app/screens/widgets/main_error_widget.dart';
import '../../../api/dio_manager.dart';
import '../../../core/utils/Model/movie_model/movies_source.dart';
import '../../widgets/available_now_carousel.dart';
import '../../widgets/genre_section_item.dart';
import '../../widgets/main_loading_widget.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final List<String> availableGenres = ['Action', 'Comedy', 'Drama'];

  static int _currentIndex = 0;

  String? selectedGenre;
  late Future<MoviesSource> _moviesFuture;

  @override
  void initState() {
    super.initState();
    selectedGenre = availableGenres[_currentIndex];
    _currentIndex = (_currentIndex + 1) % availableGenres.length;

    _loadMovies();
  }

  void _loadMovies() {
    _moviesFuture = ApiService.getMovies(genre: selectedGenre);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MoviesSource>(
      future: _moviesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MainLoadingWidget();
        } else if (snapshot.hasError) {
          return MainErrorWidget(
            errorMessage: snapshot.error.toString(),
            onPressed: () {
              setState(() {
                _loadMovies();
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
                _loadMovies();
              });
            },
          );
        }

        final moviesList = moviesSource.data?.movies ?? [];

        if (moviesList.isEmpty) {
          return Center(
            child: Text(
              'No movies available',
              style: AppTextStyels.primary16regular,
            ),
          );
        }

        return SingleChildScrollView(
          physics:  BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AvailableNowCarousel(movies: moviesList),
              SizedBox(height: context.height * 0.02),

              if (selectedGenre != null)
                GenreSectionItem(
                  genreName: selectedGenre!,
                  allMovies: moviesList,
                ),

              SizedBox(height: context.height * 0.02),
            ],
          ),
        );
      },
    );
  }
}