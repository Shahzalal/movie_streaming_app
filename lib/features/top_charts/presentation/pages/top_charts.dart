import 'package:flutter/material.dart';
import 'package:movie_streaming_app/core/utils/asset_path.dart';
import 'package:movie_streaming_app/core/utils/size_config.dart';
import 'package:movie_streaming_app/features/movie_details/presentation/pages/movie_details.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/ui_helper.dart';

class TopChartsPage extends StatelessWidget {
  const TopChartsPage({super.key});

  final List<Map<String, dynamic>> topCharts = const [
    {
      "title": "Legends",
      "rating": 8.9,
      "year": "2016",
      "duration": "1h 54m",
      "image": AssetPath.tc1Image
    },
    {
      "title": "The Good Dinosaur",
      "rating": 8.9,
      "year": "2016",
      "duration": "2h 35m",
      "image": AssetPath.tc2Image
    },
    {
      "title": "Soul",
      "rating": 8.9,
      "year": "2021",
      "duration": "2h 35m",
      "image": AssetPath.tc3Image
    },
    {
      "title": "Brave",
      "rating": 8.9,
      "year": "2021",
      "duration": "2h 35m",
      "genre": "Action",
      "image": AssetPath.tc4Image
    },
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    final double screenWidth = SizeConfig.screenWidth;
    final int crossAxisCount = 2;
    final double spacing = SizeConfig.ws(16);

    // Figma base design
    final double baseWidth = 158;
    final double baseHeight = 237;
    final double scaleFactor = screenWidth / 375; // base design width
    final double itemWidth = baseWidth * scaleFactor;
    final double itemHeight = baseHeight * scaleFactor;

    // text height approx
    final double textHeight = SizeConfig.hs(40);

    return Scaffold(
      backgroundColor: UiHelper.scaffoldBg,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: AppColors.mainTextColor, size: SizeConfig.ws(20)),
          onPressed: () => Navigator.pop(context),
        ),
        title: UiHelper.customText(
          text: "Top Charts",
          fontsize: SizeConfig.ws(20),
          color: AppColors.mainTextColor,
          fontweight: FontWeight.w600,
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {},
            child: UiHelper.customText(
              text: "Skip",
              fontsize: SizeConfig.ws(14),
              color: AppColors.versionTextColor,
            ),
          )
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {


          return GridView.builder(
            padding: EdgeInsets.all(spacing),
            itemCount: topCharts.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: spacing,
              mainAxisSpacing: spacing,
              childAspectRatio: itemWidth / (itemHeight + textHeight),
            ),
            itemBuilder: (context, index) {
              final movie = topCharts[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(SizeConfig.ws(2)),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>MovieDetailScreen()));
                      },
                      child: Image.asset(
                        movie["image"],
                        width: itemWidth,
                        height: itemHeight,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.hs(8)),
                  UiHelper.customText(
                    text: movie["title"],
                    fontsize: SizeConfig.ws(14),
                    color: AppColors.mainTextColor,
                    fontweight: FontWeight.bold,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: SizeConfig.ws(14)),
                      SizedBox(width: SizeConfig.ws(4)),
                      UiHelper.customText(
                        text: "${movie["rating"]}",
                        fontsize: SizeConfig.ws(12),
                        color: AppColors.versionTextColor,
                      ),
                      SizedBox(width: SizeConfig.ws(10)),
                      UiHelper.customText(
                        text: movie["year"],
                        fontsize: SizeConfig.ws(12),
                        color: AppColors.versionTextColor,
                      ),
                      SizedBox(width: SizeConfig.ws(10)),
                      UiHelper.customText(
                        text: movie["duration"],
                        fontsize: SizeConfig.ws(12),
                        color: AppColors.versionTextColor,
                      ),
                    ],
                  ),

                ],
              );
            },
          );
        },
      ),
    );
  }
}
