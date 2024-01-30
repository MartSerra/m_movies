import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:m_movies/screens/favorites.dart';
import 'package:m_movies/views/item.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Most Popular'),
        actions: [
          TextButton.icon(
            onPressed: () {
              context.go(FavoritesPage.fullPath);
            },
            icon: const Icon(Icons.favorite_border),
            label: const Text('Favorites'),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 100,
        cacheExtent: 20.0,
        controller: ScrollController(),
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemBuilder: (context, index) => ItemTile(index),
      ),
    );
  }
}
