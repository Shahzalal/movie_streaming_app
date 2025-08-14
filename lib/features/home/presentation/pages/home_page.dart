import 'package:flutter/material.dart';
import 'package:movie_streaming_app/core/theme/app_colors.dart';
import 'package:movie_streaming_app/core/utils/size_config.dart';
import 'package:movie_streaming_app/core/utils/asset_path.dart';
import 'package:movie_streaming_app/core/utils/ui_helper.dart';
import 'package:movie_streaming_app/shared_widgets/custom_status_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    final List<Map<String, String>> actors = [
      {
        'imagePath': AssetPath.actor1Image,
        'name': 'Chris Evans',
      },
      {
        'imagePath': AssetPath.actor2Image,
        'name': 'Robert Downey Jr.',
      },
      {
        'imagePath': AssetPath.actor3Image,
        'name': 'Emma Watson',
      },
      {
        'imagePath': AssetPath.actor1Image,
        'name': 'Chris Evans',
      },
    ];


    return CustomStatusBar(
      child: Scaffold(
        backgroundColor: UiHelper.scaffoldBg,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// ================= Banner =================
              Stack(
                children: [
                  Image.asset(
                    AssetPath.heroImage,
                    width: SizeConfig.screenWidth,
                    height: SizeConfig.hs(400),
                    fit: BoxFit.cover,
                  ),

                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: SizeConfig.hs(120),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.7),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    left: SizeConfig.ws(16),
                    bottom: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        UiHelper.customText(
                          text: "Rogue One: A Star Wars",
                          fontsize: SizeConfig.ws(24),
                          fontweight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        UiHelper.customText(
                          text: "Story",
                          fontsize: SizeConfig.ws(24),
                          fontweight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

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

                    Row(
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
                          text: "8.4",
                          fontsize: SizeConfig.ws(14),
                          color: Colors.white,
                        ),
                        SizedBox(width: SizeConfig.ws(10)),
                        UiHelper.customText(
                          text: "2016",
                          fontsize: SizeConfig.ws(14),
                          color: Colors.white70,
                        ),
                        SizedBox(width: SizeConfig.ws(10)),
                        UiHelper.customText(
                          text: "1h 54m",
                          fontsize: SizeConfig.ws(14),
                          color: Colors.white70,
                        ),
                        SizedBox(width: SizeConfig.ws(10)),
                        UiHelper.customText(
                          text: "Sci-Fi",
                          fontsize: SizeConfig.ws(14),
                          color: Colors.white70,
                        ),
                      ],
                    ),

                    SizedBox(height: SizeConfig.hs(16)),

                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryBlue,
                              padding: EdgeInsets.symmetric(
                                vertical: SizeConfig.hs(14),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  SizeConfig.ws(8),
                                ),
                              ),
                            ),
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.play_circle_fill,
                                  color: Colors.white,
                                  size: SizeConfig.ws(20),
                                ),
                                SizedBox(width: SizeConfig.ws(8)),
                                UiHelper.customText(
                                  text: "Watch Movie",
                                  fontsize: SizeConfig.ws(16),
                                  color: Colors.white,
                                  fontweight: FontWeight.w500,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: SizeConfig.ws(10)),
                        Container(
                          width: SizeConfig.ws(48),
                          height: SizeConfig.ws(48),
                          decoration: BoxDecoration(
                            color: const Color(0xFF282828),
                            borderRadius: BorderRadius.circular(
                              SizeConfig.ws(8),
                            ),
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.bookmark_border,
                              color: Colors.white,
                              size: SizeConfig.ws(22),
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: SizeConfig.hs(20)),

              /// ================= Top Charts =================
              sectionHeader("Top Charts", "View All"),
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
              sectionHeader("Weekly Highlight", ""),
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
                    'height':SizeConfig.hs(220),
                    'width':SizeConfig.screenWidth*0.95,
                    // optional
                  },

                ],
                indicator: customPageIndicator(0, 3),
              ),


              SizedBox(height: SizeConfig.hs(20)),

              /// ================= Popular Star =================
              sectionHeader("Popular Star", ""),
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

  /// Reusable header widget
  Widget sectionHeader(String title, String action) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.ws(16)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          UiHelper.customText(
            text: title,
            fontsize: SizeConfig.ws(18),
            fontweight: FontWeight.bold,
            color: Colors.white,
          ),
          action.isNotEmpty
              ? UiHelper.customText(
                  text: action,
                  fontsize: SizeConfig.ws(14),
                  color: AppColors.mainTextColor,
                )
              : const SizedBox(),
        ],
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
                                    color: Colors.black.withOpacity(0.4),
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
                                          data: SliderTheme.of(context).copyWith(
                                            trackHeight: 1,
                                            thumbShape: RoundSliderThumbShape(
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
                            )
                        ],
                      ),
                    ),

                    /// Text Section
                    Padding(
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


  Widget customPageIndicator(int currentIndex, int total) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(total, (index) {
        bool isActive = index == currentIndex;
        return AnimatedContainer(
          duration: Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: 4),
          height: isActive ? SizeConfig.hs(10) : SizeConfig.hs(6),
          width: SizeConfig.ws(6),
          decoration: BoxDecoration(
            color: isActive ? Colors.blue : Colors.grey[700],
            borderRadius: BorderRadius.circular(SizeConfig.ws(20)),
          ),
        );
      }),
    );
  }



}
