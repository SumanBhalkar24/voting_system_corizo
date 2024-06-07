import 'package:flutter/material.dart';
import 'voting_system.dart';
import 'models.dart';

void main() {
  runApp(VotingApp());
}

class VotingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: VotingHomePage(),
    );
  }
}

class VotingHomePage extends StatefulWidget {
  @override
  _VotingHomePageState createState() => _VotingHomePageState();
}

class _VotingHomePageState extends State<VotingHomePage> {
  final VotingSystem votingSystem = VotingSystem();
  final TextEditingController userIdController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController candidateIdController = TextEditingController();
  final TextEditingController candidateNameController = TextEditingController();
  final TextEditingController voterIdController = TextEditingController();
  final TextEditingController voteCandidateIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Online Voting System'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: userIdController,
                decoration: InputDecoration(labelText: 'User ID'),
              ),
              TextField(
                controller: userNameController,
                decoration: InputDecoration(labelText: 'User Name'),
              ),
              ElevatedButton(
                onPressed: () {
                  votingSystem.registerUser(userIdController.text, userNameController.text);
                  userIdController.clear();
                  userNameController.clear();
                  setState(() {});
                },
                child: Text('Register User'),
              ),
              TextField(
                controller: candidateIdController,
                decoration: InputDecoration(labelText: 'Candidate ID'),
              ),
              TextField(
                controller: candidateNameController,
                decoration: InputDecoration(labelText: 'Candidate Name'),
              ),
              ElevatedButton(
                onPressed: () {
                  votingSystem.registerCandidate(candidateIdController.text, candidateNameController.text);
                  candidateIdController.clear();
                  candidateNameController.clear();
                  setState(() {});
                },
                child: Text('Register Candidate'),
              ),
              TextField(
                controller: voterIdController,
                decoration: InputDecoration(labelText: 'Your User ID'),
              ),
              TextField(
                controller: voteCandidateIdController,
                decoration: InputDecoration(labelText: 'Candidate ID to Vote For'),
              ),
              ElevatedButton(
                onPressed: () {
                  votingSystem.vote(voterIdController.text, voteCandidateIdController.text);
                  voterIdController.clear();
                  voteCandidateIdController.clear();
                  setState(() {});
                },
                child: Text('Vote'),
              ),
              SizedBox(height: 20),
              Text('Results:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ListView.builder(
                shrinkWrap: true,
                itemCount: votingSystem.getResults().length,
                itemBuilder: (context, index) {
                  final candidate = votingSystem.getResults()[index];
                  return ListTile(
                    title: Text(candidate.name),
                    subtitle: Text('Votes: ${candidate.votes}'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
