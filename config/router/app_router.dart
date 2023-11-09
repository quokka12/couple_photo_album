import 'package:go_router/go_router.dart';
import 'package:photo_album/config/router/router_names.dart';
import 'package:photo_album/config/router/transition.dart';
import 'package:photo_album/screens/bottom_bar/bottom_bar_screen.dart';
import 'package:photo_album/screens/splash/splash_screen.dart';

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
        name: RouteNames.bottomNavigationBar,
        path: '/' + RouteNames.bottomNavigationBar,
        pageBuilder: (context, state) => Trainsition.fadeTransition(state, BottomBarScreen()),
      ),
    ],
  );
}
