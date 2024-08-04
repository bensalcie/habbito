import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:habbito/core/common/constants/dimens.dart';
import 'package:habbito/core/common/constants/routes.dart';
import 'package:habbito/core/common/presentation/widgets/app_button.dart';
import 'package:habbito/core/common/presentation/widgets/app_textview_large.dart';
import 'package:habbito/core/common/presentation/widgets/app_textview_small_no_tap.dart';
import 'package:habbito/core/common/presentation/widgets/app_textview_subtitle.dart';
import 'package:habbito/core/common/utils/app_utils.dart';
import 'package:habbito/features/personal/presentation/bloc/get_habbits_bloc.dart';
import 'package:habbito/features/personal/presentation/bloc/local_auth_bloc.dart';
import 'package:habbito/features/personal/presentation/widgets/habbit_card.dart';
import 'package:habbito/themes/theme.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PersonalPage extends StatefulWidget {
  const PersonalPage({super.key});

  @override
  State<PersonalPage> createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {
  List<_SalesData> data = [
    _SalesData('Jan', 35),
    _SalesData('Feb', 28),
    _SalesData('Mar', 34),
    _SalesData('Apr', 32),
    _SalesData('May', 40)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const AppTextViewLarge(
          message: 'Personal Space',
          textAlign: TextAlign.center,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: Padding(
            padding: const EdgeInsets.all(elements_small_padding),
            child: BlocListener<LocalAuthBloc, LocalAuthState>(
              listener: (context, state) {
                if (state is LocalAuthFailed) {
                  showSnackBar(
                      context: context,
                      message: 'Unable to Authenticate ${state.errorMessage}',
                      type: SnackBarType.warning);
                }
              },
              child: BlocBuilder<LocalAuthBloc, LocalAuthState>(
                builder: (context, state) {
                  if (state is LocalAuthLoading) {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  }

                  if (state is LocalAuthSuccess) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset('assets/images/header.png'),
                        const SizedBox(
                          height: app_large_padding,
                        ),

                        BlocBuilder<GetHabbitsBloc, GetHabbitsState>(
                          builder: (context, state) {
                            if (state is GetHabbitsSuccess) {
                              final habbits = state.habbits;
                              return habbits.isNotEmpty
                                  ? SizedBox(
                                      height: 200,
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemCount: habbits.length,
                                        itemBuilder: (context, index) {
                                          return HabbitCard(
                                            habbit: habbits[index],
                                          );
                                        },
                                      ),
                                    )
                                  : const SizedBox.shrink();
                            }

                            return const SizedBox.shrink();
                          },
                        ),

                        //Initialize the chart widget
                        SizedBox(
                          height: 400,
                          child: SfCartesianChart(
                              primaryXAxis: const CategoryAxis(),
                              // Chart title
                              title: const ChartTitle(
                                  text: 'Smoking habbit Quit target'),
                              // Enable legend
                              legend: const Legend(isVisible: true),
                              // Enable tooltip
                              tooltipBehavior: TooltipBehavior(enable: true),
                              series: <CartesianSeries<_SalesData, String>>[
                                LineSeries<_SalesData, String>(
                                    dataSource: data,
                                    xValueMapper: (_SalesData sales, _) =>
                                        sales.year,
                                    yValueMapper: (_SalesData sales, _) =>
                                        sales.sales,
                                    name: 'Smoking Quit',
                                    // Enable data label
                                    dataLabelSettings: const DataLabelSettings(
                                        isVisible: true))
                              ]),
                        ),
                        const SizedBox(
                          height: app_large_padding,
                        ),
                        //Initialize the chart widget
                        SizedBox(
                          height: 400,
                          child: SfCartesianChart(
                              primaryXAxis: const CategoryAxis(),
                              // Chart title
                              title: const ChartTitle(
                                  text: 'Smoking habbit Quit target'),
                              // Enable legend
                              legend: const Legend(isVisible: true),
                              // Enable tooltip
                              tooltipBehavior: TooltipBehavior(enable: true),
                              series: <CartesianSeries<_SalesData, String>>[
                                LineSeries<_SalesData, String>(
                                    dataSource: data,
                                    xValueMapper: (_SalesData sales, _) =>
                                        sales.year,
                                    yValueMapper: (_SalesData sales, _) =>
                                        sales.sales,
                                    name: 'Gambling Quit',
                                    // Enable data label
                                    dataLabelSettings: const DataLabelSettings(
                                        isVisible: true))
                              ]),
                        ),
                      ],
                    );
                  }

                  return Column(
                    children: [
                      Image.asset('assets/images/header.png'),
                      const SizedBox(
                        height: elements_large_padding,
                      ),
                      const AppTextViewSubtitle(
                          weight: FontWeight.w100,
                          padding: elements_large_padding,
                          text:
                              'Curious of what appears on this page?\n\nHere you will track your own Habbits, Analyse them, Get insigts, Get daily reminder and quit the bad habbits over time.',
                          textAlign: TextAlign.center),
                      const SizedBox(
                        height: elements_large_padding,
                      ),
                      const SizedBox(
                        height: elements_large_padding,
                      ),
                      const AppTextViewSubtitleSmallNoTap(
                          weight: FontWeight.w700,
                          padding: elements_large_padding,
                          text:
                              'Please Authenticate yourself to access this page',
                          textAlign: TextAlign.justify),
                      const SizedBox(
                        height: elements_padding,
                      ),
                      AppButton(
                          buttonIcon: const Icon(
                            Icons.fingerprint,
                            color: Colors.white,
                          ),
                          buttonText: 'Authenticate',
                          buttonColor: kPrimaryDark,
                          buttonRadius: 16,
                          buttonTextColor: kLightColor,
                          onPressed: () {
                            context
                                .read<LocalAuthBloc>()
                                .add(const VerifyUser());
                          }),
                    ],
                  );
                },
              ),
            )),
      ),
      floatingActionButton: BlocBuilder<LocalAuthBloc, LocalAuthState>(
        builder: (context, state) {
          if (state is LocalAuthSuccess) {
            return FloatingActionButton.extended(
              onPressed: () {
                GoRouter.of(context).go(personal_to_add_habbit_page);
              },
              icon: const Icon(CupertinoIcons.calendar_badge_plus),
              label: const AppTextViewSubtitleSmallNoTap(
                  padding: 0, text: 'Add Habbit', textAlign: TextAlign.center),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
