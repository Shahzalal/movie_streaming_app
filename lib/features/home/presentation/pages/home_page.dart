import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_streaming_app/core/utils/size_config.dart';
import 'package:movie_streaming_app/core/utils/ui_helper.dart';
import 'package:movie_streaming_app/domain/networks/top_charts_provider.dart';
import 'package:movie_streaming_app/features/getx/controller/top_charts_controller.dart';
import 'package:movie_streaming_app/features/series_details/presentation/pages/series_details.dart';
import 'package:movie_streaming_app/shared_widgets/custom_status_bar.dart';

import '../../../../domain/networks/movie_provider.dart';
import '../../../../shared_widgets/home_hero_widget.dart';
import '../../../../shared_widgets/movie_play_main_button.dart';
import '../../../../shared_widgets/movie_rating_year_gerne_widget.dart';
import '../../../plan_card/presentation/pages/premium_plan_bottom_sheet.dart';
import '../../../getx/controller/movie_controller.dart';
import '../../../top_charts/presentation/pages/top_charts.dart';
import '../widgets/home_carousel_widget.dart';
import '../widgets/home_popular_widget.dart';
import '../widgets/home_top_charts_widget.dart';
import '../widgets/section_header_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final controller = Get.put(MovieController(MovieProvider()));
  final topController = Get.put(TopChartsController(TopChartsProvider()));

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

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
                child: GetBuilder<MovieController>(
                  builder: (controller) {
                    if (controller.isLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (controller.movies.isEmpty) {
                      return const Center(
                        child: Text("No movies information found"),
                      );
                    }

                    final movie = controller.movies[0];

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Hero info: rating, year, genre
                        MovieRatingYearGenreWidget(movie: movie),

                        SizedBox(height: SizeConfig.hs(16)),

                        /// Play button with favorite icon
                        MoviePlayButtonWidget(
                          title: 'Watch Movie', // ElevatedButton text
                          movieTitle: movie.title, // favorite icon use
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              builder: (_) => SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.85,
                                child: PremiumPlanBottomSheet(),
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  },
                ),
              ),

              SizedBox(height: SizeConfig.hs(20)),

              /// ================= Top Charts =================
              SectionHeaderWidget(
                title: "Top Charts",
                action: "View All",
                onActionTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TopChartsPage(),
                    ),
                  );
                },
              ),
              SizedBox(height: SizeConfig.hs(12)),
              HomeTopChartsWidget(),

              /// ================= Weekly Highlight =================
              SectionHeaderWidget(title: "Weekly Highlight", action: ""),
              SizedBox(height: SizeConfig.hs(12)),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SeriesDetails()),
                  );
                },
                child: HomeCarouselWidget(),
              ),

              SizedBox(height: SizeConfig.hs(20)),

              /// ================= Popular Star =================
              SectionHeaderWidget(title: "Popular Star", action: ""),
              SizedBox(height: SizeConfig.hs(12)),
              PopularStarWidget(),

              SizedBox(height: SizeConfig.hs(5)),
            ],
          ),
        ),
      ),
    );
  }
}

