import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habbito/core/common/constants/app_strings.dart';
import 'package:habbito/core/common/constants/routes.dart';
import 'package:habbito/core/common/presentation/widgets/scaffold_with_navbar.dart';
import 'package:habbito/features/about/presentation/pages/about_page.dart';
import 'package:habbito/features/chat/presentation/pages/chat_page.dart';
import 'package:habbito/features/home/presentation/pages/home_page.dart';
import 'package:habbito/features/home/presentation/pages/topic_details_page.dart';
import 'package:habbito/features/personal/data/models/habbit_model.dart';
import 'package:habbito/features/personal/presentation/pages/add_habbit_page.dart';
import 'package:habbito/features/personal/presentation/pages/habbit_details_page.dart';
import 'package:habbito/features/personal/presentation/pages/personal_page.dart';
import 'package:habbito/features/topics/presentation/pages/topics_page.dart';
import 'package:habbito/themes/theme.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

//  Set up nested navigation using ShellRoute,
// which is a pattern where an additional Navigator is placed in the widget tree
// to be used instead of the root navigator. This allows deep-links to display
// pages along with other UI components such as a BottomNavigationBar.
//
// Display a route within a ShellRoute and also
// push a screen using a different navigator (such as the root Navigator) by
// providing a `parentNavigatorKey`.

///  How to use [ShellRoute]
class App extends StatelessWidget {
  /// Creates a [App]
  App({super.key}) {
    // checkForUpdate();
  }

  final GoRouter _router = GoRouter(
    navigatorKey: _rootNavigatorKey,

    // initialLocation:
    initialLocation: home_page_route,
    routes: <RouteBase>[
      /// Application shell
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        pageBuilder: (BuildContext context, GoRouterState state, Widget child) {
          return NoTransitionPage(child: ScaffoldWithNavBar(child: child));
        },
        routes: <RouteBase>[
          GoRoute(
              path: home_page_route,
              builder: (BuildContext context, GoRouterState state) {
                return const HomePage();
              },
              routes: [
                GoRoute(
                  path: topic_details_index,
                  builder: (BuildContext context, GoRouterState state) {
                    return TopicDetailsPage(
                      title: state.extra as String,
                    );
                  },
                ),
              ]),
          GoRoute(
              path: topics_page_index,
              builder: (BuildContext context, GoRouterState state) {
                return const TopicsPage();
              },
              routes: [
                GoRoute(
                  path: topic_details_index,
                  builder: (BuildContext context, GoRouterState state) {
                    return TopicDetailsPage(
                      title: state.extra as String,
                    );
                  },
                ),
              ]),
          GoRoute(
            path: chat_page_index,
            builder: (BuildContext context, GoRouterState state) {
              return const ChatPage();
            },
          ),
          GoRoute(
              path: personal_page_index,
              builder: (BuildContext context, GoRouterState state) {
                return const PersonalPage();
              },
              routes: [
                GoRoute(
                  path: add_babbit_index,
                  builder: (BuildContext context, GoRouterState state) {
                    return const AddHabbitPage();
                  },
                ),
                GoRoute(
                  path: habbit_details_index,
                  builder: (BuildContext context, GoRouterState state) {
                    return HabbitDetailsPage(
                      habbit: state.extra as HabbitModel,
                    );
                  },
                ),
              ]),
          GoRoute(
            path: about_page_index,
            builder: (BuildContext context, GoRouterState state) {
              return const AboutPage();
            },
          ),
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: app_title,
      theme: AppTheme.main(),
      routerConfig: _router,
    );
  }
}
