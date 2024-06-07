class User {
  final String id;
  final String name;
  bool hasVoted;

  User({required this.id, required this.name, this.hasVoted = false});
}

class Candidate {
  final String id;
  final String name;
  int votes;

  Candidate({required this.id, required this.name, this.votes = 0});
}
