import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:habbito/app.dart';
import 'package:habbito/blocs_root.dart';
import 'package:habbito/core/common/constants/app_strings.dart';
import 'package:habbito/core/common/data/datasources/local/storage_utils.dart';
import 'package:habbito/core/common/utils/app_global_observer.dart';
import 'package:habbito/di/injection.dart';
import 'package:habbito/themes/theme.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  EquatableConfig.stringify = kDebugMode;
  if (kReleaseMode) {
    await dotenv.load(fileName: ".env");
  } else {
    await dotenv.load(fileName: ".dev.env");
  }

    await configureDependencies();


  final apptoken = await getIt<StorageUtils>().getDataForSingle(
    key: token,
  );
  if (kDebugMode) {
    Bloc.observer = AppGlobalBlocObserver();
  }


  /// Please add all BloCs ref to [BlocsRoot]
  runApp(BlocsRoot(apptoken: apptoken));
}

class MyApp extends StatelessWidget {
  final String token;
  const MyApp({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: app_title,
      theme: AppTheme.main(),
      home: App(),
    );
  }
}
