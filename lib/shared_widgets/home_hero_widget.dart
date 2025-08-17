import 'package:flutter/material.dart';
import 'package:movie_streaming_app/core/utils/size_config.dart';

import '../core/utils/ui_helper.dart';
import '../domain/networks/hero_banner_provider.dart';
import '../domain/networks/movie_provider.dart';
import '../features/getx/controller/movie_controller.dart';
import 'package:get/get.dart';

// class HomeHeroWidget extends StatelessWidget {
//    const HomeHeroWidget({
//     super.key,
//   });
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     SizeConfig.init(context);
//     final bannerController = Get.put(BannerController(HeroBannerProvider()));
//     return GetBuilder<BannerController>(
//         builder: (controller) {
//           if (controller.isLoading) {
//             return const Center(child: CircularProgressIndicator());
//           }
//           if (controller.banners.isEmpty) {
//             return const Center(child: Text("No banner found"));
//           }
//           final banner = controller.banners.first;
//           return Stack(
//           children: [
//             Image.asset(
//               banner.image,
//               width: SizeConfig.screenWidth,
//               height: SizeConfig.hs(360),
//               fit: BoxFit.cover,
//             ),
//
//             Positioned.fill(
//               child: Align(
//                 alignment: Alignment.bottomCenter,
//                 child: Container(
//                   height: SizeConfig.hs(120),
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       begin: Alignment.topCenter,
//                       end: Alignment.bottomCenter,
//                       colors: [
//                         Colors.transparent,
//                         Colors.black.withOpacity(0.7),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//
//             Positioned(
//               left: SizeConfig.ws(16),
//               bottom: 0,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   UiHelper.customText(
//                     text: "Rogue One: A Star Wars",
//                     fontsize: SizeConfig.ws(24),
//                     fontweight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                   UiHelper.customText(
//                     text: "Story",
//                     fontsize: SizeConfig.ws(24),
//                     fontweight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         );
//       }
//     );
//   }
// }

class HomeHeroWidget extends StatelessWidget {
  const HomeHeroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    final bannerController = Get.put(BannerController(HeroBannerProvider()));
    final movieController = Get.put(MovieController(MovieProvider()));

    return GetBuilder<BannerController>(
      builder: (controller) {
        if (controller.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.banners.isEmpty) {
          return const Center(child: Text("No banner found"));
        }

        // Movie title from first movie
        String movieTitle = movieController.movies.isNotEmpty
            ? movieController.movies.first.title
            : "Movie Title";

        // Split the title into two parts
        List<String> titleParts = movieTitle.split(" ");
        String text1 = titleParts.take(5).join(" ");
        String text2 = titleParts.skip(5).join(" ");

        final banner = controller.banners.first;

        return Stack(
          children: [
            Image.asset(
              banner.image,
              width: SizeConfig.screenWidth,
              height: SizeConfig.hs(360),
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
                    text: text1,
                    fontsize: SizeConfig.ws(24),
                    fontweight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  UiHelper.customText(
                    text: text2,
                    fontsize: SizeConfig.ws(24),
                    fontweight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
