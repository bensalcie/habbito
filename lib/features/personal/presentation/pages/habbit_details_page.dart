import 'package:flutter/material.dart';
import 'package:habbito/core/common/constants/dimens.dart';
import 'package:habbito/core/common/presentation/widgets/app_textview_large.dart';
import 'package:habbito/core/common/presentation/widgets/app_textview_medium.dart';
import 'package:habbito/core/common/utils/app_utils.dart';
import 'package:habbito/features/personal/data/models/habbit_model.dart';
import 'package:habbito/features/personal/presentation/widgets/create_schedule_dialog.dart';
import 'package:habbito/themes/theme.dart';
import 'package:table_calendar/table_calendar.dart';

class HabbitDetailsPage extends StatefulWidget {
  final HabbitModel habbit;
  const HabbitDetailsPage({super.key, required this.habbit});

  @override
  State<HabbitDetailsPage> createState() => _HabbitDetailsPageState();
}

class _HabbitDetailsPageState extends State<HabbitDetailsPage> {
  DateTime? _startDate;
  DateTime? _endDate;
  DateTime _focusedDay = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const AppTextViewLarge(
            message: 'Habbit Details ',
            textAlign: TextAlign.center,
          ),
        ),
        body: SingleChildScrollView(
            padding: EdgeInsets.zero,
            child: Padding(
                padding: EdgeInsets.zero,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Ink(
                            height: 250,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              image: DecorationImage(
                                alignment: Alignment.center,

                                image: AssetImage(
                                  widget.habbit.localimage ??
                                      'assets/images/header.png',
                                ), // Replace with your image URL
                                fit: BoxFit.cover,

                                colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(
                                      0.5), // Adjust opacity as needed
                                  BlendMode.darken,
                                ),
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 16.0), // Adjust padding as needed
                                child: AppTextViewLarge(
                                  message:
                                      '${(widget.habbit.shouldimprove && (widget.habbit.title.contains('Improve') || widget.habbit.title.contains('Quit'))) ? 'Improve ' : 'Quit '} ${widget.habbit.title}',
                                  textColor: kLightColor,
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: app_padding,
                    ),
                    AppTextViewMedium(
                      weight: FontWeight.w200,
                      fontSize: 13,
                      text:
                          'Please pick a schedule to ${widget.habbit.shouldimprove ? 'Improve' : 'Quit'} your Habbit ',
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(
                      height: app_padding,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(app_padding),
                      child: TableCalendar(
                        firstDay: DateTime.utc(2020, 1, 1),
                        lastDay: DateTime.utc(2030, 12, 31),
                        focusedDay: _focusedDay,
                        selectedDayPredicate: (day) {
                          if (_startDate != null && _endDate != null) {
                            return day.isAfter(_startDate!
                                    .subtract(const Duration(days: 1))) &&
                                day.isBefore(
                                    _endDate!.add(const Duration(days: 1)));
                          }
                          return false;
                        },
                        onDaySelected: (selectedDay, focusedDay) {
                          setState(() {
                            _focusedDay = focusedDay;
                            if (_startDate == null ||
                                (_startDate != null && _endDate != null)) {
                              _startDate = selectedDay;
                              _endDate = null;
                            } else if (_endDate == null) {
                              if (selectedDay.isBefore(_startDate!)) {
                                _startDate = selectedDay;
                              } else {
                                _endDate = selectedDay;
                              }
                            }
                          });

                          _startDate != null &&
                                  _endDate != null &&
                                  _startDate != _endDate
                              ? showBottomSheetForm(
                                  context: context,
                                  view: CreateScheduleDialog(
                                      startDate: _startDate,
                                      endDate: _endDate,
                                      habbit: widget.habbit))
                              : null;
                        },
                        calendarStyle: const CalendarStyle(
                          rangeHighlightColor: Colors.blue,
                          rangeStartDecoration: BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                          ),
                          rangeEndDecoration: BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                          ),
                        ),
                        rangeSelectionMode: RangeSelectionMode.toggledOn,
                        rangeStartDay: _startDate,
                        rangeEndDay: _endDate,
                      ),
                    ),
                  ],
                ))));
  }
}
