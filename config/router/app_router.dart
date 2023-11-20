import 'package:go_router/go_router.dart';
import 'package:photo_album/config/router/route_names.dart';
import 'package:photo_album/config/router/transition.dart';
import 'package:photo_album/screens/add_story/add_story_screen.dart';
import 'package:photo_album/screens/bottom_bar/bottom_bar_screen.dart';
import 'package:photo_album/screens/splash/splash_screen.dart';
import 'package:photo_album/screens/story_view/story_view_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        name: RouteNames.splash,
        path: '/',
        pageBuilder: (context, state) => Trainsition.fadeTransition(state, SplashScreen()),
      ),
      GoRoute(
          name: RouteNames.bottomBar,
          path: '/' + RouteNames.bottomBar,
          pageBuilder: (context, state) => Trainsition.fadeTransition(state, BottomBarScreen()),
          routes: [
            GoRoute(
              name: RouteNames.addStory,
              path: RouteNames.addStory,
              builder: (context, state) => AddStoryScreen(),
            ),
            GoRoute(
              name: RouteNames.storyView,
              path: RouteNames.storyView,
              builder: (context, state) => StoryViewScreen(),
            ),
          ]),
    ],
  );
}
