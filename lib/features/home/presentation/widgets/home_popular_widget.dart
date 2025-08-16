import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../core/utils/ui_helper.dart';
import '../../../../domain/networks/popular_star_provider.dart';
import '../../../getx/controller/popular_star_controller.dart';

class PopularStarWidget extends StatelessWidget {
  PopularStarWidget({super.key});

  final controller = Get.put(PopularStarController(PopularStarProvider()));

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return GetBuilder<PopularStarController>(
      builder: (controller) {
        if (controller.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        return SizedBox(
          height: SizeConfig.hs(195),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: SizeConfig.ws(16)),
            itemCount: controller.stars.length,
            itemBuilder: (context, index) {
              final actor = controller.stars[index];
              double imageSize = SizeConfig.ws(90);

              return Container(
                width: SizeConfig.ws(100),
                margin: EdgeInsets.only(right: SizeConfig.ws(10)),
                child: Column(
                  children: [
                    /// Image
                    Container(
                      height: imageSize,
                      width: imageSize,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(SizeConfig.ws(2)),
                        image: DecorationImage(
                          image: AssetImage(actor.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: SizeConfig.hs(8)),

                    /// Name
                    UiHelper.customText(
                      text: actor.title,
                      fontsize: SizeConfig.ws(14),
                      color: AppColors.mainTextColor,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
