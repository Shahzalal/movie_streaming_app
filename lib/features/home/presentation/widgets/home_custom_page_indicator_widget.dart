import 'package:flutter/material.dart';

import '../../../../core/utils/size_config.dart';

class HomeCustomPageIndicatorWidget extends StatelessWidget {
  const HomeCustomPageIndicatorWidget({
    super.key,
    required this.currentIndex,
    required this.total,
  });

  final int currentIndex;
  final int total;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(total, (index) {
        bool isActive = index == currentIndex;
        return AnimatedContainer(
          duration: Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: 4),
          height: isActive ? SizeConfig.hs(10) : SizeConfig.hs(6),
          width: SizeConfig.ws(6),
          decoration: BoxDecoration(
            color: isActive ? Colors.blue : Colors.grey[700],
            borderRadius: BorderRadius.circular(SizeConfig.ws(20)),
          ),
        );
      }),
    );
  }
}