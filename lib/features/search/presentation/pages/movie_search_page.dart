import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_streaming_app/domain/networks/search_movie_provider.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../core/utils/ui_helper.dart';
import '../../../getx/controller/bottom_navigation_controller.dart';
import '../../../getx/controller/search_movies_controller.dart';
import '../../../video/presentation/pages/video_player.dart';

class MovieSearchPage extends StatelessWidget {
  const MovieSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize responsive sizing
    SizeConfig.init(context);

    // Controllers
    final searchMovieController = Get.put(
      SearchMoviesController(MoviessProvider()),
    );
    final bottomController = Get.put(BottomNavigationController());

    return Scaffold(
      backgroundColor: UiHelper.scaffoldBg,
      appBar: AppBar(
        backgroundColor: UiHelper.scaffoldBg,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: AppColors.mainTextColor),
          onPressed: () {
            // Switch to Home tab
            bottomController.changeIndex(0);
          },
        ),
        title: UiHelper.customText(
          text: "Search Movies",
          fontsize: SizeConfig.fs(20),
          fontweight: FontWeight.bold,
          color: AppColors.mainTextColor,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(SizeConfig.ws(12)),
        child: Column(
          children: [
            // Search Box
            GetBuilder<SearchMoviesController>(
              builder: (controller) {
                return TextField(
                  style: TextStyle(
                    color: AppColors.mainTextColor,
                    fontSize: SizeConfig.fs(16),
                    fontFamily: "regular",
                  ),
                  decoration: InputDecoration(
                    hintText: "Search...",
                    hintStyle: TextStyle(
                      color: AppColors.bodyTextColor,
                      fontSize: SizeConfig.fs(14),
                      fontFamily: "regular",
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: AppColors.mainTextColor,
                      size: SizeConfig.ws(22),
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade900,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: SizeConfig.hs(12),
                      horizontal: SizeConfig.ws(16),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(SizeConfig.ws(6)),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: controller.searchMovies,
                );
              },
            ),
            SizedBox(height: SizeConfig.hs(20)),

            // Movie List
            Expanded(
              child: GetBuilder<SearchMoviesController>(
                builder: (controller) {
                  if (controller.searchResult.isEmpty) {
                    return Center(
                      child: UiHelper.customText(
                        text: "No movies found",
                        fontsize: SizeConfig.fs(16),
                        color: AppColors.bodyTextColor,
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: controller.searchResult.length,
                    itemBuilder: (context, index) {
                      final movie = controller.searchResult[index];

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CustomVideoPlayer(),
                            ),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: SizeConfig.hs(12)),
                          height: SizeConfig.hs(180),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade900,
                            borderRadius: BorderRadius.circular(
                              SizeConfig.ws(6),
                            ),
                          ),
                          child: Stack(
                            children: [
                              // Movie Poster
                              ClipRRect(
                                borderRadius: BorderRadius.circular(
                                  SizeConfig.ws(12),
                                ),
                                child: Image.network(
                                  movie.posterUrl,
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),

                              // Semi-transparent overlay
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    SizeConfig.ws(12),
                                  ),
                                  color: Color(0x33000000),
                                ),
                              ),

                              // Play icon center
                              Center(
                                child: Icon(
                                  Icons.play_circle_fill,
                                  color: Colors.white,
                                  size: SizeConfig.ws(50),
                                ),
                              ),

                              // Movie title bottom-left
                              Positioned(
                                bottom: SizeConfig.hs(12),
                                left: SizeConfig.ws(12),
                                child: UiHelper.customText(
                                  text: movie.title,
                                  fontsize: SizeConfig.fs(18),
                                  fontweight: FontWeight.bold,
                                  color: AppColors.mainTextColor,
                                ),
                              ),

                              // Release year bottom-right
                              Positioned(
                                bottom: SizeConfig.hs(12),
                                right: SizeConfig.ws(12),
                                child: UiHelper.customText(
                                  text: movie.releaseYear,
                                  fontsize: SizeConfig.fs(14),
                                  color: AppColors.mainTextColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
