import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import './route_export.dart';

final _key = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>(
  (ref) {
    // final authState = ref.watch(authProvider);

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
          path: SignUp.route,
          builder: (_, __) => const SignUp(),
        ),
        GoRoute(
          path: '/:tab(home|notification|search|account)',
          builder: (_, state) {
            final tab = state.pathParameters['tab']!;
            return ButtomNav(tab: tab);
          },
        ),
        GoRoute(
          path: HomeView.route,
          // builder: (context, state) => const HomeView(),
          redirect: (_, __) => HomeView.route,
        )
      ],
      // redirect: (context, state) {
      //   // If our async state is loading, don't perform redirects, yet
      //   if (authState.isLoading || authState.hasError) return null;

      //   // Here we guarantee that hasData == true, i.e. we have a readable value

      //   // This has to do with how the FirebaseAuth SDK handles the "log-in" state
      //   // Returning `null` means "we are not authorized"
      //   final isAuth = authState.valueOrNull != null;

      //   final isSplash = state.location == SplashPage.routeLocation;
      //   if (isSplash) {
      //     return isAuth ? HomePage.routeLocation : LoginPage.routeLocation;
      //   }

      //   final isLoggingIn = state.location == LoginPage.routeLocation;
      //   if (isLoggingIn) return isAuth ? HomePage.routeLocation : null;

      //   return isAuth ? null : SplashPage.routeLocation;
      // },
    );
  },
);
