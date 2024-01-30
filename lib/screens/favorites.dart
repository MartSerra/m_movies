import "package:flutter/material.dart";
import "package:m_movies/models/favorites.dart";
import "package:m_movies/views/favorite_item.dart";
import "package:provider/provider.dart";

class FavoritesPage extends StatelessWidget {
  static const routeName = 'favorites_page';
  static const fullPath = '/$routeName';
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: Consumer<Favorites>(
        builder: (context, value, child) => value.items.isNotEmpty
            ? ListView.builder(
                itemCount: value.items.length,
                padding: const EdgeInsets.symmetric(vertical: 16),
                itemBuilder: (context, index) =>
                    FavoriteItemTile(value.items[index]),
              )
            : const Center(
                child: Text('No favorites added.'),
              ),
      ),
    );
  }
}
