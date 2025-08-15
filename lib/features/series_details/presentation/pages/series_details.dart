import 'package:flutter/material.dart';
import 'package:movie_streaming_app/core/utils/ui_helper.dart';
import 'package:movie_streaming_app/shared_widgets/custom_status_bar.dart';
import 'package:movie_streaming_app/shared_widgets/movie_play_main_button.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/asset_path.dart';
import '../../../../core/utils/size_config.dart';
import '../../../video/presentation/pages/video_player.dart';
import '../widgets/show_episode_bottom_sheet.dart';

class SeriesDetails extends StatelessWidget {
  const SeriesDetails({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return CustomStatusBar(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    Image.asset(
                      AssetPath.hs1Image,
                      width: SizeConfig.screenWidth,
                      height: SizeConfig.hs(340),
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
                              colors: [Colors.transparent, Color(0xB3000000)],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: SizeConfig.ws(16),
                      bottom: 0,
                      child: UiHelper.customText(
                        text: "The Mandalorian",
                        fontsize: SizeConfig.ws(24),
                        fontweight: FontWeight.bold,
                        fontfamily: 'bold',
                        color: AppColors.mainTextColor,
                      ),
                    ),
                    SafeArea(
                      child: Padding(
                        padding: EdgeInsets.all(SizeConfig.ws(8)),
                        child: Container(
                          width: SizeConfig.ws(40),
                          height: SizeConfig.hs(40),
                          decoration: BoxDecoration(
                            color: Color(0x4D000000),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: SizeConfig.ws(20),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),


                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.ws(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: SizeConfig.hs(3)),
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
                            color: AppColors.mainTextColor,
                          ),
                          SizedBox(width: SizeConfig.ws(12)),
                          UiHelper.customText(
                            text: "2016",
                            fontsize: SizeConfig.ws(14),
                            color: AppColors.bodyTextColor,
                          ),
                          SizedBox(width: SizeConfig.ws(12)),
                          UiHelper.customText(
                            text: "2 Season",
                            fontsize: SizeConfig.ws(14),
                            color: AppColors.bodyTextColor,
                          ),
                          SizedBox(width: SizeConfig.ws(12)),
                          UiHelper.customText(
                            text: "18 Episode",
                            fontsize: SizeConfig.ws(14),
                            color: AppColors.bodyTextColor,
                          ),
                          SizedBox(width: SizeConfig.ws(12)),
                          UiHelper.customText(
                            text: "Action",
                            fontsize: SizeConfig.ws(14),
                            color: AppColors.bodyTextColor,
                          ),
                        ],
                      ),
                      SizedBox(height: SizeConfig.hs(12)),
                      RichText(
                        text: TextSpan(
                          text:
                          "After the collapse of the Galactic Empire, chaos reigned. A reclusive shooter seeks to explore the outer regions, earning his living as a bounty hunter.",
                          style: TextStyle(
                            fontSize: SizeConfig.ws(14),
                            color: AppColors.bodyTextColor,
                          ),
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                      SizedBox(height: SizeConfig.hs(6)),
                    ],
                  ),
                ),


              ],
            ),

            /// -----Scrollable Part-----
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: SizeConfig.ws(16)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        /// Season 1 Section
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            UiHelper.customText(
                              text: "Season 1",
                              fontsize: SizeConfig.ws(16),
                              fontweight: FontWeight.w600,
                              color: AppColors.mainTextColor,
                            ),
                            GestureDetector(
                              onTap: (){
                                showEpisodesBottomSheet(context);
                              },
                              child: UiHelper.customText(
                                text: "View All",
                                fontsize: SizeConfig.ws(14),
                                fontweight: FontWeight.w600,
                                color: AppColors.versionTextColor,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: SizeConfig.hs(12)),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(SizeConfig.ws(6)),
                          child: GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>CustomVideoPlayer()));
                            },
                            child: Stack(
                              children: [
                                Image.asset(
                                  AssetPath.hs2Image,
                                  width: SizeConfig.screenWidth,
                                  height: SizeConfig.hs(200),
                                  fit: BoxFit.cover,
                                ),
                                Positioned(
                                  top: SizeConfig.hs(160),
                                  left: SizeConfig.ws(10),
                                  child: Image.asset(
                                    AssetPath.pg1Image,
                                    width: SizeConfig.ws(320),
                                    height: SizeConfig.hs(30),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: SizeConfig.hs(10)),
                        UiHelper.customText(
                          text: "Episode 1 : The Beginning",
                          fontsize: SizeConfig.ws(16),
                          color: AppColors.bodyTextColor,
                        ),
                        SizedBox(height: SizeConfig.hs(20)),
                        MoviePlayButtonWidget(
                          title: 'Continue Watch S2E4',
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>CustomVideoPlayer()));
                          },
                        ),
                        SizedBox(height: SizeConfig.hs(30)),

                        /// Season 2 Section
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            UiHelper.customText(
                              text: "Season 2",
                              fontsize: SizeConfig.ws(16),
                              fontweight: FontWeight.w600,
                              color: AppColors.mainTextColor,
                            ),
                            GestureDetector(
                              onTap: (){
                                showEpisodesBottomSheet(context);
                              },
                              child: UiHelper.customText(
                                text: "View All",
                                fontsize: SizeConfig.ws(14),
                                fontweight: FontWeight.w600,
                                color: AppColors.versionTextColor,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: SizeConfig.hs(12)),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(SizeConfig.ws(6)),
                          child: GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>CustomVideoPlayer()));
                            },
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset(
                                  AssetPath.md1Image,
                                  width: SizeConfig.screenWidth,
                                  height: SizeConfig.hs(200),
                                  fit: BoxFit.cover,
                                ),
                                Icon(
                                  Icons.play_circle_fill,
                                  size: SizeConfig.ws(50),
                                  color: AppColors.mainTextColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: SizeConfig.hs(10)),
                        UiHelper.customText(
                          text: "Episode 4 : Revenge",
                          fontsize: SizeConfig.ws(16),
                          color: AppColors.bodyTextColor,
                        ),
                        SizedBox(height: SizeConfig.hs(20)),
                        MoviePlayButtonWidget(
                          title: 'Continue Watch S2E4',
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>CustomVideoPlayer()));
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
