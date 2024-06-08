import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mood_diary/utils/extensions.dart';
import 'package:mood_diary/utils/theme.dart';
import 'package:paged_vertical_calendar/paged_vertical_calendar.dart';

class DatePickerScreen extends StatefulWidget {
  const DatePickerScreen({super.key});

  @override
  State<DatePickerScreen> createState() => _DatePickerScreenState();
}

class _DatePickerScreenState extends State<DatePickerScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return Scaffold(
      appBar: AppBar(
          surfaceTintColor: AppColors.white,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.close,
              color: AppColors.grey2,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Сегодня',
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          ],
          bottom: PreferredSize(
            preferredSize: const Size(double.infinity, 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                weekText('ПН'),
                weekText('Вт'),
                weekText('СР'),
                weekText('ЧТ'),
                weekText('ПТ'),
                weekText('СБ'),
                weekText('ВС'),
              ],
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: PagedVerticalCalendar(
          monthBuilder: (context, month, year) {
            return Align(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: DateFormat('yyyy').format(DateTime(year, month)),
                      style: textTheme.titleMedium?.copyWith(fontSize: 16),
                    ),
                    TextSpan(
                      text: '\n${DateFormat('MMMM', 'ru').format(DateTime(year, month))}',
                      style: textTheme.displayMedium,
                    ),
                  ],
                ),
              ),
            );
          },
          dayBuilder: (context, date) {
            final currentDate = DateTime.now();
            final currentDay = date.day == currentDate.day && date.month == currentDate.month &&
                date.year == currentDate.year;

            return DecoratedBox(
              decoration: BoxDecoration(
                color: currentDay ? AppColors.orange.withOpacity(0.25) : null,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text(
                      DateFormat('d').format(date),
                      style: textTheme.displaySmall,
                    ),
                    if(currentDay)
                    const SizedBox(
                      width: 5,
                      height: 5,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.orange
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget weekText(String text) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Text(
        text,
        style: Theme
            .of(context)
            .textTheme
            .headlineSmall,
      ),
    );
  }
}
