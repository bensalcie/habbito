import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habbito/core/common/presentation/widgets/app_edit_text.dart';
import 'package:habbito/core/common/presentation/widgets/app_textview_large.dart';
import 'package:habbito/core/common/presentation/widgets/app_textview_small.dart';
import 'package:habbito/features/chat/data/models/chat_model.dart';
import 'package:habbito/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:habbito/features/chat/presentation/widgets/chat_reciever_card.dart';
import 'package:habbito/features/chat/presentation/widgets/chat_sender_card.dart';
import 'package:habbito/themes/theme.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController chatInputController = TextEditingController();
  ScrollController? _scrollController;

  final ValueNotifier<bool> _isFabVisible = ValueNotifier(true);

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController?.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController?.removeListener(_scrollListener);
    _scrollController?.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    _scrollController?.animateTo(
      _scrollController!.position.maxScrollExtent,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  void _scrollListener() {
    if (_scrollController?.position.userScrollDirection ==
        ScrollDirection.reverse) {
      if (_isFabVisible.value) {
        _isFabVisible.value = false;
      }
    } else if (_scrollController?.position.userScrollDirection ==
        ScrollDirection.forward) {
      if (!_isFabVisible.value) {
        _isFabVisible.value = true;
      }
    }
  }

  final List<ChatModel> chatlist = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightColor,
      appBar: AppBar(
        centerTitle: true,
        title: const AppTextViewLarge(
          message: 'Bot Habbito',
          textAlign: TextAlign.center,
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            BlocBuilder<ChatBloc, ChatState>(
              builder: (context, state) {
                if (state is ChatSuccess) {
                  final res = state.response;

                  if (res.isNotEmpty) {
                    final chatresponse = ChatModel(
                        message: res, imagepath: 'imagepath', issender: false);
                    chatlist.add(chatresponse);
                  }
                }

                return chatlist.isNotEmpty
                    ? ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: chatlist.length,
                        itemBuilder: (context, index) {
                          final ct = chatlist[index];
                          final singlechat = ct.message;
                          return ct.issender
                              ? ChatSenderCard(
                                  messsage: singlechat, issender: ct.issender)
                              : ChatRecieverCard(
                                  messsage: singlechat, issender: ct.issender);
                        },
                      )
                    : const Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 50),
                          child: AppTextViewSubtitleSmall(
                            padding: 30,
                            weight: FontWeight.w300,
                            text:
                                'Hi and Welcome,  Bot Habbito, Here you Ask Anything habbits..',
                            textAlign: TextAlign.start,
                          ),
                        ),
                      );
              },
            ),
            BlocBuilder<ChatBloc, ChatState>(
              builder: (context, state) {
                if (state is ChatLoading) {
                  bool issender = true;

                  if (chatlist.isNotEmpty) {
                    issender = chatlist.last.issender;
                  }

                  return Row(
                    children: [
                      Expanded(
                        child: Visibility(
                          visible: !issender,
                          child: Image.asset(
                            'assets/images/chatloading.gif',
                            height: 50,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Visibility(
                          visible: issender,
                          child: Image.asset(
                            'assets/images/chatloading.gif',
                            height: 50,
                          ),
                        ),
                      ),
                    ],
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ValueListenableBuilder(
        valueListenable: _isFabVisible,
        builder: (context, value, child) {
          return value
              ? Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Card(
                    surfaceTintColor: kLightColor,
                    margin: EdgeInsets.zero,
                    shadowColor: kLightColor,
                    elevation: 0,
                    color: kLightColor,
                    child: Row(
                      children: [
                        Expanded(
                          child: AppEditText(
                            controller: chatInputController,
                            type: TextInputType.text,
                            inputHint: 'Ask anything Habbits...',
                          ),
                        ),
                        BlocBuilder<ChatBloc, ChatState>(
                          builder: (context, state) {
                            if (state is ChatLoading) {
                              return const IconButton(
                                  onPressed: null,
                                  icon: Icon(
                                    Icons.send,
                                  ));
                            }
                            return IconButton(
                                onPressed: () {
                                  final chat = chatInputController.text;
                                  if (chat.isNotEmpty) {
                                    final chatrequest = ChatModel(
                                        message: chat,
                                        imagepath: 'imagepath',
                                        issender: true);

                                    chatlist.add(chatrequest);
                                    context
                                        .read<ChatBloc>()
                                        .add(InitiateChat(prompt: chat));
                                    chatInputController.clear();

                                    _scrollToBottom();
                                  }
                                },
                                icon: Icon(
                                  Icons.send,
                                  color: kPrimaryDark,
                                ));
                          },
                        ),
                        const SizedBox(
                          width: 10,
                        )
                      ],
                    ),
                  ),
                )
              : const SizedBox.shrink();
        },
      ),
    );
  }
}
