import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/size_config.dart';
import '../../../getx/controller/top_charts_controller.dart';
import 'movie_title_rating_text_widget.dart';

class HomeTopChartsWidget extends StatelessWidget {
  const HomeTopChartsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return SizedBox(
      height: SizeConfig.hs(300),
      child: GetBuilder<TopChartsController>(
        builder: (controller) {
          if (controller.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (controller.topCharts.isEmpty) {
            return const Center(child: Text("No movies found"));
          }

          return ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: SizeConfig.ws(16)),
            itemCount: controller.topCharts.length,
            itemBuilder: (context, index) {
              final movie = controller.topCharts[index];

              return Container(
                margin: EdgeInsets.only(right: SizeConfig.ws(12)),
                width: SizeConfig.screenWidth * 0.8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Movie Image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(SizeConfig.ws(8)),
                      child: Image.asset(
                        movie.image,
                        height: SizeConfig.hs(180),
                        width: SizeConfig.screenWidth * 0.8,
                        fit: BoxFit.cover,
                      ),
                    ),

                    /// Title + Rating + Year + Duration + Genre
                    MovieTitleRatingTextWidget(topCharts: movie),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

