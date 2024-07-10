import 'package:flutter/material.dart';
import 'package:habbito/core/common/presentation/widgets/app_textview_medium.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: AppTextViewMedium(
          text: 'Ben Salcie',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
