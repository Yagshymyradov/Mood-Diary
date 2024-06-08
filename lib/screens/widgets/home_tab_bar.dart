import 'package:flutter/material.dart';

import '../../utils/assets.dart';
import '../../utils/theme.dart';

class HomeTabBar extends StatelessWidget {
  final int selectedTab;
  final void Function(int) onTap;

  const HomeTabBar({
    super.key,
    required this.selectedTab,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(47),
          color: AppColors.grey4,
        ),
        child: TabBar(
          onTap: onTap,
          splashBorderRadius: BorderRadius.circular(47),
          indicator: const BoxDecoration(),
          indicatorWeight: 0,
          tabs: [
            DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(47),
                color: selectedTab == 0 ? AppColors.orange : AppColors.grey4,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 9),
                child: Row(
                  children: [
                    AppIcons.book.svgPicture(
                      color: selectedTab == 0 ? AppColors.white : AppColors.grey2,
                    ),
                    const SizedBox(width: 6),
                    const Text('Дневник настроения'),
                  ],
                ),
              ),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(47),
                color: selectedTab == 1 ? AppColors.orange : AppColors.grey4,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 9),
                child: Row(
                  children: [
                    AppIcons.statistic.svgPicture(
                      color: selectedTab == 1 ? AppColors.white : AppColors.grey2,
                    ),
                    const SizedBox(width: 6),
                    const Text('Статистика'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
