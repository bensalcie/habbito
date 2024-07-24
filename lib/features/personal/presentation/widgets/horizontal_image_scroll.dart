import 'package:flutter/material.dart';
import 'package:habbito/themes/theme.dart';

class HorizontalImageScroll extends StatelessWidget {
  static const double appPadding = 16.0;
  static const double borderRadius = 20.0;

  final Function(String selectedimage) onSelectCover;

  static const List<String> imagePaths = [
    'assets/images/blue.png',
    'assets/images/color.jpg',
    'assets/images/green.png',
    'assets/images/rain.jpg',
    'assets/images/wav.png',
  ];

  final SelectionNotifier selectionNotifier = SelectionNotifier();

  HorizontalImageScroll({super.key, required this.onSelectCover});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int?>(
      valueListenable: selectionNotifier,
      builder: (context, selectedIndex, child) {
        return SizedBox(
          height: 200,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: imagePaths.length,
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemBuilder: (context, index) {
                final isSelected = selectedIndex == index;

                return Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        selectionNotifier.select(index);
                        onSelectCover(imagePaths[index]);
                      },
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(borderRadius),
                            child: Image.asset(
                              imagePaths[index],
                              fit: BoxFit.cover,
                              height: 200,
                              width: 300,
                            ),
                          ),
                          if (isSelected)
                            Positioned(
                              top: 8,
                              right: 8,
                              child: Icon(
                                Icons.check_circle,
                                color: kPrimaryDark,
                                size: 30,
                              ),
                            ),
                        ],
                      ),
                    ),
                    if (index <
                        imagePaths.length -
                            1) // Add padding only between images
                      const SizedBox(width: appPadding),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class SelectionNotifier extends ValueNotifier<int?> {
  SelectionNotifier() : super(null);

  void select(int index) {
    value = index;
  }
}
