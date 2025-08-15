import 'package:flutter/material.dart';
import 'package:movie_streaming_app/core/utils/size_config.dart';
import 'package:movie_streaming_app/core/utils/ui_helper.dart';
import 'package:movie_streaming_app/core/theme/app_colors.dart';
import 'package:movie_streaming_app/core/utils/asset_path.dart';

import '../../../video/presentation/pages/video_player.dart';

void showEpisodesBottomSheet(BuildContext context) {
  SizeConfig.init(context);

  final List<Map<String, String>> episodes = [
    {'title': 'Episode 1: The Beginning', 'image': AssetPath.sl1Image},
    {'title': 'Episode 2: Meet the Heroes', 'image': AssetPath.sl2Image},
    {'title': 'Episode 3: Redemption', 'image': AssetPath.sl3Image},
    {'title': 'Episode 4: The Reckoning', 'image': AssetPath.sl4Image},
    {'title': 'Episode 5: The Passenger', 'image': AssetPath.sl5Image},
    {'title': 'Episode 6: The Tragedy', 'image': AssetPath.sl1Image},
  ];

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.black,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(SizeConfig.ws(20)),
      ),
    ),
    builder: (context) {
      return Container(
        height: SizeConfig.screenHeight * 0.9,
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.ws(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: SizeConfig.hs(10)),

            /// Top Handle Center
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: SizeConfig.ws(40),
                  height: SizeConfig.hs(5),
                  decoration: BoxDecoration(
                    color: Colors.grey[600],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            ),
            SizedBox(height: SizeConfig.hs(14)),

            /// Titles Start Align
            UiHelper.customText(
              text: "The Mandalorian",
              fontsize: SizeConfig.ws(26),
              fontweight: FontWeight.bold,
              fontfamily: 'bold',
              color: AppColors.mainTextColor,
            ),
            SizedBox(height: SizeConfig.hs(10)),
            UiHelper.customText(
              text: "Season 1",
              fontsize: SizeConfig.ws(20),
              fontweight: FontWeight.bold,
              fontfamily: 'bold',
              color: AppColors.mainTextColor,
            ),
            SizedBox(height: SizeConfig.hs(14)),

            /// Scrollable Episode List
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(episodes.length, (index) {
                    final ep = episodes[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: SizeConfig.hs(10),
                      ),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>CustomVideoPlayer()));
                        },
                        child: Row(
                          children: [
                            /// Episode Thumbnail
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius:
                                  BorderRadius.circular(SizeConfig.ws(10)),
                                  child: Image.asset(
                                    ep['image']!,
                                    width: SizeConfig.ws(140),
                                    height: SizeConfig.hs(85),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Icon(
                                  Icons.play_circle_fill,
                                  color: Colors.white,
                                  size: SizeConfig.ws(38),
                                ),
                              ],
                            ),
                            SizedBox(width: SizeConfig.ws(14)),

                            /// Episode Title
                            Expanded(
                              child: UiHelper.customText(
                                text: ep['title']!,
                                fontsize: SizeConfig.ws(16),
                                color: AppColors.mainTextColor,
                                maxLines: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

