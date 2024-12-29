import 'package:flutter/material.dart';
import 'package:joke_app/models/joke_model.dart';
import 'package:joke_app/providers/joke_provider.dart';
import 'package:provider/provider.dart';

class JokeCard extends StatelessWidget {
  final Joke joke;
  final bool showFavoriteButton;

  const JokeCard({
    super.key, 
    required this.joke,
    required this.showFavoriteButton,
  });

  @override
  Widget build(BuildContext context) {
    final jokeProvider = Provider.of<FavoriteJokesProvider>(context);
    final isFavorite = jokeProvider.favorites.contains(joke);

    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        title: Text(
          joke.setup,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Color(0xff61045f),
          ),
        ),
        subtitle: Text(
          joke.punchline,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w400,
            color: Color(0xffaa076b),
          ),
        ),
        trailing: showFavoriteButton 
          ? IconButton(
              icon: Icon(
                isFavorite == true ? Icons.favorite : Icons.favorite_border,
                color: isFavorite == true ? const Color(0xff61045f) : Colors.grey,
              ),
              onPressed: () {
                jokeProvider.toggleFavorite(joke);
              },
            )
          : null,
      ),
    );
  }
}
