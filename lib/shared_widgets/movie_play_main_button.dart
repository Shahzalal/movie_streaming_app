// import 'package:flutter/material.dart';
// import 'package:movie_streaming_app/shared_widgets/toast_helper.dart';
//
// import '../core/theme/app_colors.dart';
// import '../core/utils/size_config.dart';
// import '../core/utils/ui_helper.dart';
// import 'package:get/get.dart';
//
// import '../features/getx/controller/account_controller.dart';
//
// class MoviePlayButtonWidget extends StatelessWidget {
//   MoviePlayButtonWidget({
//     super.key, this.onTap, required this.title,
//   });
//   final VoidCallback? onTap;
//   final String title;
//
//   final controller = Get.put(AccountController());
//
//   @override
//   Widget build(BuildContext context) {
//     SizeConfig.init(context);
//     return Row(
//       children: [
//         Expanded(
//           child: ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               backgroundColor: AppColors.primaryBlue,
//               padding: EdgeInsets.symmetric(
//                 vertical: SizeConfig.hs(12),
//               ),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(
//                   SizeConfig.ws(8),
//                 ),
//               ),
//             ),
//             onPressed: onTap,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(
//                   Icons.play_circle_fill,
//                   color: Colors.white,
//                   size: SizeConfig.ws(20),
//                 ),
//                 SizedBox(width: SizeConfig.ws(8)),
//                 UiHelper.customText(
//                   text: title,
//                   fontsize: SizeConfig.ws(16),
//                   color: Colors.white,
//                   fontweight: FontWeight.w500,
//                 ),
//               ],
//             ),
//           ),
//         ),
//         SizedBox(width: SizeConfig.ws(10)),
//         Container(
//           width: SizeConfig.ws(48),
//           height: SizeConfig.ws(48),
//           decoration: BoxDecoration(
//             color: const Color(0xFF282828),
//             borderRadius: BorderRadius.circular(
//               SizeConfig.ws(8),
//             ),
//           ),
//           child: GetBuilder<AccountController>(
//             builder: (controller) {
//               final isFavorite = controller.account.favoriteMovies.contains(title);
//               return IconButton(
//                 icon: Icon(
//                   isFavorite ? Icons.bookmark : Icons.bookmark_border,
//                   color: Colors.white,
//                   size: SizeConfig.ws(22),
//                 ),
//                 onPressed: () {
//                   if (isFavorite) {
//                     controller.removeFavorite(title);
//                     ToastHelper.showWarning("$title removed from favorites");
//                   } else {
//                     controller.addFavorite(title);
//                     ToastHelper.showSuccess("$title added to favorites");
//                   }
//                 },
//               );
//             },
//           ),
//         )
//         ,
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_streaming_app/shared_widgets/toast_helper.dart';

import '../core/theme/app_colors.dart';
import '../core/utils/size_config.dart';
import '../core/utils/ui_helper.dart';
import '../features/getx/controller/account_controller.dart';

class MoviePlayButtonWidget extends StatelessWidget {
  MoviePlayButtonWidget({
    super.key,
    this.onTap,
    required this.title,
     this.movieTitle,
  });

  final VoidCallback? onTap;
  final String title;
  final String? movieTitle;

  final controller = Get.put(AccountController());

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryBlue,
              padding: EdgeInsets.symmetric(
                vertical: SizeConfig.hs(12),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(SizeConfig.ws(8)),
              ),
            ),
            onPressed: onTap,
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
                  text: title,
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
            borderRadius: BorderRadius.circular(SizeConfig.ws(8)),
          ),
          child: GetBuilder<AccountController>(
            builder: (controller) {
              final isFavorite = controller.account.favoriteMovies.contains(movieTitle);
              return IconButton(
                icon: Icon(
                  isFavorite ? Icons.bookmark : Icons.bookmark_border,
                  color: Colors.white,
                  size: SizeConfig.ws(22),
                ),
                onPressed: () {
                  if (movieTitle != null) {
                    if (isFavorite) {
                      controller.removeFavorite(movieTitle!);
                      ToastHelper.showWarning("$movieTitle removed from favorites");
                    } else {
                      controller.addFavorite(movieTitle!);
                      ToastHelper.showSuccess("$movieTitle added to favorites");
                    }
                  }
                },

              );
            },
          ),
        ),
      ],
    );
  }
}
