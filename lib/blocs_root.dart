import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habbito/di/injection.dart';
import 'package:habbito/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:habbito/main.dart';

class BlocsRoot extends StatelessWidget {
  const BlocsRoot({
    super.key,
    required this.apptoken,
  });

  final String apptoken;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<ChatBloc>()), 
      ],
      child: MyApp(token: apptoken,),
    );
  }
}
