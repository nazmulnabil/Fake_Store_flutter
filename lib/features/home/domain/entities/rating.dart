class Rating {
  Rating({
    this.rate,
    this.count,});

  Rating.fromJson(dynamic json) {
    rate = json['rate'];
    count = json['count'];
  }

  double? rate;
  int? count;
}