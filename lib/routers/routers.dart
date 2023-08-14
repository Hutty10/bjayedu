import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../controllers/providers.dart';
import './route_export.dart';

final _key = GlobalKey<NavigatorState>();
final _shellNavigatorHomekey = GlobalKey<NavigatorState>();
final _shellNavigatorNotificationkey = GlobalKey<NavigatorState>();
final _shellNavigatorSearchkey = GlobalKey<NavigatorState>();
final _shellNavigatorProfilekey = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>(
  (ref) {
    final authState = ref.watch(authStateProvider);

    return GoRouter(
      navigatorKey: _key,
      debugLogDiagnostics: true,
      initialLocation: GetStartedView.route,
      routes: [
        GoRoute(
          path: GetStartedView.route,
          builder: (_, __) => const GetStartedView(),
        ),
        GoRoute(
          path: LoginView.route,
          builder: (_, __) => const LoginView(),
        ),
        GoRoute(
          path: RegisterView.route,
          builder: (_, __) => const RegisterView(),
        ),
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) =>
              ScaffoldWithNestedNavigation(
            navigationShell: navigationShell,
          ),
          branches: [
            StatefulShellBranch(
              navigatorKey: _shellNavigatorHomekey,
              routes: [
                GoRoute(
                  path: HomeView.route,
                  pageBuilder: (context, state) => const NoTransitionPage(
                    child: HomeView(),
                  ),
                  routes: [
                    GoRoute(
                      path: FirstGrade.route,
                      builder: (_, __) => const FirstGrade(),
                    ),
                    GoRoute(
                      path: SecondGrade.route,
                      builder: (_, __) => const SecondGrade(),
                    ),
                    GoRoute(
                      path: ThirdGrade.route,
                      builder: (_, __) => const ThirdGrade(),
                    ),
                    GoRoute(
                      path: FourthGrade.route,
                      builder: (_, __) => const FourthGrade(),
                    ),
                    GoRoute(
                      path: FifthGrade.route,
                      builder: (_, __) => const FifthGrade(),
                    ),
                    GoRoute(
                      path: SixthGrade.route,
                      builder: (_, __) => const SixthGrade(),
                    ),
                    GoRoute(
                      path: SeventhGrade.route,
                      builder: (_, __) => const SeventhGrade(),
                    ),
                    GoRoute(
                      path: EighthGrade.route,
                      builder: (_, __) => const EighthGrade(),
                    ),
                    GoRoute(
                      path: NinthGrade.route,
                      builder: (_, __) => const NinthGrade(),
                    ),
                  ],
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _shellNavigatorNotificationkey,
              routes: [
                GoRoute(
                  path: '/a',
                  pageBuilder: (context, state) => NoTransitionPage(
                    child: Container(
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _shellNavigatorSearchkey,
              routes: [
                GoRoute(
                  path: '/b',
                  pageBuilder: (context, state) => NoTransitionPage(
                    child: Container(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _shellNavigatorProfilekey,
              routes: [
                GoRoute(
                  path: ProfileView.route,
                  pageBuilder: (context, state) => const NoTransitionPage(
                    child: ProfileView(),
                  ),
                ),
              ],
            ),
          ],
        ),
        // GoRoute(
        //   path: '/:tab(home|notification|search|profile)',
        //   builder: (_, state) {
        //     final tab = state.pathParameters['tab']!;
        //     return ButtomNav(tab: tab);
        //   },
        // ),
        // GoRoute(
        //   path: HomeView.route,
        //   redirect: (_, __) => HomeView.route,
        // ),
        // GoRoute(
        //   path: ProfileView.route,
        //   redirect: (_, __) => ProfileView.route,
        // ),
      ],
      redirect: (context, state) {
        // If our async state is loading, don't perform redirects, yet
        if (authState.isLoading || authState.hasError) return null;

        // Here we guarantee that hasData == true, i.e. we have a readable value

        // This has to do with how the FirebaseAuth SDK handles the "log-in" state
        // Returning `null` means "we are not authorized"
        final isAuth = authState.valueOrNull != null;

        // final isSplash = state.location == SplashPage.routeLocation;
        // if (isSplash) {
        //   return isAuth ? HomePage.routeLocation : LoginPage.routeLocation;
        // }

        final isLoggingIn = state.matchedLocation == LoginView.route;
        if (isLoggingIn) {
          return isAuth ? HomeView.route : null;
        }

        final isRegistering = state.matchedLocation == RegisterView.route;
        if (isRegistering) return isAuth ? HomeView.route : null;

        return isAuth ? null : LoginView.route;
      },
    );
  },
);
