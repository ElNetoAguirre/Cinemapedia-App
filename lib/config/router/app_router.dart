import "package:go_router/go_router.dart";

import "package:cinemapedia/presentation/screens/screens.dart";
// import "package:cinemapedia/presentation/views/views.dart";

final appRouter = GoRouter(
  initialLocation: "/home/0",
  routes: [
    
    GoRoute(
      path: "/home/:page",
      name: HomeScreen.name,
      builder: (context, state) {
        final pageIndex = int.parse(state.pathParameters["page"] ?? "0");
        return HomeScreen(pageIndex: pageIndex);
      },
      routes: [
         GoRoute(
          path: "movie/:id",
          name: MovieScreen.name,
          builder: (context, state) {
            final movieId = state.pathParameters["id"] ?? "no-id";
            return MovieScreen(movieId: movieId);
          },
        ),
      ]
    ),

    GoRoute(
      path: "/",
      // redirect: (_ , __) => "/",
      redirect: (_ , __) => "/home/0",
    ),
  ]
);






// final appRouter = GoRouter(initialLocation: "/", routes: [
//   // State-Preserving
//   StatefulShellRoute.indexedStack(
//     builder: (context, state, navigationShell) => HomeScreen(childView: navigationShell, pageIndex: null,),
    
//     branches: [
//       StatefulShellBranch(routes: <RouteBase>[
//         GoRoute(
//           path: "/",
//           builder: (context, state) {
//             return const HomeView();
//           },
//           routes: [
//             GoRoute(
//               path: "movie/:id",
//               name: MovieScreen.name,
//               builder: (context, state) {
//                 final movieId = state.pathParameters["id"] ?? "no-id";
//                 return MovieScreen(movieId: movieId);
//               },
//             ),
//           ]
//         )
//       ]),
//       StatefulShellBranch(routes: <RouteBase>[
//         GoRoute(
//           path: "/popular",
//           builder: (context, state) {
//             return const PopularView();
//           },
//         )
//       ]),
//       StatefulShellBranch(routes: <RouteBase>[
//         GoRoute(
//           path: "/favorites",
//           builder: (context, state) {
//             return const FavoritesView();
//           },
//         )
//       ]),
//     ]
//   ),

// // final appRouter = GoRouter(initialLocation: "/home/0", routes: [
//   // ShellRoute(
//   //   builder: (context, state, child) {
//   //     return HomeScreen(childView: child);
//   //   },
//   //   routes: [
//   //     GoRoute(
//   //       path: "/home/:page",
//   //       builder: (context, state) {
//   //         return const HomeView();
//   //       },
//   //       routes: [
//   //         GoRoute(
//   //           path: "movie/:id",
//   //           name: MovieScreen.name,
//   //           builder: (context, state) {
//   //             final movieId = state.pathParameters["id"] ?? "no-id";
//   //             return MovieScreen(movieId: movieId);
//   //           },
//   //         ),
//   //       ],
//   //     ),

//   //     GoRoute(
//   //        path: "/",
//   //        redirect: (_, __) => "/home/0",
//   //      ),

//   //     GoRoute(
//   //       path: "/favorites",
//   //       builder: (context, state) {
//   //         return const FavoritesView();
//   //       },
//   //     ),
//   //   ]
//   // )

//   // Rutas Padre/Hijo
//   // GoRoute(
//   //   path: "/home/:page",
//   //   name: HomeScreen.name,
//   //   builder: (context, state) {
//   //      final pageIndex = int.parse(state.params["page"] ?? "0");
//   //      return HomeScreen(pageIndex: pageIndex);
//   //   }
//   //   routes: [
//   //     GoRoute(
//   //       path: "movie/:id",
//   //       name: MovieScreen.name,
//   //       builder: (context, state) {
//   //         final movieId = state.pathParameters["id"] ?? "no-id";
//   //         return MovieScreen(movieId: movieId);
//   //       },
//   //     ),
//   //     GoRoute(
//   //        path: "/",
//   //        redirect: (_, __) => "/home/0",
//   //      ),
//   //   ]
//   // ),
//   // ]);
// ]);
