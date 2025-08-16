import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_streaming_app/core/theme/app_colors.dart';
import 'package:movie_streaming_app/core/utils/size_config.dart';
import 'package:movie_streaming_app/features/getx/controller/top_charts_controller.dart';
import '../../../../core/utils/ui_helper.dart';
import '../../../../domain/networks/top_charts_provider.dart';

class HomeCarouselWidget extends StatefulWidget {
  const HomeCarouselWidget({super.key});

  

  @override
  State<HomeCarouselWidget> createState() => _HomeCarouselWidgetState();
}

class _HomeCarouselWidgetState extends State<HomeCarouselWidget> {
  int _currentIndex = 0;
  final CarouselSliderController _carouselController =
      CarouselSliderController();

  final topController = Get.put(TopChartsController(TopChartsProvider()));

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return GetBuilder<TopChartsController>(

      builder: (controller) {
        if (controller.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (controller.topCharts.isEmpty) {
          return const Center(
            child: Text("No movies information found"),
          );
        }

        final movie = controller.topCharts[0];

        return Column(
          children: [
            ///  Carousel Slider
            CarouselSlider.builder(
              carouselController: _carouselController,
              itemCount: controller.topCharts.length,
              itemBuilder: (context, index, realIndex) {
                final movie = controller.topCharts[index];
                final infoList = [movie.releaseYear, movie.duration, movie.genre];

                return Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: SizeConfig.ws(12),
                    vertical: SizeConfig.hs(6),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Image + Positioned Overlay
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(SizeConfig.ws(12)),
                            child: Image.asset(
                              movie.image,
                              height: SizeConfig.hs(180),
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),

                          /// Positioned Progress Bar
                          Positioned(
                            left: SizeConfig.ws(8),
                            right: SizeConfig.ws(8),
                            bottom: SizeConfig.hs(8),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: SizeConfig.ws(8),
                                vertical: SizeConfig.hs(1),
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0x33FFFFFF),
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
                                        trackHeight: 2,
                                        thumbShape: const RoundSliderThumbShape(
                                          enabledThumbRadius: 5,
                                        ),
                                      ),
                                      child: Slider(
                                        value: 0.3, // 🔹 progress (dummy value)
                                        onChanged: (_) {},
                                        activeColor: Colors.white,
                                        inactiveColor: Colors.white38,
                                      ),
                                    ),
                                  ),
                                  UiHelper.customText(
                                    text: "12:45", //  time (dummy value)
                                    fontsize: SizeConfig.ws(12),
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: SizeConfig.hs(12)),

                      /// Title
                      UiHelper.customText(
                        text: movie.title,
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
                          _infoText(movie.rating.toStringAsFixed(1), isPrimary: true),

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

              },
              options: CarouselOptions(
                height: SizeConfig.hs(280),
                viewportFraction: 1,
                // full width
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 5),
                autoPlayAnimationDuration: const Duration(milliseconds: 1000),
                enableInfiniteScroll: true,
                onPageChanged: (index, reason) {
                  setState(() => _currentIndex = index);
                },
              ),
            ),

            ///  Indicator
            SizedBox(height: SizeConfig.hs(2)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: controller.topCharts.asMap().entries.map((entry) {
                final isActive = _currentIndex == entry.key;
                return GestureDetector(
                  onTap: () => _carouselController.animateToPage(
                    entry.key,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                  ),
                  child: Container(
                    width: SizeConfig.ws(isActive ? 4 : 4),
                    height: SizeConfig.hs(isActive ? 10 : 4),
                    margin: EdgeInsets.symmetric(horizontal: SizeConfig.ws(4)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: isActive
                          ? AppColors.primaryBlue
                          : Colors.white.withOpacity(0.5),
                    ),
                  ),
                );
              }).toList(),
            )

          ],
        );
      }
    );
  }

  /// Reusable info text widget
  Widget _infoText(String text, {bool isPrimary = false}) {
    return UiHelper.customText(
      text: text,
      fontsize: SizeConfig.ws(14),
      color: isPrimary ? Colors.white : Colors.white70,
    );
  }
}
