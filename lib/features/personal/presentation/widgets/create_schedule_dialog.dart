import 'package:flutter/material.dart';
import 'package:habbito/core/common/constants/dimens.dart';
import 'package:habbito/core/common/presentation/widgets/app_button.dart';
import 'package:habbito/core/common/presentation/widgets/app_textview_large.dart';
import 'package:habbito/core/common/presentation/widgets/app_textview_medium.dart';
import 'package:habbito/core/common/utils/app_utils.dart';
import 'package:habbito/features/personal/data/models/habbit_model.dart';
import 'package:habbito/themes/theme.dart';

class CreateScheduleDialog extends StatelessWidget {
  const CreateScheduleDialog({
    super.key,
    required DateTime? startDate,
    required DateTime? endDate,
    required this.habbit,
  })  : _startDate = startDate,
        _endDate = endDate;

  final DateTime? _startDate;
  final DateTime? _endDate;
  final HabbitModel habbit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.35,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: app_padding,
          ),
          const AppTextViewLarge(
            message: 'Creating a habbit schedule',
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: app_padding,
          ),
          AppTextViewMedium(
            weight: FontWeight.w300,
            fontSize: 15,
            text:
                'You have selected a schedule to  ${habbit.shouldimprove ? 'Improve' : 'Quit'} your Habbit  \nfrom ${convertDateTime(_startDate!.toLocal().toString())} \nto ${convertDateTime(_endDate!.toLocal().toString())} \n',
            textAlign: TextAlign.start,
          ),
          const SizedBox(
            height: app_padding,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: AppButton(
                  buttonText: 'Cancel',
                  buttonColor: Colors.grey.shade400,
                  buttonRadius: 16,
                  buttonTextColor: kLightColor,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: AppButton(
                  buttonText: 'Accept',
                  buttonColor: kPrimaryDark,
                  buttonRadius: 16,
                  buttonTextColor: kLightColor,
                  onPressed: () {},
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
