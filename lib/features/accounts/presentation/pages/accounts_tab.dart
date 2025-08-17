import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../core/utils/ui_helper.dart';
import '../../../getx/controller/account_controller.dart';
import '../../../getx/controller/bottom_navigation_controller.dart';

class AccountTab extends StatelessWidget {
  final accountController = Get.put(AccountController());
  final navController = Get.find<BottomNavigationController>();

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Scaffold(
      backgroundColor: UiHelper.scaffoldBg,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            navController.changeIndex(0);
          },
        ),
        title: UiHelper.customText(
          text: "Account",
          fontsize: SizeConfig.fs(20),
          color: Colors.white,
          fontweight: FontWeight.bold,
        ),
        centerTitle: true,
      ),
      body: GetBuilder<AccountController>(
        builder: (controller) {
          final account = controller.account;

          return SingleChildScrollView(
            padding: EdgeInsets.all(SizeConfig.ws(16)),
            child: Column(
              children: [
                GetBuilder<AccountController>(
                  builder: (controller) {
                    final account = controller.account;
                    return Card(
                      color: Colors.grey[900],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(SizeConfig.ws(12)),
                      ),
                      elevation: 3,
                      child: Padding(
                        padding: EdgeInsets.all(SizeConfig.ws(12)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            UiHelper.customText(
                              text: "Favorite Movies",
                              fontsize: SizeConfig.fs(18),
                              fontweight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            Divider(color: Colors.grey),
                            if (account.favoriteMovies.isEmpty)
                              UiHelper.customText(
                                text: "No favorite movies yet",
                                fontsize: SizeConfig.fs(14),
                                color: Colors.grey,
                              ),
                            ...account.favoriteMovies.map(
                              (movie) => ListTile(
                                title: UiHelper.customText(
                                  text: movie,
                                  fontsize: SizeConfig.fs(14),
                                  color: Colors.white,
                                ),
                                trailing: IconButton(
                                  icon: Icon(Icons.delete, color: Colors.red),
                                  onPressed: () =>
                                      controller.removeFavorite(movie),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),

                SizedBox(height: SizeConfig.hs(16)),

                Card(
                  color: Colors.grey[900],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(SizeConfig.ws(12)),
                  ),
                  elevation: 3,
                  child: Padding(
                    padding: EdgeInsets.all(SizeConfig.ws(12)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        UiHelper.customText(
                          text: "Downloads",
                          fontsize: SizeConfig.fs(18),
                          fontweight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        Divider(color: Colors.grey),
                        ...account.downloads.map(
                          (movie) => ListTile(
                            title: UiHelper.customText(
                              text: movie,
                              fontsize: SizeConfig.fs(14),
                              color: Colors.white,
                            ),
                            trailing: IconButton(
                              icon: Icon(Icons.delete, color: Colors.red),
                              onPressed: () => controller.removeDownload(movie),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: SizeConfig.hs(16)),

                Card(
                  color: Colors.grey[900],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(SizeConfig.ws(12)),
                  ),
                  elevation: 3,
                  child: Padding(
                    padding: EdgeInsets.all(SizeConfig.ws(12)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        UiHelper.customText(
                          text: "Selected Genres",
                          fontsize: SizeConfig.fs(18),
                          fontweight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        Divider(color: Colors.grey),
                        Wrap(
                          spacing: SizeConfig.ws(8),
                          children: ["Action", "Sci-Fi", "Drama", "Comedy"].map(
                            (genre) {
                              final isSelected = account.selectedGenres
                                  .contains(genre);
                              return ChoiceChip(
                                label: UiHelper.customText(
                                  text: genre,
                                  fontsize: SizeConfig.fs(14),
                                  color: isSelected
                                      ? Colors.white
                                      : Colors.grey[400],
                                ),
                                selected: isSelected,
                                selectedColor: Colors.blue,
                                backgroundColor: Colors.grey[800],
                                onSelected: (_) =>
                                    controller.toggleGenre(genre),
                              );
                            },
                          ).toList(),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: SizeConfig.hs(16)),
                Card(
                  color: Colors.grey[900],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(SizeConfig.ws(12)),
                  ),
                  elevation: 3,
                  child: Padding(
                    padding: EdgeInsets.all(SizeConfig.ws(12)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        UiHelper.customText(
                          text: "Subscription Status",
                          fontsize: SizeConfig.fs(18),
                          fontweight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        Switch(
                          value: account.isSubscribed,
                          activeColor: Colors.blue,
                          onChanged: (_) => controller.toggleSubscription(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
