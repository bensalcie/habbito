import 'package:flutter/material.dart';

class ActionBarTextView extends StatelessWidget {
  final String? text;
  final Function()? onClick;
  const ActionBarTextView(
      {super.key, required this.onClick, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(right: 25),
          child: text != null
              ? Text(
                  text ?? '',
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                )
              : const SizedBox.shrink(),
        ),
      ),
    );
  }
}
