import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

DateTime timestampFromJson(int? timestamp) => timestamp == null
    ? DateTime.now()
    : DateTime.fromMillisecondsSinceEpoch(timestamp);

int timestampToJson(DateTime time) => time.millisecondsSinceEpoch;

String dateToString(DateTime dateTime, {String? format}) =>
    DateFormat(format ?? 'HH:mm, MMM d, yyyy').format(dateTime.toLocal());

DateTime timeStringFromJson(String? dateString) => dateString == null
    ? DateTime.now()
    : DateFormat("yyyy-MM-dd HH:mm:ss").parse(dateString, true).toLocal();

TimeOfDay msgSettingsStartEnd(String? hrMinString) {
  final currentTime = DateTime.now();
  if (hrMinString == null) {
    return TimeOfDay(hour: currentTime.hour, minute: currentTime.minute);
  }
  int hr = int.parse(hrMinString.split(':').first);
  int min = int.parse(hrMinString.split(':').last);
  return TimeOfDay(hour: hr, minute: min);
}
