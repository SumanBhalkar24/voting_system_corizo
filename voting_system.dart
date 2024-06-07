import 'models.dart';

class VotingSystem {
  final List<User> users = [];
  final List<Candidate> candidates = [];

  void registerUser(String id, String name) {
    users.add(User(id: id, name: name));
  }

  void registerCandidate(String id, String name) {
    candidates.add(Candidate(id: id, name: name));
  }

  void vote(String userId, String candidateId) {
    User? user = users.firstWhere((user) => user.id == userId, orElse: () => null);
    Candidate? candidate = candidates.firstWhere((candidate) => candidate.id == candidateId, orElse: () => null);

    if (user == null) {
      print('User not found.');
      return;
    }
    if (candidate == null) {
      print('Candidate not found.');
      return;
    }
    if (user.hasVoted) {
      print('User has already voted.');
      return;
    }

    candidate.votes++;
    user.hasVoted = true;
  }

  List<Candidate> getResults() {
    return candidates;
  }
}
