import 'package:flutter/material.dart';
import 'package:movie_streaming_app/core/utils/size_config.dart';
import 'package:movie_streaming_app/domain/entities/models/top_charts.dart';
import '../../../../core/utils/ui_helper.dart';

class MovieTitleRatingTextWidget extends StatelessWidget {
  const MovieTitleRatingTextWidget({super.key, required this.topCharts});

  final TopChartModel topCharts;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    /// common info list
    final infoList = [
      topCharts.releaseYear,
      topCharts.duration,
      topCharts.genre,
    ];

    return Padding(
      padding: EdgeInsets.all(SizeConfig.ws(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Title
          UiHelper.customText(
            text: topCharts.title,
            fontsize: SizeConfig.ws(16),
            fontweight: FontWeight.bold,
            color: Colors.white,
          ),
          SizedBox(height: SizeConfig.hs(6)),

          /// Rating + Info Row
          Row(
            children: [
              Icon(Icons.star, color: Colors.amber, size: SizeConfig.ws(16)),
              SizedBox(width: SizeConfig.ws(4)),

              /// rating
              _infoText(topCharts.rating.toStringAsFixed(1), isPrimary: true),

              ...infoList.map(
                (info) => Padding(
                  padding: EdgeInsets.only(left: SizeConfig.ws(10)),
                  child: _infoText(info),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// 🔹 Reusable text widget
  Widget _infoText(String text, {bool isPrimary = false}) {
    return UiHelper.customText(
      text: text,
      fontsize: SizeConfig.ws(14),
      color: isPrimary ? Colors.white : Colors.white70,
    );
  }
}
