class Joke {
  final String type;
  final String setup;
  final String punchline;

  Joke({required this.type, required this.setup, required this.punchline});

  factory Joke.fromJson(Map<String, dynamic> json) {
    return Joke(
      type: json['type'],
      setup: json['setup'],
      punchline: json['punchline']
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Joke &&
        other.setup == setup &&
        other.punchline == punchline;
  }

  @override
  int get hashCode => Object.hash(setup, punchline);
}