import 'package:clean/features/home/presentation/views/home_view.dart';
import 'package:clean/features/splash/presentation/views/splash_viwe.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';

  static const kDetailesView = '/detailesView';

  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, GoRouterState state) {
          return const SplashViwe();
        },
      ),
      GoRoute(
        path: kHomeView,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            child: const HomeView(),
            transitionDuration: const Duration(milliseconds: 600),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
          );
        },
      ),
    ],
  );
}
