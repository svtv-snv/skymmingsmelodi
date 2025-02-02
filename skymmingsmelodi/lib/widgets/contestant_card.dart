import 'package:flutter/material.dart';
import '../models/contestant.dart';
import '../core/constants.dart';

class ContestantCard extends StatefulWidget {
  final Contestant contestant;
  final Function(int) onVote;

  const ContestantCard({super.key, required this.contestant, required this.onVote});

  @override
  _ContestantCardState createState() => _ContestantCardState();
}

class _ContestantCardState extends State<ContestantCard> {
  int selectedVotes = 0;

  @override
  void initState() {
    super.initState();
    selectedVotes = widget.contestant.votes;
  }

  void updateVotes(int votes) {
    setState(() {
      selectedVotes = votes;
    });
    widget.onVote(votes);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.primary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.network(widget.contestant.imageUrl, height: 150, width: double.infinity, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Text(widget.contestant.name, style: Theme.of(context).textTheme.bodyLarge),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (index) {
                    return GestureDetector(
                      onTap: () => updateVotes(index + 1),
                      child: Icon(
                        Icons.favorite,
                        color: index < selectedVotes ? Colors.red : AppColors.disabled,
                        size: 32,
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}