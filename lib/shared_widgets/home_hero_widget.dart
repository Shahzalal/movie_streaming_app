import 'package:flutter/material.dart';
import 'package:movie_streaming_app/core/utils/size_config.dart';

import '../core/utils/asset_path.dart';
import '../core/utils/ui_helper.dart';

class HomeHeroWidget extends StatelessWidget {
  const HomeHeroWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Stack(
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
    );
  }
}