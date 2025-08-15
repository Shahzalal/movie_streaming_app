import 'package:flutter/material.dart';
import 'package:movie_streaming_app/core/utils/size_config.dart';
import 'package:movie_streaming_app/core/utils/asset_path.dart';
import 'package:movie_streaming_app/core/utils/ui_helper.dart';
import 'package:movie_streaming_app/shared_widgets/custom_status_bar.dart';

import '../../../../shared_widgets/home_hero_widget.dart';
import '../../../../shared_widgets/movie_play_main_button.dart';
import '../../../../shared_widgets/movie_rating_year_gerne_widget.dart';
import '../../../../shared_widgets/premium_plan_bottom_sheet.dart';
import '../../../top_charts/presentation/pages/top_charts.dart';
import '../widgets/home_custom_page_indicator_widget.dart';
import '../widgets/movie_title_rating_text_widget.dart';
import '../widgets/section_header_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    final List<Map<String, String>> actors = [
      {'imagePath': AssetPath.actor1Image, 'name': 'Chris Evans'},
      {'imagePath': AssetPath.actor2Image, 'name': 'Robert Downey Jr.'},
      {'imagePath': AssetPath.actor3Image, 'name': 'Emma Watson'},
      {'imagePath': AssetPath.actor1Image, 'name': 'Chris Evans'},
    ];

    return CustomStatusBar(
      child: Scaffold(
        backgroundColor: UiHelper.scaffoldBg,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// ================= Banner =================
              HomeHeroWidget(),

              /// Details in the black section below
              Container(
                width: double.infinity,
                color: Colors.black,
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.ws(16),
                  vertical: SizeConfig.hs(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MovieRatingYearGenreWidget(
                      rating: 8.4,
                      year: '2016',
                      duration: '1h 54m',
                      genre: 'Sci-Fi',
                    ),

                    SizedBox(height: SizeConfig.hs(16)),

                    MoviePlayButtonWidget(
                      title: 'Watch Movie',
                      onTap: (){
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true, // fullscreen height possible
                        backgroundColor: Colors.transparent,
                        builder: (_) => SizedBox(
                          height: MediaQuery.of(context).size.height * 0.85, // 85% height
                          child: PremiumPlanBottomSheet(),
                        ),
                      );
                    },),
                  ],
                ),
              ),

              SizedBox(height: SizeConfig.hs(20)),

              /// ================= Top Charts =================
              SectionHeaderWidget(title: "Top Charts", action: "View All",onActionTap: () {
                // Navigate to TopChartsPage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TopChartsPage()),
                );
              },),
              SizedBox(height: SizeConfig.hs(12)),
              horizontalMovieList(
                movies: [
                  {
                    'imagePath': AssetPath.hero2Image,
                    'title': 'Dune',
                    'rating': '8.9',
                    'year': '2015',
                    'duration': '1h 24m',
                    'genre': 'Sci-Fi',
                  },
                  {
                    'imagePath': AssetPath.heroImage,
                    'title': 'Sinbad',
                    'rating': '8.9',
                    'year': '2021',
                    'duration': '2h 35m',
                    'genre': 'Action',
                  },
                ],
              ),

              /// ================= Weekly Highlight =================
              SectionHeaderWidget(title: "Weekly Highlight", action: ""),
              SizedBox(height: SizeConfig.hs(12)),
              horizontalMovieList(
                movies: [
                  {
                    'imagePath': AssetPath.hero4Image,
                    'title': 'Dune',
                    'rating': '8.9',
                    'year': '2015',
                    'duration': '1h 24m',
                    'genre': 'Sci-Fi',
                    'progress': 0.6, // optional
                    'time': '01:14',
                    'height': SizeConfig.hs(220),
                    'width': SizeConfig.screenWidth * 0.95,
                    // optional
                  },
                ],
                indicator: HomeCustomPageIndicatorWidget(
                  currentIndex: 0,
                  total: 3,
                ),
              ),

              SizedBox(height: SizeConfig.hs(20)),

              /// ================= Popular Star =================
              SectionHeaderWidget(title: "Popular Star", action: ""),
              SizedBox(height: SizeConfig.hs(12)),

              SizedBox(
                height: SizeConfig.hs(150),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: SizeConfig.ws(16)),
                  itemCount: actors.length,
                  itemBuilder: (context, index) {
                    final actor = actors[index];
                    double imageSize = SizeConfig.ws(90);
                    return Container(
                      width: SizeConfig.ws(100),
                      margin: EdgeInsets.only(right: SizeConfig.ws(10)),
                      child: Column(
                        children: [
                          Container(
                            height: imageSize,
                            width: imageSize,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(actor['imagePath']!),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: SizeConfig.hs(8)),
                          UiHelper.customText(
                            text: actor['name']!,
                            fontsize: SizeConfig.ws(14),
                            color: Colors.white,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: SizeConfig.hs(10)),
            ],
          ),
        ),
      ),
    );
  }

  /// Horizontal movie list
  Widget horizontalMovieList({
    required List<Map<String, dynamic>> movies,
    Widget? indicator, // Optional Indicator
  }) {
    return Column(
      children: [
        SizedBox(
          height: SizeConfig.hs(300),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: SizeConfig.ws(16)),
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];

              // Required fields
              final String imagePath = movie['imagePath'];
              final String title = movie['title'];
              final String rating = movie['rating'];
              final String year = movie['year'];
              final String duration = movie['duration'];
              final String genre = movie['genre'];

              // Optional fields
              final double? progress = movie['progress'];
              final String? time = movie['time'];
              final double? customHeight = movie['height'];
              final double? customWidth = movie['width'];

              return Container(
                margin: EdgeInsets.only(right: SizeConfig.ws(12)),
                width: customWidth ?? SizeConfig.screenWidth * 0.8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Image + Optional Progress Bar
                    ClipRRect(
                      borderRadius: BorderRadius.circular(SizeConfig.ws(8)),
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Image.asset(
                            imagePath,
                            height: customHeight ?? SizeConfig.hs(180),
                            width: customWidth ?? SizeConfig.screenWidth * 0.8,
                            fit: BoxFit.cover,
                          ),

                          if (progress != null && time != null)
                            Positioned(
                              bottom: SizeConfig.hs(10),
                              left: 0,
                              right: 0,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: SizeConfig.ws(12),
                                ),
                                child: Container(
                                  height: SizeConfig.hs(36),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: SizeConfig.ws(8),
                                    vertical: SizeConfig.hs(4),
                                  ),
                                  decoration: BoxDecoration(
                                    color: Color(0x66000000
                                    ),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.play_arrow,
                                        color: Colors.white,
                                        size: SizeConfig.ws(18),
                                      ),
                                      Expanded(
                                        child: SliderTheme(
                                          data: SliderTheme.of(context)
                                              .copyWith(
                                                trackHeight: 1,
                                                thumbShape:
                                                    RoundSliderThumbShape(
                                                      enabledThumbRadius: 5,
                                                    ),
                                              ),
                                          child: Slider(
                                            value: progress,
                                            onChanged: (_) {},
                                            activeColor: Colors.white,
                                            inactiveColor: Colors.white38,
                                          ),
                                        ),
                                      ),
                                      UiHelper.customText(
                                        text: time,
                                        fontsize: SizeConfig.ws(12),
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),

                    /// Text Section
                    MovieTitleRatingTextWidget(
                      title: title,
                      rating: rating,
                      year: year,
                      duration: duration,
                      genre: genre,
                    ),
                  ],
                ),
              );
            },
          ),
        ),

        /// Optional Indicator
        if (indicator != null) ...[
          SizedBox(height: SizeConfig.hs(8)),
          Center(child: indicator),
        ],
      ],
    );
  }
}


