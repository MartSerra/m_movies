import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:m_movies/models/favorites.dart';
import 'package:m_movies/screens/favorites.dart';
import 'package:m_movies/screens/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

GoRouter router() {
  return GoRouter(
    routes: [
      GoRoute(
        path: HomePage.routeName,
        builder: (context, state) => const HomePage(),
        routes: [
          GoRoute(
              path: FavoritesPage.routeName,
              builder: (context, state) => const FavoritesPage()),
        ],
      ),
    ],
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Favorites>(
      create: (context) => Favorites(),
      child: MaterialApp.router(
        title: 'M Movies',
        theme: ThemeData(
          colorSchemeSeed: Colors.green,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          useMaterial3: true,
        ),
        routerConfig: router(),
      ),
    );
  }
}
