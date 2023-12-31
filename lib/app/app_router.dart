import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:starter_kit_flutter/core/presentation/bottom_nav.dart';
import 'package:starter_kit_flutter/core/presentation/page_not_found.dart';
import 'package:starter_kit_flutter/features/home/presentation/home_screen.dart';
import 'package:starter_kit_flutter/features/story/presentation/story_screen.dart';

GoRouter router = GoRouter(
  debugLogDiagnostics: true,
  errorBuilder: (context, state) {
    return const PageNotFound();
  },
  initialLocation: '/home',
  routes: [
    ShellRoute(
      routes: [
        GoRoute(
          path: '/home',
          name: 'home',
          pageBuilder: (context, state) => PageAnimation(key: state.pageKey, child: const HomeScreen()),
          routes: [
            GoRoute(
              path: 'story/:initId',
              name: 'story',
              pageBuilder: (context, state) {
                final id = state.params['initId'];
                return PageAnimation(key: state.pageKey, child: StoryScreen(initId: id));
              },
            ),
          ]
        ),
      ],
      builder: (context, state, child) {
        if (state.params['initId'] != null) {
          return SizedBox(
            child: child,
          );
        }
        return BottomNav(child: child);
      },
    ),

  ],
);

class PageAnimation extends CustomTransitionPage {
  PageAnimation({
    required LocalKey key,
    required super.child,
  }) : super(
          transitionDuration: const Duration(milliseconds: 200),
          key: key,
          transitionsBuilder: (context, animation, secondaryAnimation, child) => SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 1),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
}
