import 'package:flutter/material.dart';
import 'package:joke_app/providers/joke_provider.dart';
import 'package:joke_app/widgets/custom_app_bar.dart';
import 'package:joke_app/widgets/joke_card.dart';
import 'package:provider/provider.dart';

class FavoriteJokesScreen extends StatelessWidget {
  const FavoriteJokesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final jokeProvider = Provider.of<FavoriteJokesProvider>(context);

    return Scaffold(
      appBar: const CustomAppBar(title: "Favorite Jokes"),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xffaa076b), Color(0xff61045f)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
          )
        ),
        child: jokeProvider.favorites.isEmpty
        ? const Center(
            child: Text("No favorite jokes yet"),
          )
        : ListView.builder(
            itemCount: jokeProvider.favorites.length,
            itemBuilder: (context, index) {
              final joke = jokeProvider.favorites[index];
              return JokeCard(
                joke: joke,
                showFavoriteButton: false,
              );
            },
          ),
      )
    );
  }
}