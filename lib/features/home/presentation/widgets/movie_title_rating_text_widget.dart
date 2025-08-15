import 'package:flutter/material.dart';
import 'package:movie_streaming_app/core/utils/size_config.dart';

import '../../../../core/utils/ui_helper.dart';

class MovieTitleRatingTextWidget extends StatelessWidget {
  const MovieTitleRatingTextWidget({
    super.key,
    required this.title,
    required this.rating,
    required this.year,
    required this.duration,
    required this.genre,
  });

  final String title;
  final String rating;
  final String year;
  final String duration;
  final String genre;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Padding(
      padding: EdgeInsets.all(SizeConfig.ws(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UiHelper.customText(
            text: title,
            fontsize: SizeConfig.ws(16),
            fontweight: FontWeight.bold,
            color: Colors.white,
          ),
          SizedBox(height: SizeConfig.hs(6)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.star,
                color: Colors.amber,
                size: SizeConfig.ws(16),
              ),
              SizedBox(width: SizeConfig.ws(4)),
              UiHelper.customText(
                text: rating,
                fontsize: SizeConfig.ws(14),
                color: Colors.white,
              ),
              SizedBox(width: SizeConfig.ws(10)),
              UiHelper.customText(
                text: year,
                fontsize: SizeConfig.ws(14),
                color: Colors.white70,
              ),
              SizedBox(width: SizeConfig.ws(10)),
              UiHelper.customText(
                text: duration,
                fontsize: SizeConfig.ws(14),
                color: Colors.white70,
              ),
              SizedBox(width: SizeConfig.ws(10)),
              UiHelper.customText(
                text: genre,
                fontsize: SizeConfig.ws(14),
                color: Colors.white70,
              ),
            ],
          ),
        ],
      ),
    );
  }
}