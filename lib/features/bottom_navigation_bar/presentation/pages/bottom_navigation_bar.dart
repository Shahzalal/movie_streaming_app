import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_streaming_app/core/theme/app_colors.dart';
import 'package:movie_streaming_app/core/utils/asset_path.dart';
import 'package:movie_streaming_app/core/utils/size_config.dart';
import 'package:movie_streaming_app/features/home/presentation/pages/home_page.dart';
import '../../../navigation/controller/bottom_navigation_controller.dart';

class HomeBottomNavScreen extends StatefulWidget {
  const HomeBottomNavScreen({super.key});

  @override
  State<HomeBottomNavScreen> createState() => _HomeBottomNavScreenState();
}

class _HomeBottomNavScreenState extends State<HomeBottomNavScreen> {
  final BottomNavigationController controller =
  Get.put(BottomNavigationController());

  final List<Widget> screens = [
     HomePage(),
     HomePage(),
     HomePage(),
     HomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Scaffold(
      body: GetBuilder<BottomNavigationController>(
        builder: (_) => screens[controller.selectedIndex],
      ),
      bottomNavigationBar: GetBuilder<BottomNavigationController>(
        builder: (_) {
          return BottomNavigationBar(
            backgroundColor: Colors.black,
            selectedItemColor: AppColors.primaryBlue,
            unselectedItemColor: Colors.grey,
            currentIndex: controller.selectedIndex,
            onTap: (index) => controller.changeIndex(index),
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle: TextStyle(
              fontSize: SizeConfig.ws(12),
              fontWeight: FontWeight.w600,
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: SizeConfig.ws(12),
            ),
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  AssetPath.homeNavImage,
                  height: SizeConfig.ws(24),
                  width: SizeConfig.ws(24),
                  color: controller.selectedIndex == 0
                      ? AppColors.primaryBlue
                      : Colors.grey,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  AssetPath.bookmarkNavImage,
                  height: SizeConfig.ws(24),
                  width: SizeConfig.ws(24),
                  color: controller.selectedIndex == 1
                      ? AppColors.primaryBlue
                      : Colors.grey,
                ),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  AssetPath.searchNavImage,
                  height: SizeConfig.ws(24),
                  width: SizeConfig.ws(24),
                  color: controller.selectedIndex == 2
                      ? AppColors.primaryBlue
                      : Colors.grey,
                ),
                label: 'Category',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  AssetPath.personNavImage,
                  height: SizeConfig.ws(24),
                  width: SizeConfig.ws(24),
                  color: controller.selectedIndex == 3
                      ? AppColors.primaryBlue
                      : Colors.grey,
                ),
                label: 'Profile',
              ),
            ],
          );
        },
      ),
    );
  }
}