// class HomePage extends StatelessWidget {
//   HomePage({super.key});
//
//   final controller = Get.put(MovieController(MovieProvider()));
//   final topController = Get.put(TopChartsController(TopChartsProvider()));
//
//   @override
//   Widget build(BuildContext context) {
//     SizeConfig.init(context);
//
//     return CustomStatusBar(
//       child: Scaffold(
//         backgroundColor: UiHelper.scaffoldBg,
//         body: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               /// ================= Banner =================
//               HomeHeroWidget(),
//
//               /// Details in the black section below
//               Container(
//                 width: double.infinity,
//                 color: Colors.black,
//                 padding: EdgeInsets.symmetric(
//                   horizontal: SizeConfig.ws(16),
//                   vertical: SizeConfig.hs(16),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     GetBuilder<MovieController>(
//                       builder: (controller) {
//                         if (controller.isLoading) {
//                           return const Center(
//                             child: CircularProgressIndicator(),
//                           );
//                         }
//
//                         if (controller.movies.isEmpty) {
//                           return const Center(
//                             child: Text("No movies information found"),
//                           );
//                         }
//
//                         final movie = controller.movies[0];
//
//                         return MovieRatingYearGenreWidget(movie: movie);
//                       },
//                     ),
//
//                     SizedBox(height: SizeConfig.hs(16)),
//
//                     MoviePlayButtonWidget(
//                       title: 'Watch Movie',
//                       onTap: () {
//                         showModalBottomSheet(
//                           context: context,
//                           isScrollControlled: true,
//                           // fullscreen height possible
//                           backgroundColor: Colors.transparent,
//                           builder: (_) => SizedBox(
//                             height:
//                                 MediaQuery.of(context).size.height *
//                                 0.85, // 85% height
//                             child: PremiumPlanBottomSheet(),
//                           ),
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//
//                     GetBuilder<MovieController>(
//                       builder: (controller) {
//                         if (controller.isLoading) {
//                           return const Center(
//                             child: CircularProgressIndicator(),
//                           );
//                         }
//
//                         if (controller.movies.isEmpty) {
//                           return const Center(
//                             child: Text("No movies information found"),
//                           );
//                         }
//
//                         final movie = controller.movies[0];
//
//                         return MoviePlayButtonWidget(
//                           title: "Watch Movie",       // ElevatedButton এর টেক্সট
//                           movieTitle: movie.title,    // Favorite icon এর জন্য
//                           onTap: () {
//                             showModalBottomSheet(
//                               context: context,
//                               isScrollControlled: true,
//                               backgroundColor: Colors.transparent,
//                               builder: (_) => SizedBox(
//                                 height: MediaQuery.of(context).size.height * 0.85,
//                                 child: PremiumPlanBottomSheet(),
//                               ),
//                             );
//                           },
//                         )
//                         ;
//                       },
//                     ),
//
//
//                     SizedBox(height: SizeConfig.hs(20)),
//
//               /// ================= Top Charts =================
//               SectionHeaderWidget(
//                 title: "Top Charts",
//                 action: "View All",
//                 onActionTap: () {
//                   // Navigate to TopChartsPage
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => const TopChartsPage(),
//                     ),
//                   );
//                 },
//               ),
//               SizedBox(height: SizeConfig.hs(12)),
//               HomeTopChartsWidget(),
//
//               /// ================= Weekly Highlight =================
//               SectionHeaderWidget(title: "Weekly Highlight", action: ""),
//               SizedBox(height: SizeConfig.hs(12)),
//               GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => SeriesDetails()),
//                   );
//                 },
//
//                 child: HomeCarouselWidget(),
//               ),
//
//               SizedBox(height: SizeConfig.hs(20)),
//
//               /// ================= Popular Star =================
//               SectionHeaderWidget(title: "Popular Star", action: ""),
//               SizedBox(height: SizeConfig.hs(12)),
//
//               PopularStarWidget(),
//
//               SizedBox(height: SizeConfig.hs(5)),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:movie_streaming_app/core/utils/size_config.dart';
// import 'package:movie_streaming_app/core/utils/ui_helper.dart';
// import 'package:movie_streaming_app/features/getx/controller/movie_controller.dart';
// import 'package:movie_streaming_app/features/getx/controller/top_charts_controller.dart';
// import 'package:movie_streaming_app/domain/networks/movie_provider.dart';
// import 'package:movie_streaming_app/domain/networks/top_charts_provider.dart';
//
// import '../../../../shared_widgets/custom_status_bar.dart';
// import '../../../../shared_widgets/home_hero_widget.dart';
// import '../../../../shared_widgets/movie_play_main_button.dart';
// import '../../../plan_card/presentation/pages/premium_plan_bottom_sheet.dart';
// import '../../../series_details/presentation/pages/series_details.dart';
// import '../../../top_charts/presentation/pages/top_charts.dart';
// import '../widgets/home_carousel_widget.dart';
// import '../widgets/home_popular_widget.dart';
// import '../widgets/home_top_charts_widget.dart';
// import '../widgets/section_header_widget.dart';
//
//
// class HomePage extends StatelessWidget {
//   HomePage({super.key});
//
//   final controller = Get.put(MovieController(MovieProvider()));
//   final topController = Get.put(TopChartsController(TopChartsProvider()));
//
//   @override
//   Widget build(BuildContext context) {
//     SizeConfig.init(context);
//
//     return CustomStatusBar(
//       child: Scaffold(
//         backgroundColor: UiHelper.scaffoldBg,
//         body: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               /// ================= Banner =================
//               const HomeHeroWidget(),
//
//               /// Details in the black section below
//               Container(
//                 width: double.infinity,
//                 color: Colors.black,
//                 padding: EdgeInsets.symmetric(
//                   horizontal: SizeConfig.ws(16),
//                   vertical: SizeConfig.hs(16),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     GetBuilder<MovieController>(
//                       builder: (controller) {
//                         if (controller.isLoading) {
//                           return const Center(
//                             child: CircularProgressIndicator(),
//                           );
//                         }
//
//                         if (controller.movies.isEmpty) {
//                           return const Center(
//                             child: Text("No movies information found"),
//                           );
//                         }
//
//                         final movie = controller.movies[0];
//
//                         return MoviePlayButtonWidget(
//                           title: "Watch Movie",       // ElevatedButton এর text
//                           movieTitle: movie.title,    // Favorite icon এর জন্য
//                           onTap: () {
//                             showModalBottomSheet(
//                               context: context,
//                               isScrollControlled: true,
//                               backgroundColor: Colors.transparent,
//                               builder: (_) => SizedBox(
//                                 height: MediaQuery.of(context).size.height * 0.85,
//                                 child: PremiumPlanBottomSheet(),
//                               ),
//                             );
//                           },
//                         );
//                       },
//                     ),
//
//                     SizedBox(height: SizeConfig.hs(20)),
//
//                     /// ================= Top Charts =================
//                     SectionHeaderWidget(
//                       title: "Top Charts",
//                       action: "View All",
//                       onActionTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => const TopChartsPage(),
//                           ),
//                         );
//                       },
//                     ),
//                     SizedBox(height: SizeConfig.hs(12)),
//                     HomeTopChartsWidget(),
//
//                     /// ================= Weekly Highlight =================
//                     SectionHeaderWidget(title: "Weekly Highlight", action: ""),
//                     SizedBox(height: SizeConfig.hs(12)),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => SeriesDetails()),
//                         );
//                       },
//                       child: HomeCarouselWidget(),
//                     ),
//
//                     SizedBox(height: SizeConfig.hs(20)),
//
//                     /// ================= Popular Star =================
//                     SectionHeaderWidget(title: "Popular Star", action: ""),
//                     SizedBox(height: SizeConfig.hs(12)),
//                     PopularStarWidget(),
//
//                     SizedBox(height: SizeConfig.hs(5)),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
