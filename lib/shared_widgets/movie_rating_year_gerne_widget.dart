import 'package:flutter/material.dart';
import 'package:movie_streaming_app/core/utils/size_config.dart';

import '../core/theme/app_colors.dart';
import '../core/utils/ui_helper.dart';

class MovieRatingYearGenreWidget extends StatelessWidget {
  const MovieRatingYearGenreWidget({
    super.key,
    required this.rating,
    this.year,
    required this.duration,
    required this.genre,
  });

  final double rating;
  final String? year;
  final String duration;
  final String genre;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: SizeConfig.hs(2)),
          child: Icon(
            Icons.star,
            color: Colors.amber,
            size: SizeConfig.ws(18),
          ),
        ),
        SizedBox(width: SizeConfig.ws(4)),
        UiHelper.customText(
          text: rating.toStringAsFixed(1),
          fontsize: SizeConfig.ws(14),
          color: Colors.amber,
        ),
        SizedBox(width: SizeConfig.ws(10)),
        UiHelper.customText(
          text: year ?? " ",
          fontsize: SizeConfig.ws(14),
          color: AppColors.versionTextColor,
        ),
        SizedBox(width: SizeConfig.ws(10)),
        UiHelper.customText(
          text: duration,
          fontsize: SizeConfig.ws(14),
          color: AppColors.versionTextColor,
        ),
        SizedBox(width: SizeConfig.ws(10)),
        UiHelper.customText(
          text: genre,
          fontsize: SizeConfig.ws(14),
          color: AppColors.versionTextColor,
        ),
      ],
    );
  }
}