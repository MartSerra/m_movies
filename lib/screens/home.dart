import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:m_movies/screens/favorites.dart';
import 'package:m_movies/views/movie.dart';
import 'package:tmdb_api/tmdb_api.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/';

  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List popularMovies = [];
  final String apiKey = 'API_KEY';
  final String readAccessToken = 'READ_ACCESS_TOKEN';

  @override
  void initState() {
    super.initState();

    loadMovies();
  }

  loadMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apiKey, readAccessToken),
        logConfig: const ConfigLogger(
          showLogs: true,
          showErrorLogs: true,
        ));

    Map moviesResult = await tmdbWithCustomLogs.v3.movies.getPopular();
    setState(() {
      popularMovies = moviesResult['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    const tmdbImageUrl = "https://image.tmdb.org/t/p/w500";
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
        itemCount: popularMovies.length,
        cacheExtent: 20.0,
        controller: ScrollController(),
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemBuilder: (context, index) => MovieItem(
          title: popularMovies[index]['title'] ?? 'Loading',
          imageUrl: tmdbImageUrl + popularMovies[index]['poster_path'],
          rating: popularMovies[index]['vote_average'],
          releaseDate: popularMovies[index]['release_date'],
        ),
      ),
    );
  }
}
