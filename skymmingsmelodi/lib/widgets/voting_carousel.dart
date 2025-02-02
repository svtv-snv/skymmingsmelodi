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
          return AnimatedBuilder(
            animation: _pageController,
            builder: (context, child) {
              double value = 1.0;
              if (_pageController.position.haveDimensions) {
                value = _pageController.page! - index;
                value = (1 - (value.abs() * 0.2)).clamp(0.0, 1.0);
              }

              return Transform.scale(
                scale: value,
                child: child,
              );
            },
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