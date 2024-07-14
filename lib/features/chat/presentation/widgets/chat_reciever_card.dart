import 'package:flutter/material.dart';
import 'package:habbito/core/common/constants/dimens.dart';
import 'package:habbito/core/common/presentation/widgets/formatted_text_view.dart';

class ChatRecieverCard extends StatelessWidget {
  final String messsage;
  final bool issender;

  const ChatRecieverCard(
      {super.key, required this.messsage, required this.issender});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(app_padding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: FormattedTextView(text: 'Habbito: \n$messsage')
              ),
          Image.asset(
            'assets/images/habbitologo.png',
            height: 35,
            width: 35,
          ),
        ],
      ),
    );
  }
}
