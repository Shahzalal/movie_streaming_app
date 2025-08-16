import 'package:flutter/material.dart';
import 'package:movie_streaming_app/core/utils/size_config.dart';

import '../core/theme/app_colors.dart';
import '../core/utils/ui_helper.dart';

import '../domain/entities/models/movie.dart';


class MovieRatingYearGenreWidget extends StatelessWidget {
  const MovieRatingYearGenreWidget({super.key, required this.movie});

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(Icons.star, color: Colors.amber),
        SizedBox(width: SizeConfig.ws(4)),
        UiHelper.customText(
          text: movie.rating.toStringAsFixed(1),
          fontsize: SizeConfig.ws(14),
          color: Colors.amber,
        ),
        SizedBox(width: SizeConfig.ws(10)),
        UiHelper.customText(
          text: movie.releaseYear,
          fontsize: SizeConfig.ws(14),
          color: AppColors.versionTextColor,
        ),
        SizedBox(width: SizeConfig.ws(10)),
        UiHelper.customText(
          text: movie.duration,
          fontsize: SizeConfig.ws(14),
          color: AppColors.versionTextColor,
        ),
        SizedBox(width: SizeConfig.ws(10)),
        UiHelper.customText(
          text: movie.genre,
          fontsize: SizeConfig.ws(14),
          color: AppColors.versionTextColor,
        ),
      ],
    );
  }
}
