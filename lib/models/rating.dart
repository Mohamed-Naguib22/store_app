class Rating {
  final double rate;
  final int count;

  Rating({
    required this.rate,
    required this.count,
  });

  factory Rating.fromJson(json) {
    return Rating(
      count: json['count'],
      rate: json['rate'],
    );
  }
}
