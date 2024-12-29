import 'package:flutter/material.dart';
import 'package:joke_app/models/joke_model.dart';

class FavoriteJokesProvider with ChangeNotifier {
  final List<Joke> _favorites = [];

  List<Joke> get favorites => _favorites;

  void toggleFavorite(Joke joke) {
    if(_favorites.contains(joke)) {
      _favorites.remove(joke);
    } else {
      _favorites.add(joke);
    }
    notifyListeners();
  }
}