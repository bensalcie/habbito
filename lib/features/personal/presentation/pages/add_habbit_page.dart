import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:habbito/core/common/constants/dimens.dart';
import 'package:habbito/core/common/presentation/widgets/app_button.dart';
import 'package:habbito/core/common/presentation/widgets/app_drop_down_selector.dart';
import 'package:habbito/core/common/presentation/widgets/app_edit_text.dart';
import 'package:habbito/core/common/presentation/widgets/app_textview_large.dart';
import 'package:habbito/core/common/presentation/widgets/app_textview_small_no_tap.dart';
import 'package:habbito/core/common/utils/app_utils.dart';
import 'package:habbito/features/personal/data/models/habbit_model.dart';
import 'package:habbito/features/personal/presentation/bloc/add_habbit_bloc.dart';
import 'package:habbito/features/personal/presentation/bloc/get_habbits_bloc.dart';
import 'package:habbito/features/personal/presentation/widgets/horizontal_image_scroll.dart';
import 'package:habbito/themes/theme.dart';

class AddHabbitPage extends StatefulWidget {
  const AddHabbitPage({super.key});

  @override
  State<AddHabbitPage> createState() => _AddHabbitPageState();
}

class _AddHabbitPageState extends State<AddHabbitPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController slugController = TextEditingController();
  final ValueNotifier<String> callToActionNotifier = ValueNotifier('Improve');

  String? selectedImage;
  bool shouldimprove = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const AppTextViewLarge(
          message: 'Add Habbit',
          textAlign: TextAlign.center,
        ),
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.zero,
          child: Padding(
            padding: const EdgeInsets.all(elements_small_padding),
            child: Column(
              children: [
                const SizedBox(
                  height: app_padding,
                ),
                AppEditText(
                  type: TextInputType.name,
                  autofocus: true,
                  controller: titleController,
                  inputHint: 'e.g Quit Smoking',
                  labelText: 'Short trigger title ',
                ),
                const SizedBox(
                  height: app_padding,
                ),
                AppEditText(
                  type: TextInputType.name,
                  autofocus: true,
                  controller: descriptionController,
                  inputHint: 'e.g I plan to Quit Smoking end of this summer',
                  labelText: 'Habbit Description',
                ),
                const SizedBox(
                  height: app_padding,
                ),
                AppEditText(
                  type: TextInputType.name,
                  autofocus: true,
                  controller: slugController,
                  inputHint: 'e.g I normally smoke often when alone',
                  labelText: 'Anything you want to say (Optional)',
                ),
                const SizedBox(
                  height: app_padding,
                ),
                AppDropDownSelector(
                    textColor: Colors.grey.shade800,
                    dropdownItems: const ['Improve', 'Quit'],
                    title: 'Goal is to: ',
                    onChanged: (newValue) {
                      shouldimprove = newValue == 'Improve';
                    },
                    firstItem: callToActionNotifier),
                const SizedBox(
                  height: app_padding,
                ),
                const AppTextViewSubtitleSmallNoTap(
                    text: 'Add Cover Image (Optional)',
                    textAlign: TextAlign.center),
                const SizedBox(
                  height: app_padding,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: app_large_padding),
                  child: HorizontalImageScroll(
                    onSelectCover: (selectedimage) {
                      selectedImage = selectedimage;
                    },
                  ),
                ),
                const SizedBox(
                  height: app_padding,
                ),
                BlocListener<AddHabbitBloc, AddHabbitState>(
                  listener: (context, state) {
                    if (state is AddHabbitSuccess) {
                      context.read<GetHabbitsBloc>().add(const GetHabbits());

                      showSnackBar(
                          context: context,
                          message: 'Added successfully',
                          type: SnackBarType.success);

                      GoRouter.of(context).pop();
                    }
                  },
                  child: BlocBuilder<AddHabbitBloc, AddHabbitState>(
                    builder: (context, state) {
                      if (state is AddHabbitLoading) {
                        return const Center(
                          child: CircularProgressIndicator.adaptive(),
                        );
                      }
                      return AppButton(
                          buttonIcon: const Icon(
                            CupertinoIcons.calendar_badge_plus,
                            color: Colors.white,
                          ),
                          buttonText: 'Save Habbit',
                          buttonColor: kPrimaryDark,
                          buttonRadius: 16,
                          buttonTextColor: kLightColor,
                          onPressed: () {
                            final title = titleController.text;
                            final description = descriptionController.text;
                            final slug = slugController.text;

                            if (title.isEmpty) {
                              showSnackBar(
                                  context: context,
                                  message: 'Enter valid title',
                                  type: SnackBarType.warning);
                            } else if (description.isEmpty) {
                              showSnackBar(
                                  context: context,
                                  message: 'Enter valid Description',
                                  type: SnackBarType.warning);
                            } else {
                              final habbit = HabbitModel(
                                title: title,
                                description: description,
                                slug: slug,
                                localimage: selectedImage,
                                shouldimprove: shouldimprove,
                              );

                              context
                                  .read<AddHabbitBloc>()
                                  .add(AddHabbit(habbit: habbit));
                            }
                          });
                    },
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
