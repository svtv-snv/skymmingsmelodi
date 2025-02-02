class Contestant {
  final String id;
  final String name;
  final String imageUrl;
  int votes; // Hearts (0 to 5)

  Contestant({
    required this.id,
    required this.name,
    required this.imageUrl,
    this.votes = 0,
  });

  void updateVotes(int newVotes) {
    votes = newVotes;
  }
}