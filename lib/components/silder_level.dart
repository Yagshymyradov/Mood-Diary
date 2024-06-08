import 'package:flutter/material.dart';
import 'package:mood_diary/utils/extensions.dart';

import '../utils/theme.dart';
import 'slider_thumb_shape.dart';

class SliderLevel extends StatelessWidget {
  final String title;
  final double valueLvl;
  final String minValue;
  final String maxValue;
  final void Function(double) onChanged;

  const SliderLevel({
    super.key,
    required this.valueLvl,
    required this.onChanged,
    required this.title,
    required this.minValue,
    required this.maxValue,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: textTheme.titleSmall,
          ),
          const SizedBox(height: 20),
          DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(13),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 10.8,
                  color: AppColors.shadowColor,
                  offset: Offset(2, 4),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        6,
                        (index) => SizedBox(
                          width: 2,
                          height: 8,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: AppColors.grey5,
                            ),
                          ),
                        ),
                      ).toList(growable: false),
                    ),
                  ),
                  SliderTheme(
                    data: SliderThemeData(
                      thumbShape: SliderThumbShape(color: valueLvl == 0 ? AppColors.grey5 : null),
                    ),
                    child: Slider(
                      min: -3.5,
                      max: 3.5,
                      inactiveColor: AppColors.grey5,
                      activeColor: valueLvl == 0 ? AppColors.grey5 : AppColors.orange,
                      value: valueLvl,
                      onChanged: (val) => onChanged(val),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          minValue,
                          style: textTheme.bodySmall?.copyWith(color: AppColors.grey2),
                        ),
                        Text(
                          maxValue,
                          style: textTheme.bodySmall?.copyWith(color: AppColors.grey2),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 36),
        ],
      ),
    );
  }
}
