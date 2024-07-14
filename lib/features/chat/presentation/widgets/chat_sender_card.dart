import 'package:flutter/material.dart';
import 'package:habbito/core/common/constants/dimens.dart';
import 'package:habbito/core/common/presentation/widgets/formatted_text_view.dart';

class ChatSenderCard extends StatelessWidget {
  final String messsage;
  final bool issender;

  const ChatSenderCard(
      {super.key, required this.messsage, required this.issender});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(app_padding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/person.png',
            height: 35,
            width: 35,
          ),
          const SizedBox(
            width: elements_padding,
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(top: elements_small_padding),
            child: FormattedTextView(text: 'Me:\n$messsage'),
          ))
        ],
      ),
    );
  }
}
