import 'package:flutter/material.dart';

class MovieItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final double rating;
  final String releaseDate;
  bool isFavorite;

  MovieItem({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.rating,
    required this.releaseDate,
    this.isFavorite = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(imageUrl),
      title: Text(title),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Rating: $rating'),
          Text('Release Date: $releaseDate'),
        ],
      ),
      trailing: IconButton(
        icon: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          color: isFavorite ? Colors.red : null,
        ),
        onPressed: () {
          // Toggle favorite status
          isFavorite = !isFavorite;
          // Rebuild the UI
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                  isFavorite ? 'Added to favorites' : 'Removed from favorites'),
            ),
          );
        },
      ),
    );
  }
}
