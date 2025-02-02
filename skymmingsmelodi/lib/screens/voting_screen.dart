import 'package:flutter/material.dart';
import 'dart:async';
import '../models/contestant.dart';
import '../widgets/voting_carousel.dart';

class VotingScreen extends StatefulWidget {
  const VotingScreen({super.key});

  @override
  _VotingScreenState createState() => _VotingScreenState();
}

class _VotingScreenState extends State<VotingScreen> {
  final List<Contestant> contestants = [
    Contestant(id: '1', name: 'Alice Aurora', imageUrl: 'https://via.placeholder.com/150'),
    Contestant(id: '2', name: 'Lunar Eclipse', imageUrl: 'https://via.placeholder.com/150'),
    Contestant(id: '3', name: 'Solar Flare', imageUrl: 'https://via.placeholder.com/150'),
  ];

  DateTime votingStartTime = DateTime.now().add(const Duration(seconds: 10)); // Change this for real voting time
  DateTime votingEndTime = DateTime.now().add(const Duration(minutes: 2)); // Voting lasts 2 minutes
  Timer? _timer;
  Duration _remainingTime = const Duration(seconds: 0);
  bool isVotingOpen = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final now = DateTime.now();
      if (now.isBefore(votingStartTime)) {
        setState(() {
          isVotingOpen = false;
          _remainingTime = votingStartTime.difference(now);
        });
      } else if (now.isBefore(votingEndTime)) {
        setState(() {
          isVotingOpen = true;
          _remainingTime = votingEndTime.difference(now);
        });
      } else {
        setState(() {
          isVotingOpen = false;
          _remainingTime = Duration.zero;
          timer.cancel();
        });
      }
    });
  }

  void _overrideVoting(bool open) {
    setState(() {
      isVotingOpen = open;
      _remainingTime = open ? votingEndTime.difference(DateTime.now()) : Duration.zero;
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Vote for Your Favorite')),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            isVotingOpen ? 'Voting Closes In: ${_remainingTime.inSeconds}s' : 'Voting is Closed',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: isVotingOpen
                ? VotingCarousel(contestants: contestants)
                : const Center(child: Text('Voting is not available right now.')),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => _overrideVoting(!isVotingOpen),
            child: Text(isVotingOpen ? 'End Voting' : 'Start Voting'),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}