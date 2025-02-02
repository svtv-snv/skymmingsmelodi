import 'package:flutter/material.dart';
import '../models/contestant.dart';
import 'contestant_card.dart';

class VotingCarousel extends StatefulWidget {
  final List<Contestant> contestants;

  const VotingCarousel({super.key, required this.contestants});

  @override
  _VotingCarouselState createState() => _VotingCarouselState();
}

class _VotingCarouselState extends State<VotingCarousel> {
  final PageController _pageController = PageController(viewportFraction: 0.85);

  void updateContestantVotes(int index, int votes) {
    setState(() {
      widget.contestants[index].updateVotes(votes);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300, // Adjust based on design
      child: PageView.builder(
        controller: _pageController,
        itemCount: widget.contestants.length,
        itemBuilder: (context, index) {
          return AnimatedScale(
            scale: _pageController.positions.isNotEmpty && _pageController.page?.round() == index ? 1.1 : 1.0,
            duration: const Duration(milliseconds: 300),
            child: ContestantCard(
              contestant: widget.contestants[index],
              onVote: (votes) => updateContestantVotes(index, votes),
            ),
          );
        },
      ),
    );
  }
}