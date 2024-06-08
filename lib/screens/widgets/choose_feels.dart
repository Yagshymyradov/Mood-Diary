import 'package:flutter/material.dart';
import 'package:mood_diary/utils/extensions.dart';

import '../../utils/assets.dart';
import '../../utils/enums.dart';
import '../../utils/theme.dart';

List<String> feelsList = [
  'Возбуждение',
  'Восторг',
  'Наслаждение',
  'Очарование',
  'Осознанность',
  'Смелость',
  'Удовольствие',
  'Чувственность',
  'Энергичность',
  'Экстравагантность',
];

class ChooseFeels extends StatelessWidget {
  final Feels? feel;
  final String? selectedFeelList;
  final void Function(String) onSelectedFeelListTap;
  final void Function(Feels) onSelectedFeelTap;

  const ChooseFeels({
    super.key,
    this.feel,
    this.selectedFeelList,
    required this.onSelectedFeelListTap,
    required this.onSelectedFeelTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Что чувствуешь?',
            style: textTheme.titleSmall,
          ),
        ),
        const SizedBox(height: 20),
        SingleChildScrollView(
          padding: const EdgeInsets.only(left: 20),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: Feels.values
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Material(
                      borderRadius: BorderRadius.circular(76),
                      color: Colors.white,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(76),
                        onTap: () => onSelectedFeelTap(e),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(76),
                            color: AppColors.white,
                            border: Border.all(
                              color: feel == e ? AppColors.orange : Colors.transparent,
                              width: 2,
                            ),
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 10.8,
                                color: AppColors.shadowColor,
                                offset: Offset(2, 4),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 23,
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  width: 53,
                                  height: 50,
                                  child: AppIcons.force.pngPicture,
                                ),
                                Text('data', style: textTheme.bodySmall),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
                .toList(growable: false),
          ),
        ),
        if (feel != null) ...[
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Wrap(
              runSpacing: 8,
              spacing: 8,
              children: feelsList
                  .map(
                    (e) => InkWell(
                      onTap: ()=> onSelectedFeelListTap(e),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: selectedFeelList == e ? AppColors.orange : AppColors.white,
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 10,
                              offset: Offset(2, 4),
                              color: AppColors.shadowColor,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                          child: Text(
                            e,
                            style: textTheme.bodySmall?.copyWith(
                              color: selectedFeelList == e ? AppColors.white : null,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(growable: false),
            ),
          )
        ],
      ],
    );
  }
}
