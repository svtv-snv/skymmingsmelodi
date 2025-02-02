import 'package:flutter/material.dart';
import '../models/contestant.dart';
import '../widgets/voting_carousel.dart';

class VotingScreen extends StatelessWidget {
  VotingScreen({super.key});

  final List<Contestant> contestants = [
    Contestant(id: '1', name: 'Alice Aurora', imageUrl: 'https://via.placeholder.com/150'),
    Contestant(id: '2', name: 'Lunar Eclipse', imageUrl: 'https://via.placeholder.com/150'),
    Contestant(id: '3', name: 'Solar Flare', imageUrl: 'https://via.placeholder.com/150'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Vote for Your Favorite')),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Expanded(child: VotingCarousel(contestants: contestants)),
          const SizedBox(height: 20),
          const Text('Swipe to vote', style: TextStyle(fontSize: 18)),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}