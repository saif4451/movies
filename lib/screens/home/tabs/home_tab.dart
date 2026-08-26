import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/Model/movie_model/Movies.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/mob_size.dart';
import '../../../api/dio_manager.dart';
import '../../widgets/available_now_carousel.dart';
import '../../widgets/genre_section_item.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final ApiService _apiService = ApiService();
  late Future<List<Movies>> _moviesFuture;

  @override
  void initState() {
    super.initState();
    _moviesFuture = _apiService.getMovies();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Movies>>(
      future: _moviesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return  Center(
            child: CircularProgressIndicator(color: AppColors.primaryColor),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              'Error: ${snapshot.error}',
              style: const TextStyle(color: Colors.red),
            ),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text(
              'No movies available',
              style: TextStyle(color: AppColors.whiteColor),
            ),
          );
        }

        final moviesList = snapshot.data!;

        final List<String> extractedGenres = moviesList
            .expand((movie) => movie.genres ?? <String>[])
            .toSet()
            .toList();

        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AvailableNowCarousel(movies: moviesList),

              SizedBox(height: context.height * 0.02),

              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: extractedGenres.length,
                itemBuilder: (context, index) {
                  final genre = extractedGenres[index];
                  return GenreSectionItem(
                    genreName: genre,
                    allMovies: moviesList,
                  );
                },
              ),

              SizedBox(height: context.height * 0.02),
            ],
          ),
        );
      },
    );
  }
}