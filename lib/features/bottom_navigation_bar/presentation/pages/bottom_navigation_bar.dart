import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_streaming_app/core/theme/app_colors.dart';
import 'package:movie_streaming_app/core/utils/asset_path.dart';
import 'package:movie_streaming_app/core/utils/size_config.dart';
import 'package:movie_streaming_app/core/utils/ui_helper.dart';
import 'package:movie_streaming_app/features/home/presentation/pages/home_page.dart';
import '../../../getx/controller/bottom_navigation_controller.dart';


class HomeBottomNavScreen extends StatefulWidget {
  const HomeBottomNavScreen({super.key});

  @override
  State<HomeBottomNavScreen> createState() => _HomeBottomNavScreenState();
}

class _HomeBottomNavScreenState extends State<HomeBottomNavScreen> {
  final BottomNavigationController navController = Get.put(BottomNavigationController());

  final List<Widget> screens = [
    HomePage(),
    HomePage(),
    HomePage(),
    HomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return GetBuilder<BottomNavigationController>(
      builder: (navController) {
        return Scaffold(
          body: screens[navController.selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: UiHelper.scaffoldBg,
            selectedItemColor: AppColors.primaryBlue,
            unselectedItemColor: Colors.grey,
            currentIndex: navController.selectedIndex,
            onTap: navController.changeIndex,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  AssetPath.homeNavImage,
                  color: navController.selectedIndex == 0
                      ? AppColors.primaryBlue
                      : Colors.grey,
                  height: SizeConfig.ws(24),
                  width: SizeConfig.ws(24),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  AssetPath.bookmarkNavImage,
                  color: navController.selectedIndex == 1
                      ? AppColors.primaryBlue
                      : Colors.grey,
                  height: SizeConfig.ws(24),
                  width: SizeConfig.ws(24),
                ),
                label: 'WatchList',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  AssetPath.searchNavImage,
                  color: navController.selectedIndex == 2
                      ? AppColors.primaryBlue
                      : Colors.grey,
                  height: SizeConfig.ws(24),
                  width: SizeConfig.ws(24),
                ),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  AssetPath.personNavImage,
                  color: navController.selectedIndex == 3
                      ? AppColors.primaryBlue
                      : Colors.grey,
                  height: SizeConfig.ws(24),
                  width: SizeConfig.ws(24),
                ),
                label: 'Account',
              ),
            ],
          ),
        );
      },
    );
  }
}


