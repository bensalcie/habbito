import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habbito/core/common/presentation/widgets/app_textview_medium.dart';
import 'package:habbito/core/common/utils/app_utils.dart';
import 'package:habbito/features/personal/data/models/habbit_model.dart';
import 'package:habbito/features/personal/presentation/bloc/delete_habbit_bloc.dart';
import 'package:habbito/features/personal/presentation/bloc/get_habbits_bloc.dart';
import 'package:habbito/themes/theme.dart';

class HabbitCard extends StatefulWidget {
  final HabbitModel habbit;

  const HabbitCard({
    super.key,
    required this.habbit,
  });

  @override
  State<HabbitCard> createState() => _HabbitCardState();
}

class _HabbitCardState extends State<HabbitCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          // context.read<HabbitContentBloc>().add(
          //     GetHabbitContent(prompt: 'How to avoid anything ${widget.title}'));

          // GoRouter.of(context)
          //     .go(homepage_to_topic_details_page, extra: 'Avoid ${widget.title}');
        },
        child: Stack(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Ink(
                width: 300,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(
                    image: AssetImage(widget.habbit.localimage ??
                        'assets/images/rain.jpg'), // Replace with your image URL
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.5), // Adjust opacity as needed
                      BlendMode.darken,
                    ),
                  ),
                ),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        bottom: 16.0), // Adjust padding as needed
                    child: AppTextViewMedium(
                      text: widget.habbit.title,
                      textColor: kLightColor,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 15.0,
              right: 15.0,
              child: BlocListener<DeleteHabbitBloc, DeleteHabbitState>(
                listener: (context, state) {
                  if (state is DeleteHabbitSuccess) {
                    showSnackBar(
                        context: context,
                        message: 'Habbit Deleted Successfully',
                        type: SnackBarType.success);
                    context.read<GetHabbitsBloc>().add(const GetHabbits());
                  }
                },
                child: BlocBuilder<DeleteHabbitBloc, DeleteHabbitState>(
                  builder: (context, state) {
                    if (state is DeleteHabbitLoading) {
                      return const Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    }
                    return CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.grey.shade100,
                      child: IconButton(
                        iconSize: 14,
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          context
                              .read<DeleteHabbitBloc>()
                              .add(DeleteHabbit(habbit: widget.habbit));
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ));
  }
}
