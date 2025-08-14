import 'package:flutter/material.dart';
import 'package:movie_streaming_app/core/utils/asset_path.dart';
import 'package:movie_streaming_app/core/utils/size_config.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/ui_helper.dart';
import '../../../bottom_navigation_bar/presentation/pages/bottom_navigation_bar.dart';

class GenreSelectionScreen extends StatefulWidget {
  const GenreSelectionScreen({super.key});

  @override
  State<GenreSelectionScreen> createState() => _GenreSelectionScreenState();
}

class _GenreSelectionScreenState extends State<GenreSelectionScreen> {
  final List<Map<String, dynamic>> genres = [
    {"name": "Action", "likes": 4324, "image": AssetPath.personalizationOneImage},
    {"name": "Adventure", "likes": 2592, "image": AssetPath.personalizationTwoImage},
    {"name": "Comedy", "likes": 920, "image": AssetPath.personalizationThreeImage},
    {"name": "Drama", "likes": 1423, "image": AssetPath.personalizationFourImage},
    {"name": "Sci-Fi", "likes": 3110, "image": AssetPath.personalizationOneImage},
    {"name": "Fantasy", "likes": 2780, "image": AssetPath.personalizationTwoImage},
  ];

  final List<int> selectedGenres = [];
  final int maxSelection = 6;

  void toggleSelection(int index) {
    setState(() {
      if (selectedGenres.contains(index)) {
        selectedGenres.remove(index);
      } else {
        if (selectedGenres.length < maxSelection) {
          selectedGenres.add(index);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("You can only select 6 genres."),
              duration: Duration(seconds: 1),
            ),
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    final crossAxisCount = SizeConfig.screenWidth > 600 ? 4 : 2;

    return Scaffold(
      backgroundColor: UiHelper.scaffoldBg,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: SizeConfig.ws(20)),
          onPressed: () {},
        ),
        title: UiHelper.customText(
          text: "Personalization",
          fontsize: SizeConfig.ws(20),

          color: Colors.white,
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
      body: Padding(
        padding: EdgeInsets.all(SizeConfig.ws(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                UiHelper.customText(
                  text: "Choose your genre",
                  fontsize: SizeConfig.ws(16),
                  color: Colors.white,
                  fontweight: FontWeight.w500,
                ),
                UiHelper.customText(
                  text: "${selectedGenres.length} from $maxSelection",
                  fontsize: SizeConfig.ws(14),
                  color: AppColors.primaryBlue,
                ),
              ],
            ),
            SizedBox(height: SizeConfig.hs(16)),
            Expanded(
              child: GridView.builder(
                itemCount: genres.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: SizeConfig.ws(12),
                  mainAxisSpacing: SizeConfig.hs(12),
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (context, index) {
                  final genre = genres[index];
                  final isSelected = selectedGenres.contains(index);

                  return GestureDetector(
                    onTap: () => toggleSelection(index),
                    child: Stack(
                      children: [
                        Container(
                          height: SizeConfig.hs(140),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(SizeConfig.ws(8)),
                            border: Border.all(
                              color: isSelected
                                  ? AppColors.primaryBlue
                                  : Colors.transparent,
                              width: SizeConfig.ws(2),
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(SizeConfig.ws(6)),
                            child: Image.asset(
                              genre["image"],
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                        ),
                        if (isSelected)
                          Positioned(
                            top: SizeConfig.hs(8),
                            right: SizeConfig.ws(8),
                            child: Container(
                              decoration: const BoxDecoration(
                                color: AppColors.primaryBlue,
                                shape: BoxShape.circle,
                              ),
                              padding: EdgeInsets.all(SizeConfig.ws(4)),
                              child: Icon(
                                Icons.check,
                                color: Colors.white,
                                size: SizeConfig.ws(16),
                              ),
                            ),
                          ),
                        Positioned(
                          bottom: SizeConfig.hs(8),
                          left: SizeConfig.ws(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              UiHelper.customText(
                                text: genre["name"],
                                fontsize: SizeConfig.ws(16),
                                color: Colors.white,
                                fontweight: FontWeight.bold,
                              ),
                              Row(
                                children: [
                                  Icon(Icons.people,
                                      color: Colors.white70, size: SizeConfig.ws(14)),
                                  SizedBox(width: SizeConfig.ws(4)),
                                  UiHelper.customText(
                                    text: "${genre["likes"]} like this",
                                    fontsize: SizeConfig.ws(12),
                                    color: Colors.white70,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: SizeConfig.hs(12)),
            SafeArea(
              top: false,
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: selectedGenres.isEmpty ? null : () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeBottomNavScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedGenres.isEmpty
                        ? Colors.grey[800]
                        : AppColors.primaryBlue,
                    padding: EdgeInsets.symmetric(vertical: SizeConfig.hs(14)),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(SizeConfig.ws(8))),
                  ),
                  child: UiHelper.customText(
                    text: "Continue",
                    fontsize: SizeConfig.ws(14),
                    color: Colors.white,
                    fontweight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
