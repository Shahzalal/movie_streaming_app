import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../core/utils/ui_helper.dart';

class MovieDescriptionSheet extends StatelessWidget {
  const MovieDescriptionSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.655,
      minChildSize: 0.4,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          padding: EdgeInsets.symmetric(
            vertical: SizeConfig.hs(20),
            horizontal: SizeConfig.ws(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: SizeConfig.ws(40),
                    height: SizeConfig.hs(4),
                    decoration: BoxDecoration(
                      color: Colors.grey[600],
                      borderRadius: BorderRadius.circular(SizeConfig.ws(2)),
                    ),
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.hs(16)),

              UiHelper.customText(
                text: 'Rogue One: A Star Wars',
                fontsize: SizeConfig.ws(24),
                fontweight: FontWeight.bold,
                color: AppColors.mainTextColor,
                maxLines: 2,
              ),
              UiHelper.customText(
                text: 'Story',
                fontsize: SizeConfig.ws(24),
                fontweight: FontWeight.bold,
                color: AppColors.mainTextColor,
                maxLines: 2,
              ),
              SizedBox(height: SizeConfig.hs(12)),
              UiHelper.customText(
                text:
                    'A Star Wars Story itself focuses on the Rebel Alliance which recruits '
                    'Jyn Erso (Felicity Jones) after the formation of the Galaxy earning '
                    'his living. Told there is a woman named Jyn Erso (Felicity Jones).\n\n'
                    'A rebel soldier and criminal is about to face his greatest challenge '
                    'when Mon Mothma (Genevieve O\'Reilly) sends him on a dangerous mission. '
                    'Jyn is tasked with stealing the plans for the Death Star, the Empire\'s '
                    'weapon of mass destruction that could destroy a planet.\n\n'
                    'With the help of rebel strongholds, swordsmen, and other troops, Jyn will '
                    'become part of something very big she never thought of before.',
                fontsize: SizeConfig.ws(14),
                color: AppColors.bodyTextColor,
                maxLines: 50,
              ),
            ],
          ),
        );
      },
    );
  }
}
