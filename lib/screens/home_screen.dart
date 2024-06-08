import 'package:flutter/material.dart';
import 'package:mood_diary/screens/widgets/home_tab_bar.dart';
import 'package:mood_diary/utils/assets.dart';
import 'package:mood_diary/utils/extensions.dart';
import 'package:mood_diary/utils/navigation.dart';
import 'package:mood_diary/utils/theme.dart';

import '../components/silder_level.dart';
import '../utils/enums.dart';
import '../utils/helpers.dart';
import 'date_picker_screen/date_picker_screen.dart';
import 'widgets/choose_feels.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final noteController = TextEditingController();
  int selectedTab = 0;
  double stressLvl = 0;
  double selfEsteem = 0;
  Feels? selectedFeel;
  String? selectedFeelList;

  void updateUi() {
    setState(() {
      //no-op
    });
  }

  void onHomeTabBarTap(value) {
    selectedTab = value;
    updateUi();
  }

  void onSelectedFeel(Feels feel) {
    selectedFeel = feel;
    updateUi();
  }

  void onSelectedFeelList(String feelList) {
    selectedFeelList = feelList;
    updateUi();
  }

  void onStressLevelChanged(double value) {
    stressLvl = value;
    updateUi();
  }

  void onSelfEsteemLevelChanged(double value) {
    selfEsteem = value;
    updateUi();
  }

  void onSaveButtonTap() {
    showSnackBar(
      'Все поля и тд обязательны для заполнения',
      backgroundColor: Colors.red,
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    bool fieldsCompleted = selectedFeel != null &&
        selectedFeelList != null &&
        stressLvl != 0 &&
        selfEsteem != 0 &&
        noteController.text.isNotEmpty;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(dateTimeWithHour(), style: textTheme.titleMedium),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () => navigateToScreen(context, const DatePickerScreen()),
              icon: AppIcons.dateTime.svgPicture(),
            ),
          ],
        ),
        body: Column(
          children: [
            HomeTabBar(
              selectedTab: selectedTab,
              onTap: onHomeTabBarTap,
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ListView(
                    children: [
                      const SizedBox(height: 30),
                      ChooseFeels(
                        feel: selectedFeel,
                        onSelectedFeelTap: onSelectedFeel,
                        onSelectedFeelListTap: onSelectedFeelList,
                        selectedFeelList: selectedFeelList,
                      ),
                      const SizedBox(height: 36),
                      SliderLevel(
                        title: 'Уровень стресса?',
                        valueLvl: stressLvl,
                        onChanged: onStressLevelChanged,
                        minValue: 'Низкий',
                        maxValue: 'Высокий',
                      ),
                      SliderLevel(
                        title: 'Самооценка',
                        valueLvl: selfEsteem,
                        onChanged: onSelfEsteemLevelChanged,
                        minValue: 'Неуверенность',
                        maxValue: 'Уверенность',
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'Заметки',
                          style: textTheme.titleSmall,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          maxLines: 4,
                          controller: noteController,
                          onChanged: (val) => updateUi(),
                          decoration: const InputDecoration(
                            hintText: 'Введите заметку',
                          ),
                        ),
                      ),
                      const SizedBox(height: 35),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: ElevatedButton(
                          onPressed: fieldsCompleted ? onSaveButtonTap : null,
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                fieldsCompleted ? AppColors.orange : AppColors.grey4),
                            shadowColor: const MaterialStatePropertyAll(Colors.transparent),
                          ),
                          child: Text(
                            'Сохранить',
                            style: textTheme.bodyMedium?.copyWith(
                              color: fieldsCompleted ? null : AppColors.grey2,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                  Center(
                    child: Text('что угодно', style: textTheme.titleLarge),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
