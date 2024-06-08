import 'package:intl/intl.dart';

String dateTimeWithHour({DateTime? dateTime}) {
  final dateFormat = DateFormat('dd MMM HH:mm');
  final String createdAt = dateFormat.format(dateTime ?? DateTime.now());
  return createdAt;
}