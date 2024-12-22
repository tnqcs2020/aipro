import 'package:aipro/main_wrapper.dart';
import 'package:aipro/screen/about_us/about_us_screen.dart';
import 'package:aipro/screen/ai_camera/ai_camera_screen.dart';
import 'package:aipro/screen/chat/chat_screen.dart';
import 'package:aipro/screen/help/help_screen.dart';
import 'package:aipro/screen/home/home_screen.dart';
import 'package:aipro/screen/home/sub_home.dart';
import 'package:aipro/screen/rate_us/rate_us_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class AppNavigation {
  AppNavigation._();
  static String initR = '/home';
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _rootNavigatorHome =
      GlobalKey<NavigatorState>(debugLabel: 'shellHome');
  static final _rootNavigatorAICamera =
      GlobalKey<NavigatorState>(debugLabel: 'shellAICamera');
  static final _rootNavigatorChat =
      GlobalKey<NavigatorState>(debugLabel: 'shellChat');
  static final _rootNavigatorHelp =
      GlobalKey<NavigatorState>(debugLabel: 'shellHelp');
  static final _rootNavigatorAboutUs =
      GlobalKey<NavigatorState>(debugLabel: 'shellAboutUs');
  static final _rootNavigatorRateUs =
      GlobalKey<NavigatorState>(debugLabel: 'shellRateUs');
  static final GoRouter router = GoRouter(
    initialLocation: initR,
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainWrapper(navigationShell: navigationShell);
        },
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            navigatorKey: _rootNavigatorHome,
            routes: [
              GoRoute(
                path: '/home',
                name: 'Home',
                builder: (context, state) {
                  return HomeScreen(
                    key: state.pageKey,
                  );
                },
                routes: [
                  GoRoute(
                    path: 'subHome',
                    name: 'SubHome',
                    builder: (context, state) {
                      return SubHomeScreen(key: state.pageKey);
                    },
                  )
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _rootNavigatorAICamera,
            routes: [
              GoRoute(
                path: '/aiCamera',
                name: 'AICamera',
                builder: (context, state) {
                  return AICameraScreen(
                    key: state.pageKey,
                  );
                },
              )
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _rootNavigatorChat,
            routes: [
              GoRoute(
                path: '/chat',
                name: 'Chat',
                builder: (context, state) {
                  return ChatScreen(
                    key: state.pageKey,
                  );
                },
              )
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _rootNavigatorHelp,
            routes: [
              GoRoute(
                path: '/help',
                name: 'Help',
                builder: (context, state) {
                  return HelpScreen(
                    key: state.pageKey,
                  );
                },
              )
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _rootNavigatorAboutUs,
            routes: [
              GoRoute(
                path: '/aboutUs',
                name: 'AboutUs',
                builder: (context, state) {
                  return AboutUsScreen(
                    key: state.pageKey,
                  );
                },
              )
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _rootNavigatorRateUs,
            routes: [
              GoRoute(
                path: '/rateUs',
                name: 'RateUs',
                builder: (context, state) {
                  return RateUsScreen(
                    key: state.pageKey,
                  );
                },
              )
            ],
          ),
        ],
      )
    ],
  );
}
