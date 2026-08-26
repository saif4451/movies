import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/Model/movie_model/Movies.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_text_styels.dart';
import 'package:movies_app/core/utils/mob_size.dart';
import 'movie_card.dart';

class GenreSectionItem extends StatefulWidget {
  final String genreName;
  final List<Movies> allMovies;

  const GenreSectionItem({
    super.key,
    required this.genreName,
    required this.allMovies,
  });

  @override
  State<GenreSectionItem> createState() => _GenreSectionItemState();
}

class _GenreSectionItemState extends State<GenreSectionItem> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
//see more scroll
  void _scrollToNextGroup(BuildContext context) {
    if (_scrollController.hasClients) {
      final double scrollAmount = context.width * 0.4;
      final double targetOffset = _scrollController.offset + scrollAmount;

      _scrollController.animateTo(
        targetOffset.clamp(
          0.0,
          _scrollController.position.maxScrollExtent,
        ),
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    final genreMovies = widget.allMovies.where((movie) {
      if (movie.genres == null) return false;
      return movie.genres!.any(
            (g) => g.toLowerCase().trim() == widget.genreName.toLowerCase().trim(),
      );
    }).toList();

    if (genreMovies.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.width * 0.04,
            vertical: context.height * 0.01,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.genreName,
                style: AppTextStyels.White20regular
              ),
              InkWell(
                onTap: () => _scrollToNextGroup(context),
                child: Row(
                  children: [
                    Text(
                      context.tr('see_more'),
                      style: AppTextStyels.primary16regular
                    ),
                     SizedBox(width: context.width*0.01),
                     Icon(
                      Icons.arrow_forward,
                      color: AppColors.primaryColor,
                      size: 14,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        SizedBox(
          height: context.height * 0.23,
          child: ListView.builder(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.only(left: context.width * 0.04),
            itemCount: genreMovies.length,
            itemBuilder: (context, index) {
              return MovieCard(
                movie: genreMovies[index],
                width: context.width * 0.35,
              );
            },
          ),
        ),

        SizedBox(height: context.height * 0.02),
      ],
    );
  }
}