import 'package:flutter/material.dart';
import 'package:joke_app/models/joke_model.dart';
import 'package:joke_app/screens/favorite_jokes_screen.dart';
import 'package:joke_app/services/api_service.dart';
import 'package:joke_app/widgets/custom_app_bar.dart';
import 'package:joke_app/widgets/joke_card.dart';

class JokesScreen extends StatefulWidget {
  final String type;
  
  const JokesScreen({super.key, required this.type});

  @override
  State<JokesScreen> createState() => _JokesScreenState();
}

class _JokesScreenState extends State<JokesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "${widget.type[0].toUpperCase()}${widget.type.substring(1)} Jokes",
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => const FavoriteJokesScreen(),
                )
              );
            },
          )
        ],  
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xffaa076b), Color(0xff61045f)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
          )
        ),
        child: FutureBuilder<List<Map<String, dynamic>>>(
          future: ApiService.getJokesByType(widget.type),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Padding(
                padding: EdgeInsets.all(16.0),
                child: Center(child: LinearProgressIndicator()),
              );
            } else if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}", style: const TextStyle(color: Colors.white),));
            } else if (snapshot.hasData) {
              final jokes = snapshot.data!.map((data) => Joke.fromJson(data)).toList();
              return ListView.builder(
                itemCount: jokes.length,
                itemBuilder: (context, index) {
                  final joke = jokes[index];
                  return JokeCard(
                    joke: joke,
                    showFavoriteButton: true,
                  );
                },
              );
            } else {
              return const Center(child: Text("No jokes found", style: TextStyle(color: Colors.white)));
            }
          },
        ),
      ),
    );
  }
}